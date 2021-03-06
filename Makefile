# Define (atleast) the following targets: all, clean
# all must build the executable file named mapreduce.
# clean must remove all object files and executable files created.
# Look at the introduction doc for information on how make a Makefile.
# This make file must build according to the structure described in the
# introduction doc, if it doesn't you will get a ZERO!

CFLAGS = -Wall -Werror -g
BINS = build/main.o build/map_reduce.o bin/mapreduce

all: folders $(BINS)

folders:
	mkdir -p build
	mkdir -p bin

build/main.o: src/main.c
	gcc $(CFLAGS) -c $^ -o $@

build/map_reduce.o: src/map_reduce.c
	gcc $(CFLAGS) -c $^ -o $@

bin/mapreduce: build/main.o build/map_reduce.o
	gcc $(CFLAGS) $^ -o $@ -lm

clean:
	rm -f *.o $(BINS) 
