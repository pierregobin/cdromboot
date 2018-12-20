
all : boot.iso

prepared_iso/boot/loader.sys : boot.asm 
	mkdir -p prepared_iso/boot
	nasm -o $@ $^

boot.iso : prepared_iso/boot/loader.sys
	genisoimage -U -b boot/loader.sys -no-emul-boot  -o boot.iso prepared_iso

run : boot.iso
	qemu-system-i386  -cdrom boot.iso -m 256

clean :
	rm -rf prepared_iso
