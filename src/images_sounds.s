.globl assets_start
.globl pic
.globl pic2
.globl pic3
.globl pic4
.globl pic5
.globl pic6
.globl digits
.globl modbase
.globl samtab
.globl smp1
.globl max_musnum
.globl max_sfxnum


assets_start:
pic:    .incbin "images/beasty3.cry"
pic2:   .incbin "images/beasty4.cry"
pic3:   .incbin "images/beasty5.cry"
pic4:   .incbin "images/beasty6.cry"
pic5:   .incbin "images/beasty7.cry"
pic6:   .incbin "images/beasty8.cry"

	digits EQU pic2+92800	;start address of zero digit

modbase:
;.incbin "incbin/mysterymeat.bin"
.dc.l tune13
.dc.l tune7
.dc.l tune1
.dc.l tune3
.dc.l tune4
.dc.l tune5
.dc.l tune12
.dc.l tune11
.dc.l tune10
.dc.l tune9
.dc.l tune8
.dc.l tune6
.dc.l 0
;.dcb.b 256-(8*4),0 ; Does this actually do anthing?

max_musnum equ (* - modbase)/4 - 1

tune13:
.incbin "sounds/tune13.mod"
.DC.L $0000

tune7:
.incbin "sounds/tune7.mod"
.DC.L $0000

tune1:
.incbin "sounds/tune1.mod"
.DC.L $0000

tune3:
.incbin "sounds/tune3.mod"
.DC.L $0000

tune4:
.incbin "sounds/rave4.mod"
.DC.L $0000

tune5:
.incbin "sounds/tune5.mod"
.DC.L $0000

tune12:
.incbin "sounds/tune12.mod"
.DC.L $0000

tune11:
.incbin "sounds/tune11.mod"
.DC.L $0000

tune10:
.incbin "sounds/tune10.mod"
.DC.L $0000

tune9:
.incbin "sounds/tune9.mod"
.DC.L $0000

tune8:
.incbin "sounds/tune8.mod"
.DC.L $0000

tune6:
.incbin "sounds/tune6.mod"
.DC.L $0000

;.incbin "incbin/paddingbetweentunesandsmp.bin"

samtab:
;.incbin "incbin/smp.bin"
;.incbin "incbin/paddingbetweensmpandsamples.bin"
.dc.b "Engine Noise 1      "
.dc.w 1, 428 ; prio, period
.dc.l smp01, 1155072 ; start, len
.dc.l smp01+2, 1154560 ; repstart, replen
.dc.b "Player Shot Normal 2"
.dc.w 2, 428 ; prio, period
.dc.l smp02, 583680 ; start, len
.dc.l smp02, 0 ; repstart, replen
.dc.b "Engine Noise        "
.dc.w 3, 428 ; prio, period
.dc.l smp03, 3373056 ; start, len
.dc.l smp03+3086, 2462720 ; repstart, replen
.dc.b "Player Death        "
.dc.w 4, 214 ; prio, period
.dc.l $00000000, 5544448 ; start, len
.dc.l $00000000, 0 ; repstart, replen
.dc.b "Player Death 2      "
.dc.w 5, 428 ; prio, period
.dc.l $00000000, 2381824 ; start, len
.dc.l $00000000, 0 ; repstart, replen
.dc.b "Player Shot Normal  "
.dc.w 6, 428 ; prio, period
.dc.l smp06, 500736 ; start, len
.dc.l smp06, 0 ; repstart, replen
.dc.b "Player Jump         "
.dc.w 7, 428 ; prio, period
.dc.l smp07, 1629696 ; start, len
.dc.l smp07, 0 ; repstart, replen
.dc.b "Crackle             "
.dc.w 8, 214 ; prio, period
.dc.l smp08, 4559872 ; start, len
.dc.l smp08, 0 ; repstart, replen
.dc.b "Cleared Level       "
.dc.w 9, 428 ; prio, period
.dc.l smp09, 3645952 ; start, len
.dc.l smp09, 0 ; repstart, replen
.dc.b "Warp                "
.dc.w 10, 568 ; prio, period
.dc.l smp10, 7260160 ; start, len
.dc.l smp10, 0 ; repstart, replen
.dc.b "Large Explosion     "
.dc.w 11, 428 ; prio, period
.dc.l smp11, 5292544 ; start, len
.dc.l smp11, 0 ; repstart, replen
.dc.b "Powered Up Shot     "
.dc.w 12, 428 ; prio, period
.dc.l smp12, 1668608 ; start, len
.dc.l smp12, 0 ; repstart, replen
.dc.b "Get Power Up        "
.dc.w 13, 428 ; prio, period
.dc.l smp13, 1763840 ; start, len
.dc.l smp13, 0 ; repstart, replen
.dc.b "Tink For Spike      "
.dc.w 14, 254 ; prio, period
.dc.l smp14, 265728 ; start, len
.dc.l smp14, 0 ; repstart, replen
.dc.b "NME At Top Of Web   "
.dc.w 15, 428 ; prio, period
.dc.l smp15, 7680 ; start, len
.dc.l smp15, 0 ; repstart, replen
.dc.b "Pulse For Pulsar    "
.dc.w 16, 856 ; prio, period
.dc.l smp16, 1703424 ; start, len
.dc.l smp16, 0 ; repstart, replen
.dc.b "Normal Explosion    "
.dc.w 17, 214 ; prio, period
.dc.l smp17, 2799104 ; start, len
.dc.l smp17, 0 ; repstart, replen
.dc.b "Extra Explosion     "
.dc.w 18, 856 ; prio, period
.dc.l smp18, 1624576 ; start, len
.dc.l smp18, 0 ; repstart, replen
.dc.b "Static or Pulsar    "
.dc.w 19, 284 ; prio, period
.dc.l smp19, 4187136 ; start, len
.dc.l smp19, 0 ; repstart, replen
.dc.b "Pulsar Pulse        "
.dc.w 20, 856 ; prio, period
.dc.l smp20, 986112 ; start, len
.dc.l smp20, 0 ; repstart, replen
.dc.b "Off Shielded NME    "
.dc.w 21, 170 ; prio, period
.dc.l smp21, 2607616 ; start, len
.dc.l smp21, 0 ; repstart, replen
.dc.b "Excellent           "
.dc.w 22, 512 ; prio, period
.dc.l smp22, 5862912 ; start, len
.dc.l smp22, 0 ; repstart, replen
.dc.b "Superzapper Recharge"
.dc.w 22, 512 ; prio, period
.dc.l smp23, 11098112 ; start, len
.dc.l smp23, 0 ; repstart, replen
.dc.b "yes                 "
.dc.w 24, 512 ; prio, period
.dc.l smp24, 5925888 ; start, len
.dc.l smp24+2, 5925376 ; repstart, replen
.dc.b "oneup               "
.dc.w 25, 512 ; prio, period
.dc.l smp25, 4435456 ; start, len
.dc.l smp25, 0 ; repstart, replen
.dc.b "screeeam            "
.dc.w 26, 512 ; prio, period
.dc.l smp26, 4548608 ; start, len
.dc.l smp26, 0 ; repstart, replen
.dc.b "sexy yes 1          "
.dc.w 27, 512 ; prio, period
.dc.l smp27, 2905088 ; start, len
.dc.l smp27, 0 ; repstart, replen
.dc.b "sexy yes 2          "
.dc.w 28, 512 ; prio, period
.dc.l smp28, 3290624 ; start, len
.dc.l smp28, 0 ; repstart, replen
.dc.b "tink                "
.dc.w 30, 512 ; prio, period
.dc.l smp29, 380416 ; start, len
.dc.l smp29, 0 ; repstart, replen
.dc.b "zero                "
.dc.w 31, 512 ; prio, period
.dc.l smp30, 2048 ; start, len
.dc.l smp30, 0 ; repstart, replen
max_sfxnum equ (*-samtab)/40 - 1
.dc.b "dummy               "
.dc.w 32, 512 ; prio, period
.dc.l smp15_dummy, 10606592 ; start, len
.dc.l smp15_dummy, 0 ; repstart, replen

