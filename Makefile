# C++ compiler.
CC =g++
PROJECT_NAME :=PROCESS-WINDOW

# Compilation and linking flags.
CC_FLAGS = -c -MMD -MP -O3 -m32 -Wall -std=c++0x
LD_FLAGS = -m32 -static

# Target 
TARGET = wakeup-eq

# Header files directory
SRCDIR = ./src/
INCDIR = ./inc/
OBJDIR = ./obj/

# Sources
SRCS = $(wildcard $(SRCDIR)*.cpp)

# Object files
OBJS = $(addprefix $(OBJDIR),$(notdir $(SRCS:.cpp=.o)))

# The dependency file names.
DEPS := $(OBJS:.o=.d)

$(TARGET): $(OBJS)
	@echo "\`\` building: $@"
	@$(CC) $(LD_FLAGS) -o $@ $^
	@echo "$(PROJECT_NAME) installed correctly."

obj/%.o: src/%.cpp | $(OBJDIR)
	@echo "\`\` compiling: $<"
	@$(CC) $(CC_FLAGS) -I$(INCDIR) -o $@ $<

# Read dependency files and handle them
-include $(DEPS)

$(OBJDIR):
	@mkdir -p $(OBJDIR)

clean:
	@echo "Removing $(PROJECT_NAME)..."
	@rm -rf $(OBJDIR)
	@rm $(TARGET)
	@echo "$(PROJECT_NAME) removed correctly."

rmtmp:
	@rm -f *~
	@rm -rf $(SRCDIR)*~
	@rm -rf $(INCDIR)*~
	@echo "Temporary files removed correctly."

help:
	@echo "Help for $(PROJECT_NAME) Makefile:"
	@echo "\t-make:\t\tcompiling and install $(PROJECT_NAME)"
	@echo "\t-make clean:\tremove $(PROJECT_NAME)"
	@echo "\t-make rmtmp:\tremove temporary files from the project"
	@echo "\t-make help:\thelp of the program."
