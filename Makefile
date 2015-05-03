CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)ld.bfd
OBJCOPY=$(CROSS_COMPILE)objcopy

all: bootblk.bin

rpi2_hyp_boot.o:
	$(CC) -O2 -march=armv7-a -nostartfiles -nostdlib rpi2-hyp-boot.S -c -o rpi2-hyp-boot.o

rpi2_hyp_boot: rpi2_hyp_boot.o
	$(LD) -pie --gc-sections -Bstatic -T rpi2-hyp-boot.lds -o rpi2-hyp-boot rpi2-hyp-boot.o

rpi2_hyp_boot.bin: rpi2_hyp_boot
	$(OBJCOPY) --gap-fill=0xff -O binary rpi2-hyp-boot rpi2-hyp-boot.bin

bootblk.bin: rpi2_hyp_boot.bin
	dd if=/dev/zero of=bootblk.bin bs=32k count=1
	dd if=rpi2-hyp-boot.bin of=bootblk.bin conv=notrunc

clean:
	@rm -f *.o *.bin rpi2-hyp-boot

