# Multithreaded Programming Using Pthreads and OpenMP

Complete implementation and experimental record for the multithreading laboratory experiment using **Pthreads** and **OpenMP** on **WSL Ubuntu with GCC**.

## Objectives

- Thread creation and management
- Work distribution
- Race conditions
- Synchronization
- Thread coordination
- Performance improvement using multiple threads
- Execution-time comparison, speedup, and efficiency

These objectives follow the supplied laboratory manual.

## Environment

- Windows + WSL Ubuntu
- GCC 15.2.0
- POSIX Threads (Pthreads)
- OpenMP
- Nano editor

## Repository structure

```text
multithreaded-pthreads-openmp/
├── README.md
├── Makefile
├── .gitignore
├── src/
│   ├── pthreads/
│   ├── openmp/
│   └── performance/
├── results/
│   ├── performance_results.csv
│   └── speedup_efficiency.csv
├── screenshots/
└── docs/
    └── experiment_report.md
```

## Implemented programs

### Pthreads
- `thread1.c` — one-thread creation and join
- `thread2.c` — multiple threads
- `thread_sum.c` — work distribution
- `race.c` — race condition
- `mutex.c` — mutex synchronization
- `pthread_perf.c` — performance measurement

### OpenMP
- `omp1.c` — parallel region and thread identification
- `omp_sum.c` — work sharing and reduction
- `omp_race.c` — race condition
- `omp_critical.c` — critical-section synchronization
- `omp_barrier.c` — thread coordination
- `omp_perf.c` — performance measurement

### Performance workload

The performance programs use `N = 1,000,000,000` iterations.

## Recorded experimental results

The values below are transcribed from the submitted terminal screenshots.

### Sequential baseline

| Run | Time (s) |
|---:|---:|
| 1 | 1.394574 |
| 2 | 1.365670 |
| 3 | 1.378025 |
| 4 | 1.380163 |
| 5 | 1.372883 |
| **Average** | **1.378263** |

### Pthreads vs OpenMP

| Threads | Pthreads (s) | OpenMP (s) |
|---:|---:|---:|
| 1 | 1.379614 | 1.374793 |
| 2 | 0.711071 | 0.719968 |
| 4 | 0.357890 | 0.359742 |
| 6 | 0.243737 | 0.242687 |
| 16 | 0.143947 | 0.143285 |

All performance runs reported:

`Result = 499999999500.00`

### Race-condition and synchronization evidence

| Program | Expected | Actual in submitted run |
|---|---:|---:|
| Pthreads `race` | 400000 | 149335 |
| Pthreads `mutex` | 400000 | 400000 |
| OpenMP `omp_race` | 400000 | 104810 |
| OpenMP `omp_critical` | 400000 | 400000 |

The OpenMP basic parallel execution reported 32 threads in the submitted environment.

## Performance interpretation

Using the submitted sequential average of **1.378263 s** as the baseline:

- Pthreads, 16 threads: **9.57× speedup**
- OpenMP, 16 threads: **9.62× speedup**

Execution time generally decreased as the thread count increased. The result is not perfectly linear because real parallel execution includes thread management, scheduling, synchronization, memory access, and other overheads.

## Reproduce the build

From the repository root:

```bash
make
```

Run examples:

```bash
./bin/thread1
./bin/thread2
./bin/thread_sum
./bin/race
./bin/mutex
./bin/omp1
./bin/omp_sum
./bin/omp_race
./bin/omp_critical
./bin/omp_barrier
./bin/sequential
```

Performance programs:

```bash
./bin/pthread_perf
./bin/omp_perf
```

For the performance tests, enter:

```text
1
2
4
6
16
```


## Conclusion

The experiment demonstrates thread creation, management, work distribution, race-condition handling, synchronization, coordination, and performance analysis using both Pthreads and OpenMP.
