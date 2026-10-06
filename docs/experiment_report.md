# Experiment Report — Multithreaded Programming Using Pthreads and OpenMP

## Aim

To develop multithreaded programs using Pthreads and OpenMP and understand thread creation, management, work distribution, race conditions, synchronization, thread coordination, and performance improvement using multiple threads.

## Environment

- Windows
- WSL Ubuntu
- GCC 15.2.0
- Pthreads
- OpenMP

## Results

### Pthreads
- Work distribution: total sum = 360
- Race condition: expected 400000, actual 149335
- Mutex: expected 400000, actual 400000

### OpenMP
- Parallel region: 32 threads reported
- Work sharing/reduction: total sum = 360
- Race condition: expected 400000, actual 104810
- Critical: expected 400000, actual 400000
- Barrier: Stage 1 completion messages occurred before Stage 2 start messages

### Performance

Sequential average: **1.378263 s**

| Threads | Pthreads (s) | OpenMP (s) |
|---:|---:|---:|
| 1 | 1.379614 | 1.374793 |
| 2 | 0.711071 | 0.719968 |
| 4 | 0.357890 | 0.359742 |
| 6 | 0.243737 | 0.242687 |
| 16 | 0.143947 | 0.143285 |

### Speedup and efficiency

| Threads | Pthreads speedup | OpenMP speedup | Pthreads efficiency | OpenMP efficiency |
|---:|---:|---:|---:|---:|
| 1 | 0.999× | 1.003× | 99.90% | 100.25% |
| 2 | 1.938× | 1.914× | 96.91% | 95.72% |
| 4 | 3.851× | 3.831× | 96.28% | 95.78% |
| 6 | 5.655× | 5.679× | 94.25% | 94.65% |
| 16 | 9.575× | 9.619× | 59.84% | 60.12% |

## Conclusion

The experiment demonstrates the progression from thread creation and work distribution to race-condition handling, synchronization, coordination, and performance measurement. Increasing the number of threads reduced execution time for the tested workload, while the results also show that speedup is not perfectly linear because parallel execution introduces overhead.
