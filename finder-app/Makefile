# Compiler and flags
CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Wextra -Werror -std=gnu99

# Target application
TARGET := writer

# Source files
SRCS := writer.c

# Object files
OBJS := $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Build the target application
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
	@echo "Build complete: $@"

# Compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)