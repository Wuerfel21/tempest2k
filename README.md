# Tempest 2000 port for Parallax P2

This is a source port of Tempest 2000 by Jeff Minter for the Parallax Propeller 2 microcontroller



## Build Instructions

### Build Requirements
```sh
sudo apt install build-essentials bison
```

### Build the assembler and Spin2 toolchains

First you must run the following to set up the git submodules containing the assembler toolchain:

```sh
git submodule init
git submodule update
```

Now you can build the toolchain, as follows:

```sh
cd rmac
make
cd ../rln
make 
cd ../spin2cpp
make 
cd ..
```

### Build Tempest 2000

WARNING: dependencies aren't all properly set up, run `make clean` if in doubt

To build the native P2 executable `t2000p2.bix`
```sh
make t2000p2.bix
```

To build the asset/68000 file `t2000p2.dat`
```sh
make t2000p2.dat
```

To build both and load it into an attached P2 system:
```sh
make runp2
```

You can still build a Jaguar executable `t2000.abs` for debugging purposes:
```sh
make t2000.abs
```
