# rpi2-hyp-boot
Raspberry Pi 2 bootloader for starting the cores in HYP mode

# Building

To be able to build this, you'll need an ARM cross toolchain. I'm using the one
provided by the GCC ARM Embedded project (https://launchpad.net/gcc-arm-embedded).

Add the toolchain binaries directory to your $PATH, and then just run "make".

# Further info

I wrote a guide for enabling KVM virtualization on the Raspberry Pi 2.
You can find it here: http://blog.flexvm.es/?p=139
