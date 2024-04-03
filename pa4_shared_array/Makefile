OBJS = array.o test.o
CFLAGS = -Wall

all: $(OBJS)
	cc $(CFLAGS) -o shared_array $(OBJS)

clean:
	rm *.o shared_array

array.o: array.h
test.o: array.h
