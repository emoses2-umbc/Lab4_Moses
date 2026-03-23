CC     = gcc
CFLAGS = -Wall -m32 -g
TARGET = proj

all: $(TARGET)

$(TARGET): main.o sum.o
	$(CC) $(CFLAGS) -o $@ main.o sum.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

sum.o: sum.s
	$(CC) -m32 -c sum.s

clean:
	rm -f *.o $(TARGET)
