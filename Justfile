asm:
    nasm -f elf32 asm/loader.s -o loader.o

link:
    ld -T link.ld -melf_i386 loader.o -o kernel.elf

iso:
    genisoimage -R -b boot/grub/stage2_eltorito \
                -no-emul-boot \
                -boot-load-size 4 \
                -A os \
                -input-charset utf8 \
                -quiet \
                -boot-info-table \
                -o os.iso \
                iso

bochs:
    bochs -f bochs.conf -q
