# Tempest 2000 port for Parallax P2

This is a source port of Tempest 2000 by Jeff Minter for the Parallax Propeller 2 microcontroller



## Build Instructions

Instructions are provided for Ubuntu/Debian Linux. Windows 10+ users should use WSL.

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

### Configuring

Configure pins, filesystem, video mode and memory timing in `src/p2config.spin2`.

The default PSRAM timings work on a P2EC-32MB.
The default PSRAM timings work on a P2EVAL with the HyperRAM board on pin 0.

Other working memory configurations:

#### P2EVAL with Rayslogic 96MB board on pin 0
```
' Enable one of these to select the exmem type to use
'#define USE_PSRAM16
#define USE_PSRAM8
'#define USE_PSRAM4
'#define USE_HYPER

' For PSRAM (either type)
PSRAM_CLK = 8 addpins 1
PSRAM_SELECT = 10
PSRAM_BASE = 0
PSRAM_BANKS = 6

'PSRAM_WAIT  = 5
PSRAM_DELAY = 18
PSRAM_SYNC_CLOCK = true
PSRAM_SYNC_DATA = false

' Uncomment for slower memory clock
#define USE_PSRAM_SLOW
```

#### P2EVAL with Rayslogic 24MB board on pin 48
```
' Enable one of these to select the exmem type to use
'#define USE_PSRAM16
'#define USE_PSRAM8
#define USE_PSRAM4
'#define USE_HYPER

' For PSRAM (either type)
PSRAM_CLK = 48+4
PSRAM_SELECT = 48+5
PSRAM_BASE = 48
PSRAM_BANKS = 3

PSRAM_DELAY = 17
PSRAM_SYNC_CLOCK = true
PSRAM_SYNC_DATA = false

' Uncomment for slower memory clock
'#define USE_PSRAM_SLOW
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
This file needs to be placed onto the filesystem (SD card by default)

To build both and load it into an attached P2 system (must have `FS_9P` configured!!!):
```sh
make runp2
```

You can still build a Jaguar executable `t2000.abs` for debugging purposes:
```sh
make t2000.abs
```
