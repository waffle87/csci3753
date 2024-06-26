// Jack Sangdahl
// CSCI3753 SP24
// PA8 Predict
#include "../common/simulator.h"
#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

struct page_stat {
  int page;
  int freq;
  int *timestamp;
};

int active_page(int pc) { return pc / PAGESIZE; }

struct page_stat *
predict_page(int proc, int curr_pc,
             struct page_stat data[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES]) {
  return data[proc][active_page(curr_pc + 101)];
}

int page_count(struct page_stat *guesses) {
  int n = 0;
  while (guesses[n].page != -1 && n < MAXPROCPAGES)
    n++;
  return n;
}

void swap(struct page_stat *x, struct page_stat *y) {
  struct page_stat z = *x;
  *x = *y;
  *y = z;
}

void page_sort(struct page_stat *guesses) {
  int n = page_count(guesses);
  bool swapped;
  do {
    swapped = false;
    for (int i = 1; i < n; i++)
      if (guesses[i - 1].freq < guesses[i].freq) {
        swap(guesses + (i - 1), guesses + i);
        swapped = true;
      }
  } while (swapped);
}

bool find_lru_page(int time_stamps[MAXPROCESSES][MAXPROCPAGES],
                   Pentry q[MAXPROCESSES], int proc, int *lru_page) {
  int smallest_tick = INT_MAX;
  bool res = true;
  for (int i = 0; i < MAXPROCPAGES; i++)
    if (q[proc].pages[i] == 1 && time_stamps[proc][i] < smallest_tick) {
      *lru_page = i;
      smallest_tick = time_stamps[proc][i];
      res = false;
    }
  return res;
}

void update_page(
    int curr_page, int proc, int prev_page,
    struct page_stat data[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES],
    int time_stamps[MAXPROCESSES][MAXPROCPAGES]) {
  struct page_stat *new = data[proc][prev_page];
  for (int i = 0; i < MAXPROCPAGES; i++) {
    if (new[i].page == curr_page) {
      new[i].freq++;
      break;
    }
    if (new[i].page == -1) {
      new[i].page = curr_page;
      new[i].freq = 1;
      new[i].timestamp = &(time_stamps[proc][i]);
      break;
    }
  }
}

void pageit(Pentry q[MAXPROCESSES]) {
  static bool initialized = false, proc_active[MAXPROCESSES];
  static struct page_stat data[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES];
  static int proc_tmp, page_tmp, lru_page, prev_page, curr_page,
      tick = 1, time_stamps[MAXPROCESSES][MAXPROCPAGES], pc_prev[MAXPROCESSES];
  if (!initialized) {
    for (int i = 0; i < MAXPROCESSES; i++)
      for (int j = 0; j < MAXPROCESSES; j++)
        for (int k = 0; k < MAXPROCESSES; k++) {
          data[i][j][k].page = -1;
          data[i][j][k].freq = -1;
          data[i][j][k].timestamp = NULL;
        }
    for (proc_tmp = 0; proc_tmp < MAXPROCESSES; proc_tmp++) {
      for (page_tmp = 0; page_tmp < MAXPROCPAGES; page_tmp++)
        time_stamps[proc_tmp][page_tmp] = 0;
      proc_active[proc_tmp] = false;
    }
    initialized = true;
  }
  for (proc_tmp = 0; proc_tmp < MAXPROCESSES; proc_tmp++) {
    if (!q[proc_tmp].active)
      continue;
    prev_page = active_page(pc_prev[proc_tmp]);
    pc_prev[proc_tmp] = q[proc_tmp].pc;
    curr_page = active_page(q[proc_tmp].pc);
    if (prev_page == curr_page)
      continue;
    pageout(proc_tmp, prev_page);
    update_page(curr_page, proc_tmp, prev_page, data, time_stamps);
  }
  for (proc_tmp = 0; proc_tmp < MAXPROCESSES; proc_tmp++) {
    if (!q[proc_tmp].active)
      continue;
    page_tmp = (q[proc_tmp].pc - 1) / PAGESIZE;
    time_stamps[proc_tmp][page_tmp] = tick;
  }
  for (proc_tmp = 0; proc_tmp < MAXPROCESSES; proc_tmp++) {
    if (!q[proc_tmp].active) {
      for (page_tmp = 0; page_tmp < MAXPROCPAGES; page_tmp++)
        pageout(proc_tmp, page_tmp);
      continue;
    }
    page_tmp = q[proc_tmp].pc / PAGESIZE;
    if (q[proc_tmp].pages[page_tmp] == 1)
      continue;
    if (pagein(proc_tmp, page_tmp)) {
      proc_active[proc_tmp] = false;
      continue;
    }
    if (proc_active[proc_tmp])
      continue;
    if (find_lru_page(time_stamps, q, proc_tmp, &lru_page))
      continue;
    if (!pageout(proc_tmp, lru_page)) {
      fprintf(stderr, "error: failed to page out page %d\n", lru_page);
      exit(EXIT_FAILURE);
    }
    proc_active[proc_tmp] = true;
  }
  for (proc_tmp = 0; proc_tmp < MAXPROCESSES; proc_tmp++) {
    struct page_stat *predictions;
    if (!q[proc_tmp].active)
      continue;
    predictions = predict_page(proc_tmp, q[proc_tmp].pc, data);
    page_sort(predictions);
    for (int i = 0; i < page_count(predictions); i++)
      pagein(proc_tmp, predictions[i].page);
  }
  tick++;
}
