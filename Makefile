CC := gcc
CFLAGS := -O2
PTHREAD_FLAGS := -pthread
OPENMP_FLAGS := -fopenmp
BIN := bin

.PHONY: all clean

all: $(BIN)/thread1 $(BIN)/thread2 $(BIN)/thread_sum $(BIN)/race $(BIN)/mutex \
     $(BIN)/omp1 $(BIN)/omp_sum $(BIN)/omp_race $(BIN)/omp_critical $(BIN)/omp_barrier \
     $(BIN)/sequential $(BIN)/pthread_perf $(BIN)/omp_perf

$(BIN):
	mkdir -p $(BIN)

$(BIN)/thread1: src/pthreads/thread1.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/thread2: src/pthreads/thread2.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/thread_sum: src/pthreads/thread_sum.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/race: src/pthreads/race.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/mutex: src/pthreads/mutex.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/omp1: src/openmp/omp1.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

$(BIN)/omp_sum: src/openmp/omp_sum.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

$(BIN)/omp_race: src/openmp/omp_race.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

$(BIN)/omp_critical: src/openmp/omp_critical.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

$(BIN)/omp_barrier: src/openmp/omp_barrier.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

$(BIN)/sequential: src/performance/sequential.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@

$(BIN)/pthread_perf: src/performance/pthread_perf.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(PTHREAD_FLAGS)

$(BIN)/omp_perf: src/performance/omp_perf.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@ $(OPENMP_FLAGS)

clean:
	rm -rf $(BIN)/*