; do we need this?
;.dc.b $02, $02, $FE, $0D, $04, $04, $0B, $00, $FB, $00, $0C, $FF, $FF, $07, $08, $F9, $01, $05, $F2, $FE, $0F, $17, $0D, $13, $0B, $02, $05, $FB, $F1, $E7, $FB, $0A, $0E, $1E, $13, $06, $FB, $F0, $EF, $EE

smp01:
.incbin "sounds/samples/01"
.DC.L $0000
smp02:
.incbin "sounds/samples/02"
.DC.L $0000
smp03:
.incbin "sounds/samples/03"
.DC.L $0000
smp06:
.incbin "sounds/samples/06"
.DC.L $0000
smp07:
.incbin "sounds/samples/07"
.DC.L $0000
smp08:
.incbin "sounds/samples/08"
.DC.L $0000
smp09:
.incbin "sounds/samples/09"
.DC.L $0000
smp10:
.incbin "sounds/samples/10"
.DC.L $0000
smp11:
.incbin "sounds/samples/11"
.DC.L $0000
smp12:
.incbin "sounds/samples/12"
.DC.L $0000
smp13:
.incbin "sounds/samples/13"
.DC.L $0000
smp14:
.incbin "sounds/samples/14"
.DC.L $0000
smp15:
.incbin "sounds/samples/15"
.DC.L $0000
smp16:
.incbin "sounds/samples/16"
.DC.L $0000
smp17:
.incbin "sounds/samples/17"
.DC.L $0000
smp18:
.incbin "sounds/samples/18"
.DC.L $0000
smp19:
.incbin "sounds/samples/19"
.DC.L $0000
smp20:
.incbin "sounds/samples/20"
.DC.L $0000
smp21:
.incbin "sounds/samples/21"
.DC.L $0000
smp22:
.incbin "sounds/samples/22"
.DC.L $0000
smp23:
.incbin "sounds/samples/23"
.DC.L $0000
smp24:
.incbin "sounds/samples/24"
.DC.L $0000
smp25:
.incbin "sounds/samples/25"
.DC.L $0000
smp26:
.incbin "sounds/samples/26"
.DC.L $0000
smp27:
.incbin "sounds/samples/27"
.DC.L $0000
smp28:
.incbin "sounds/samples/28"
.DC.L $0000
smp29:
.incbin "sounds/samples/29"
.DC.L $0000
smp30:
.incbin "sounds/samples/30"
.DC.L $0000
smp15_dummy:
.incbin "sounds/samples/15"
