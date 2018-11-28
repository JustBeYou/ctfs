PRODUCT := chatclient

CXX := g++
LINKER := g++
INCDIRS := -I.
LINKDIRS := -L.
CXXFLAGS := -std=c++11 -Wall -Wextra -DDEBUG=0
LDFLAGS := -l:a51crypto.a

SRCFILES := $(wildcard *.cpp) 
OBJFILES := $(patsubst %.cpp,%.o,$(SRCFILES))

a51crypto.a: FORCE
	make -C ../A51-crypto -f Makefile a51crypto.a
	cp ../A51-crypto/a51crypto.a .

$(PRODUCT): $(OBJFILES) a51crypto.a
	$(LINKER) $^ $(LINKDIRS) $(LDFLAGS) -o $@
	@echo "done"

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCDIRS) -c $< -o $@

FORCE: ;

clean:
	rm $(OBJFILES) || echo Done
	rm *.a || echo Done
	make -C ../A51-crypto -f Makefile clean || echo Done