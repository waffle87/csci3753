// Jack Sangdahl
// CSCI3753 SP24
// PA7 LRU
#include "simulator.h"
#include <stdbool.h>

void pageit(Pentry q[MAXPROCESSES]) {
  static int timestamps[MAXPROCESSES][MAXPROCPAGES], tick = 1;
  static bool initialised = false;
  if (!initialised) {
    for (int proc = 0; proc < MAXPROCESSES; proc++)
      for (int page = 0; page < MAXPROCPAGES; page++)
        timestamps[proc][page] = 0;
    initialised = true;
  }
  for (int proc = 0; proc < MAXPROCESSES; proc++) {
    if (q[proc].active) {
      int curr = q[proc].pc / PAGESIZE;
      timestamps[proc][curr] = tick;
      if (!q[proc].pages[curr])
        if (!pagein(proc, curr)) {
          int min = tick, choice;
          for (int i = 0; i < q[proc].npages; i++)
            if (timestamps[proc][i] < min && q[proc].pages[i]) {
              choice = i;
              min = timestamps[proc][i];
            }
          pageout(proc, choice);
        }
    }
  }
  tick++;
}
