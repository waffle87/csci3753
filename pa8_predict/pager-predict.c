// Jack Sangdahl
// CSCI3753 SP24
// PA8 Predict
#include "simulator.h"
#include <stdbool.h>

#define LOWER_BOUND 0.00001
#define UPPER_BOUND 0.5

int predict_prev(int proc, int page,
                 int prev[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES]) {
  int prediction = -1, most_frequent = 0;
  for (int i = 0; i < MAXPROCPAGES; i++)
    if (prev[proc][page][i] > most_frequent) {
      most_frequent = prev[proc][page][i];
      prediction = i;
    }
  return prediction;
}

#pragma GCC push_options
#pragma GCC optimize("-O3")

void pageit(Pentry q[MAXPROCESSES]) {
  static bool initialised = false;
  static double fault_freq[MAXPROCESSES];
  static int tick = 1, timestamps[MAXPROCESSES][MAXPROCPAGES],
             prev[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES],
             allocate[MAXPROCESSES], frame_cnt[MAXPROCESSES],
             fault_cnt[MAXPROCESSES], hit_cnt[MAXPROCESSES],
             prev_pc[MAXPROCESSES][MAXPROCPAGES],
             curr_pc[MAXPROCESSES][MAXPROCPAGES],
             prev_status[MAXPROCESSES][MAXPROCPAGES][MAXPROCPAGES] = {{{0}}};
  int proc, pc, page, proc_running = 0, running[MAXPROCESSES], flag = 1,
                      total_pages = 0, total_allocated = 0;

  if (!initialised) {
    for (int i = 0; i < MAXPROCESSES; i++) {
      fault_freq[i] = 0;
      allocate[i] = 5;
      frame_cnt[i] = 0;
      fault_cnt[i] = 0;
      hit_cnt[i] = 0;
      for (int j = 0; j < MAXPROCPAGES; j++) {
        timestamps[i][j] = 0;
        prev_pc[i][j] = 0;
        curr_pc[i][j] = 0;
        for (int k = 0; k < MAXPROCPAGES; k++)
          prev[i][j][k] = 0;
      }
    }
    initialised = true;
  }

  for (int i = 0; i < MAXPROCESSES; i++)
    if (q[i].active) {
      running[proc_running] = i;
      proc_running++;
    } else {
      allocate[i] = 0;
      for (int j = 0; j < MAXPROCPAGES; j++)
        if (q[i].pages[j])
          pageout(i, j);
    }

  if (!proc_running)
    return;
  if (proc_running <= 7)
    flag = 0;
  for (int i = 0; i < proc_running; i++) {
    proc = running[i];
    pc = q[proc].pc;
    page = pc / PAGESIZE;
    if (!curr_pc[proc][page]) {
      prev_pc[proc][page] = pc;
      curr_pc[proc][page] = 1;
      for (int j = 0; j < MAXPROCPAGES; j++)
        prev_status[proc][page][j] = q[proc].pages[page] ? 1 : 0;
    }
    for (int i = 0; i < MAXPROCPAGES; i++)
      if (curr_pc[proc][i] && pc >= prev_pc[proc][i] + 170) {
        curr_pc[proc][i] = 0;
        prev[proc][i][page]++;
        if (pc == prev_pc[proc][i] + 170)
          prev[proc][i][page]++;
        for (int j = 0; j < MAXPROCPAGES; j++) {
          if (prev_status[proc][i][j] && !q[proc].pages[j] && j != page)
            prev[proc][i][j]--;
          if (pc == prev_pc[proc][i] + 170)
            prev[proc][i][j]--;
        }
      }
    for (int i = 0; i < MAXPROCPAGES; i++)
      timestamps[proc][i]++;
    timestamps[proc][page] = 0;
    if (flag) {
      for (int i = 0; i < MAXPROCESSES; i++) {
        frame_cnt[i] = 0;
        for (int j = 0; j < MAXPROCPAGES; j++)
          if (q[i].pages[j])
            frame_cnt[i]++;
        total_pages += frame_cnt[i];
        total_allocated += allocate[i];
      }
      for (int i = 0; i < MAXPROCESSES; i++)
        if (fault_freq[i] < LOWER_BOUND)
          if (frame_cnt[i] < allocate[i] && allocate[i] >= 5) {
            allocate[i]--;
            total_allocated--;
          }

      if (total_allocated < PHYSICALPAGES) {
        int i = 0;
        while (total_allocated < PHYSICALPAGES && i < MAXPROCESSES) {
          if (fault_freq[i] >= UPPER_BOUND && allocate[i] < 14) {
            allocate[i]++;
            total_allocated++;
          } else if (fault_freq[i] > UPPER_BOUND / 2 && allocate[i] < 10) {
            allocate[i]++;
            total_allocated++;
          } else if (allocate[i] < 8) {
            allocate[i]++;
            total_allocated++;
          }
          i++;
        }
      }
    }
    if (q[proc].pages[page]) {
      hit_cnt[proc]++;
      fault_freq[proc] = (double)fault_cnt[proc] / hit_cnt[proc];
      continue;
    } else {
      fault_cnt[proc]++;
      fault_freq[proc] =
          hit_cnt[proc] ? (double)fault_cnt[proc] / hit_cnt[proc] : UPPER_BOUND;
      if (!flag && pagein(proc, page))
        continue;
      else if (flag && frame_cnt[proc] < allocate[proc] && pagein(proc, page))
        continue;
      else if (flag && total_pages < PHYSICALPAGES &&
               total_allocated < PHYSICALPAGES && pagein(proc, page)) {
        allocate[proc]++;
        continue;
      } else {
        int evict_page = -1, lru = -10;
        for (int i = 0; i < MAXPROCPAGES; i++)
          if (q[proc].pages[i] && prev[proc][page][i] < lru && i != page) {
            evict_page = i;
            pageout(proc, evict_page);
          }
        if (evict_page == -1) {
          for (int i = 0; i < MAXPROCPAGES; i++) {
            if (!q[proc].pages[i])
              continue;
            if (timestamps[proc][i] > lru) {
              lru = timestamps[proc][i];
              evict_page = i;
            }
          }
          pageout(proc, evict_page);
        }
      }
    }
  }
  for (int i = 0; i < proc_running; i++) {
    proc = running[i];
    pc = q[proc].pc;
    page = pc / PAGESIZE;
    int page_predict = predict_prev(proc, page, prev);
    if (page_predict == -1 || page_predict == page)
      continue;
    if (q[proc].pages[page_predict])
      continue;
    pagein(proc, page_predict);
  }
  tick++;
}

#pragma GCC pop_options
