CC     = gcc
CFLAGS = -Wall -m32 -g
TARGET = lab4

all: $(TARGET)

$(TARGET): main.o sum.o
	$(CC) $(CFLAGS) -o $@ main.o sum.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

sum.o: sum.s
	as --32 sum.s -o sum.o

clean:
	rm -f *.o $(TARGET)
