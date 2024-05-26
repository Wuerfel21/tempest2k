.PHONY: all clean

all: clean cartridge

t2000.abs: 
	$(shell mkdir -p bin)
	./rmac/rmac -fr -mtom -isrc src/donky.gas -o bin/donky.o
	./rmac/rmac -fr -mtom -isrc src/camel.gas -o bin/camel.o
	./rmac/rmac -fr -mtom -isrc src/antelope.gas -o bin/antelope.o
	./rmac/rmac -fr -mtom -isrc src/goat.gas -o bin/goat.o
	./rmac/rmac -fr -mtom -isrc src/llama.gas -o bin/llama.o
	./rmac/rmac -fr -mtom -isrc src/horse.gas -o bin/horse.o
	./rmac/rmac -fr -mtom -isrc src/ox.gas -o bin/ox.o
	./rmac/rmac -fr -mtom -isrc src/stoat.gas -o bin/stoat.o
	./rmac/rmac -fr -mtom -isrc src/xcamel.gas -o bin/xcamel.o
	./rmac/rmac -l*yak.lst -fb -isrc src/yak.s -o bin/yak.cof
	./rmac/rmac -l*yakgpu.lst -fb -isrc src/yakgpu.s -o bin/yakgpu.cof
	./rmac/rmac -l*vidinit.lst -fb -isrc src/vidinit.s -o bin/vidinit.cof
	./rmac/rmac -l*eeprim.lst -fb -isrc src/eeprim.s -o bin/eeprim.cof
	./rmac/rmac -fb -Isrc src/images_sounds.s -o bin/images_sounds.o
	./rln/rln -m -v -e -a 802000 4000 efa8 bin/yak.cof bin/eeprim.cof bin/vidinit.cof bin/yakgpu.cof bin/images_sounds.o -o t2000.abs
#	echo "515c0e0fcfe9a96d24c858968c3bad72  t2000.abs" | md5sum -c

t2000p2.dat:
	$(shell mkdir -p bin_p2)
	./rmac/rmac -l*yak.lst -fb -isrc -DPROPELLER src/yak.s -o bin_p2/yak.cof
	./rmac/rmac -fb -isrc src/vidinit_stub.s -o bin_p2/vidinit_stub.cof
	./rmac/rmac -fb -isrc src/stubsound.s -o bin_p2/stubsound.cof
	./rmac/rmac -fb -Isrc src/images_sounds.s -o bin_p2/images_sounds.o
	./rln/rln -v -n -a 80000000 2000 r bin_p2/yak.cof bin_p2/vidinit_stub.cof bin_p2/stubsound.cof bin_p2/images_sounds.o -o t2000p2.dat
	
t2000p2.bix:
	./spin2cpp/build/flexspin -2 -H 0x50000 --compress src/t2000p2.spin2 -l -o t2000p2.bix


cartridge: t2000.abs
	wine ./utils/filefix.exe t2000.abs
	./utils/CreateCart.py t2k.rom  src/incbin/romheader.bin T2000.TX src/incbin/paddingaftersamples.bin 
	echo "602bc9953d3737b1ba52b2a0d9932f7c  t2k.rom" | md5sum -c

run: cartridge
	wine ./utils/t2k.exe t2k.rom

runp2: t2000p2.bix t2000p2.dat
	loadp2 t2000p2.bix -9 . -t -b 2000000

clean:
	-rm bin/*.o
	-rm bin/*.cof
	-rm bin_p2/*.o
	-rm bin_p2/*.cof
	-rm t2000.abs
	-rm T2000.DB
	-rm T2000.TX
	-rm T2000.DTA
	-rm t2k.rom
	-rm t2000p2.dat
	-rm t2000p2.bix
	-rm t2000p2.p2asm
	-rm *.lst
