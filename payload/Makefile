CROSS=xenon-
CC=$(CROSS)gcc
OBJCOPY=$(CROSS)objcopy

CFLAGS	= -ffunction-sections -fdata-sections -g -O2 -Wall $(MACHDEP) $(INCLUDE)
CXXFLAGS	=	$(CFLAGS)
LDFLAGS	=	-g $(MACHDEP) -Wl,--gc-sections -Wl,-Map,$(notdir $@).map
LIBS	:=	-lxenon -lm

AFLAGS = -m64

all: rexdumper.bin

.S.o:
	$(CC) $(AFLAGS) -c -o $@ $*.S

%.bin: %.o
	$(OBJCOPY) -O binary $< $@

clean:
	rm -f *.o *.bin
