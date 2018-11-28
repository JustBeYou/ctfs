PRODUCT := A51-test
LIB := a51crypto.a

CXX := g++
LINKER := g++
INCDIRS := -I.
LINKDIRS := -L.
CXXFLAGS := -std=c++11 -Wall -Wextra -Wno-missing-field-initializers -DDEBUG=0
LDFLAGS := -l:libcppotp.a

SRCFILES := $(wildcard *.cpp) 
OBJFILES := $(patsubst %.cpp,%.o,$(SRCFILES))
DEPFILES := $(patsubst %.cpp,%.d,$(SRCFILES))

$(PRODUCT): $(OBJFILES) libcppotp.a
	$(LINKER) $^ $(LINKDIRS) $(LDFLAGS) -o $@
	
$(LIB): $(OBJFILES) libcppotp.a
	ar x libcppotp.a
	ar cr $@ *.o

libcppotp.a:
	mkdir cpptotp/build && cd cpptotp/build && cmake ..
	make -C cpptotp/build -f Makefile
	cp cpptotp/build/libcppotp.a .

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCDIRS) -c $< -o $@

clean:
	rm *.o || echo Done
	rm *.a || echo Done
	rm -r cpptotp/build || echo Done