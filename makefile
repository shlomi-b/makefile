# These are variables. We usually define CC, CCLINK, CFLAGS, OBJS, EXEC and RM
CC=gcc
CCLINK=$(CC) # Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99
OBJS=main.o file0.o file1.o file2.o file3.o file4.o
EXEC=prog.exe
RM=clean

# The first rule is invoked by default.
# We can also invoke it (or any other rule) manually with "make all" - 
# note that "all" is the rule's name!
$(EXEC): $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

# Full rule syntax with custom Shell commands according to linked list
main.o: main.c file0.h file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c main.c

file0.o: file0.c file0.h file3.h
	$(CC) $(CFLAGS) -c file0.c	

file1.o: file1.c file1.h file0.h
	$(CC) $(CFLAGS) -c file1.c

file2.o: file2.c file2.h file4.h
	$(CC) $(CFLAGS) -c file2.c

file3.o: file3.c file3.h file2.h file1.h
	$(CC) $(CFLAGS) -c file3.c

file4.o: file4.c file4.h file2.h
	$(CC) $(CFLAGS) -c file4.c


# We usually have a "clean" rule to delete any automatically generated files
$(RM):
	rm -rf *.o *.exe
