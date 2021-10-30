# RexDumper

This is a libxenon X360 utility to dump [CPU Special Purpose Registers](https://github.com/Free60Project/libxenon/blob/master/libxenon/drivers/ppc/xenonsprs.h) over POST bus.   
It comes as an ASM payload that can be injected in the bootchain or executed from Xell with the provided loader.    
The payload when executed prints the value of 57 registers (MSR + 56 SPRs) by emulating a 9600bps UART on POST bit 0.  