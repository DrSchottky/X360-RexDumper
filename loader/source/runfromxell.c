#include <stdio.h>
#include <stdlib.h>
#include <input/input.h>
#include <xenos/xenos.h>
#include <console/console.h>
#include <sys/iosupport.h>
#include <usb/usbmain.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <time/time.h>
#include <ppc/cache.h>
#include <ppc/register.h>
#include <ppc/xenonsprs.h>
#include "mount.h"


void run_payload(char* filepath)
{
    struct stat s;
    stat(filepath, &s);
    long size = s.st_size;
    if (size <= 0)
    {
        printf("Invalid file size\n");
        return;
    }
    FILE *f = fopen(filepath, "r");
    if(!f)
    {
        printf("Can't open the file\n");
        return;
    }
    uint8_t *src_ptr = (uint8_t *)malloc(size);
    if(!src_ptr)
    {
        printf("Can't allocate memory\n");
        return;
    }
    printf("\n * '%s' found, loading %ld...\n", filepath, size);
    int r = fread(src_ptr, 1, size, f);
    if (r != size) {
        fclose(f);
        free(src_ptr);
        printf("Error during file reading\n");
        return;
    }
    void (*fun_ptr)(void) = (void (*)(void))src_ptr;
    memdcbf(src_ptr, size);
    printf("Executing payload at 0x%p...\n", src_ptr);
    (*fun_ptr)();
}

void find_payload() 
{
    char filepath[255];
    for (int i = 3; i < 16; i++) 
    {
        if (devoptab_list[i]->structSize) 
        {
            sprintf(filepath, "%s:/%s", devoptab_list[i]->name, "rexdumper.bin");
            printf("Trying %s\n", filepath);
            struct stat s;
            stat(filepath, &s);
            long size = s.st_size;
            if (size <= 0)
                continue;
            FILE *f = fopen(filepath, "r");
            if (!f)
                continue;
            fclose(f);
            run_payload(filepath);
            return;
        }
    }
    printf("rexdumper.bin not found\n");
}

int main()
 {
	xenos_init(VIDEO_MODE_AUTO);
	console_init();
	console_clrscr();
	usb_init();
	usb_do_poll();
    mount_only_usb();
    find_payload();
    while(1){}
    return 0;
 }