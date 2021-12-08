EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "Glue logic"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74HC00 U?
U 5 1 61AFA550
P 4750 1600
AR Path="/61AFA550" Ref="U?"  Part="5" 
AR Path="/6187B23D/61AFA550" Ref="U?"  Part="5" 
AR Path="/618AFEBD/61AFA550" Ref="U6"  Part="5" 
F 0 "U6" H 4980 1646 50  0000 L CNN
F 1 "74HC00" H 4980 1555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4750 1600 50  0001 C CNN
	5    4750 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AFA556
P 4750 2150
AR Path="/61AFA556" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61AFA556" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61AFA556" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 4750 1900 50  0001 C CNN
F 1 "GND" H 4750 2000 50  0000 C CNN
F 2 "" H 4750 2150 50  0001 C CNN
F 3 "" H 4750 2150 50  0001 C CNN
	1    4750 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61AFA55C
P 4750 1000
AR Path="/61AFA55C" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61AFA55C" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61AFA55C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 4750 850 50  0001 C CNN
F 1 "+5V" H 4750 1150 50  0000 C CNN
F 2 "" H 4750 1000 50  0001 C CNN
F 3 "" H 4750 1000 50  0001 C CNN
	1    4750 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61AFA562
P 4950 1050
AR Path="/61AFA562" Ref="C?"  Part="1" 
AR Path="/6187B23D/61AFA562" Ref="C?"  Part="1" 
AR Path="/618AFEBD/61AFA562" Ref="C10"  Part="1" 
F 0 "C10" V 4698 1050 50  0000 C CNN
F 1 "100n" V 4789 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4988 900 50  0001 C CNN
F 3 "~" H 4950 1050 50  0001 C CNN
	1    4950 1050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61AFA568
P 5150 1100
AR Path="/61AFA568" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61AFA568" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61AFA568" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 5150 850 50  0001 C CNN
F 1 "GND" H 5155 927 50  0000 C CNN
F 2 "" H 5150 1100 50  0001 C CNN
F 3 "" H 5150 1100 50  0001 C CNN
	1    5150 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1000 4750 1050
Wire Wire Line
	4750 2100 4750 2150
Wire Wire Line
	4750 1050 4800 1050
Connection ~ 4750 1050
Wire Wire Line
	4750 1050 4750 1100
Wire Wire Line
	5100 1050 5150 1050
Wire Wire Line
	5150 1050 5150 1100
$Comp
L 74xx:74HC00 U6
U 2 1 614A8848
P 2550 1850
F 0 "U6" H 2550 2175 50  0000 C CNN
F 1 "74HC00" H 2550 2084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2550 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 1850 50  0001 C CNN
	2    2550 1850
	1    0    0    -1  
$EndComp
Text GLabel 2000 1750 0    50   Input ~ 0
R~W
Wire Wire Line
	2000 1750 2250 1750
Text GLabel 2000 1950 0    50   Input ~ 0
CLK
Wire Wire Line
	2000 1950 2250 1950
Text GLabel 3100 1850 2    50   Input ~ 0
~OE
Wire Wire Line
	2850 1850 3100 1850
Text GLabel 2000 2450 0    50   Input ~ 0
R~W
$Comp
L 74xx:74HC00 U6
U 4 1 614B354C
P 3400 2550
F 0 "U6" H 3400 2875 50  0000 C CNN
F 1 "74HC00" H 3400 2784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3400 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3400 2550 50  0001 C CNN
	4    3400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2450 3100 2450
Text GLabel 2000 2650 0    50   Input ~ 0
CLK
Wire Wire Line
	2000 2650 3100 2650
Text GLabel 3850 2550 2    50   Input ~ 0
~WE
Wire Wire Line
	3700 2550 3850 2550
$Comp
L 74xx:74LS30 U8
U 2 1 614A5A2C
P 6450 1600
F 0 "U8" H 6680 1646 50  0000 L CNN
F 1 "74HC30" H 6680 1555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6450 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 6450 1600 50  0001 C CNN
	2    6450 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614AA1FC
P 6450 1000
AR Path="/614AA1FC" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/614AA1FC" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/614AA1FC" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6450 850 50  0001 C CNN
F 1 "+5V" H 6450 1150 50  0000 C CNN
F 2 "" H 6450 1000 50  0001 C CNN
F 3 "" H 6450 1000 50  0001 C CNN
	1    6450 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614AA202
P 6650 1050
AR Path="/614AA202" Ref="C?"  Part="1" 
AR Path="/6187B23D/614AA202" Ref="C?"  Part="1" 
AR Path="/618AFEBD/614AA202" Ref="C12"  Part="1" 
F 0 "C12" V 6398 1050 50  0000 C CNN
F 1 "100n" V 6489 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 6688 900 50  0001 C CNN
F 3 "~" H 6650 1050 50  0001 C CNN
	1    6650 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 1000 6450 1050
Wire Wire Line
	6450 1050 6500 1050
Connection ~ 6450 1050
Wire Wire Line
	6450 1050 6450 1100
Wire Wire Line
	6800 1050 6850 1050
Wire Wire Line
	6850 1050 6850 1100
$Comp
L power:GND #PWR?
U 1 1 614AABD4
P 6850 1100
AR Path="/614AABD4" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/614AABD4" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/614AABD4" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 6850 850 50  0001 C CNN
F 1 "GND" H 6855 927 50  0000 C CNN
F 2 "" H 6850 1100 50  0001 C CNN
F 3 "" H 6850 1100 50  0001 C CNN
	1    6850 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614AAFB1
P 6450 2150
AR Path="/614AAFB1" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/614AAFB1" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/614AAFB1" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 6450 1900 50  0001 C CNN
F 1 "GND" H 6450 2000 50  0000 C CNN
F 2 "" H 6450 2150 50  0001 C CNN
F 3 "" H 6450 2150 50  0001 C CNN
	1    6450 2150
	1    0    0    -1  
$EndComp
Text GLabel 2900 1300 2    50   Input ~ 0
~RES
Wire Wire Line
	2850 1300 2900 1300
$Comp
L power:GND #PWR?
U 1 1 61556CE2
P 5600 2150
AR Path="/61556CE2" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61556CE2" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61556CE2" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 5600 1900 50  0001 C CNN
F 1 "GND" H 5600 2000 50  0000 C CNN
F 2 "" H 5600 2150 50  0001 C CNN
F 3 "" H 5600 2150 50  0001 C CNN
	1    5600 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61556CEC
P 5600 1000
AR Path="/61556CEC" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61556CEC" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61556CEC" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 5600 850 50  0001 C CNN
F 1 "+5V" H 5600 1150 50  0000 C CNN
F 2 "" H 5600 1000 50  0001 C CNN
F 3 "" H 5600 1000 50  0001 C CNN
	1    5600 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61556CF6
P 5800 1050
AR Path="/61556CF6" Ref="C?"  Part="1" 
AR Path="/6187B23D/61556CF6" Ref="C?"  Part="1" 
AR Path="/618AFEBD/61556CF6" Ref="C11"  Part="1" 
F 0 "C11" V 5548 1050 50  0000 C CNN
F 1 "100n" V 5639 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5838 900 50  0001 C CNN
F 3 "~" H 5800 1050 50  0001 C CNN
	1    5800 1050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61556D00
P 6000 1100
AR Path="/61556D00" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61556D00" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61556D00" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 6000 850 50  0001 C CNN
F 1 "GND" H 6005 927 50  0000 C CNN
F 2 "" H 6000 1100 50  0001 C CNN
F 3 "" H 6000 1100 50  0001 C CNN
	1    6000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1000 5600 1050
Wire Wire Line
	5600 2100 5600 2150
Wire Wire Line
	5600 1050 5650 1050
Connection ~ 5600 1050
Wire Wire Line
	5600 1050 5600 1100
Wire Wire Line
	5950 1050 6000 1050
Wire Wire Line
	6000 1050 6000 1100
$Comp
L 74xx:74LS30 U8
U 1 1 614A3E7C
P 2550 3350
F 0 "U8" H 2550 3875 50  0000 C CNN
F 1 "74HC30" H 2550 3784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2550 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 2550 3350 50  0001 C CNN
	1    2550 3350
	1    0    0    -1  
$EndComp
Text GLabel 3750 3350 2    50   Input ~ 0
~IOSEL
Text GLabel 2000 4250 0    50   Input ~ 0
A15
Wire Wire Line
	3650 3750 3750 3750
Text GLabel 3750 3750 2    50   Input ~ 0
~RAMSEL
$Comp
L 74xx:74HC00 U7
U 1 1 618E57C3
P 3350 3750
F 0 "U7" H 3350 4075 50  0000 C CNN
F 1 "74HC00" H 3350 3984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3350 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3350 3750 50  0001 C CNN
	1    3350 3750
	1    0    0    -1  
$EndComp
Text GLabel 3750 4250 2    50   Input ~ 0
~ROMSEL
Wire Wire Line
	2200 4250 2000 4250
Wire Wire Line
	2200 4150 2200 4250
Connection ~ 2200 4250
Wire Wire Line
	2200 4250 2200 4350
Wire Wire Line
	2200 4350 2250 4350
Wire Wire Line
	2200 4150 2250 4150
$Comp
L 74xx:74HC00 U?
U 2 1 618B4F57
P 2550 4250
AR Path="/618B4F57" Ref="U?"  Part="2" 
AR Path="/61857D2D/618B4F57" Ref="U?"  Part="2" 
AR Path="/618AFEBD/618B4F57" Ref="U7"  Part="2" 
F 0 "U7" H 2550 4575 50  0000 C CNN
F 1 "74HC00" H 2550 4484 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2550 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 4250 50  0001 C CNN
	2    2550 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2450 2100 2450
Wire Wire Line
	2100 2450 2100 2350
Connection ~ 2100 2450
Wire Wire Line
	2100 2450 2100 2550
Wire Wire Line
	2100 2550 2250 2550
Wire Wire Line
	2100 2350 2250 2350
$Comp
L 74xx:74HC00 U6
U 3 1 614B0044
P 2550 2450
F 0 "U6" H 2550 2775 50  0000 C CNN
F 1 "74HC00" H 2550 2684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2550 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 2450 50  0001 C CNN
	3    2550 2450
	1    0    0    -1  
$EndComp
Text GLabel 1900 1300 0    50   Input ~ 0
RESET
Wire Wire Line
	1900 1300 2200 1300
Wire Wire Line
	2250 1200 2200 1200
Wire Wire Line
	2200 1400 2250 1400
Wire Wire Line
	2200 1300 2200 1400
Connection ~ 2200 1300
Wire Wire Line
	2200 1200 2200 1300
$Comp
L 74xx:74HC00 U?
U 1 1 61506758
P 2550 1300
AR Path="/61506758" Ref="U?"  Part="1" 
AR Path="/6187B23D/61506758" Ref="U?"  Part="1" 
AR Path="/618AFEBD/61506758" Ref="U6"  Part="1" 
F 0 "U6" H 2550 1625 50  0000 C CNN
F 1 "74HC00" H 2550 1534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2550 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 1300 50  0001 C CNN
	1    2550 1300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 61556396
P 5600 1600
AR Path="/61556396" Ref="U?"  Part="5" 
AR Path="/6187B23D/61556396" Ref="U?"  Part="5" 
AR Path="/618AFEBD/61556396" Ref="U7"  Part="5" 
F 0 "U7" H 5830 1646 50  0000 L CNN
F 1 "74HC00" H 5830 1555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5600 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5600 1600 50  0001 C CNN
	5    5600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3050 2250 3050
Text GLabel 2150 3050 0    50   Input ~ 0
A8
Wire Wire Line
	2150 3150 2250 3150
Text GLabel 2150 3150 0    50   Input ~ 0
A9
Wire Wire Line
	2150 3250 2250 3250
Text GLabel 2150 3250 0    50   Input ~ 0
A10
Wire Wire Line
	2150 3350 2250 3350
Text GLabel 2150 3350 0    50   Input ~ 0
A11
Wire Wire Line
	2150 3450 2250 3450
Text GLabel 2150 3450 0    50   Input ~ 0
A12
Wire Wire Line
	2150 3550 2250 3550
Text GLabel 2150 3550 0    50   Input ~ 0
A13
Wire Wire Line
	2150 3650 2250 3650
Text GLabel 2150 3650 0    50   Input ~ 0
A14
Wire Wire Line
	2850 4250 2950 4250
Wire Wire Line
	2950 4250 2950 3850
Wire Wire Line
	2950 3850 2150 3850
Wire Wire Line
	2150 3850 2150 3750
Wire Wire Line
	2150 3750 2250 3750
Wire Wire Line
	2950 3850 3050 3850
Connection ~ 2950 3850
Wire Wire Line
	2850 3350 2950 3350
Wire Wire Line
	3050 3650 2950 3650
Wire Wire Line
	2950 3650 2950 3350
Connection ~ 2950 3350
Wire Wire Line
	2950 3350 3750 3350
Wire Wire Line
	2950 4250 3750 4250
Connection ~ 2950 4250
Text Notes 4150 4300 0    50   ~ 0
8000-ffff
Text Notes 4150 3400 0    50   ~ 0
7f00-7fff
Text Notes 4150 3800 0    50   ~ 0
0000-7eff
$Comp
L 74xx:74LS138 U10
U 1 1 6163810B
P 2700 5500
F 0 "U10" H 2700 5500 50  0000 C CNN
F 1 "74HC138" H 2650 5400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2700 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2700 5500 50  0001 C CNN
	1    2700 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61639F92
P 2700 6250
AR Path="/61639F92" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61639F92" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61639F92" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2700 6000 50  0001 C CNN
F 1 "GND" H 2700 6100 50  0000 C CNN
F 2 "" H 2700 6250 50  0001 C CNN
F 3 "" H 2700 6250 50  0001 C CNN
	1    2700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6200 2700 6250
$Comp
L power:+5V #PWR?
U 1 1 6163DFF6
P 2700 4800
AR Path="/6163DFF6" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6163DFF6" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/6163DFF6" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 2700 4650 50  0001 C CNN
F 1 "+5V" H 2700 4950 50  0000 C CNN
F 2 "" H 2700 4800 50  0001 C CNN
F 3 "" H 2700 4800 50  0001 C CNN
	1    2700 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6163E688
P 2900 4850
AR Path="/6163E688" Ref="C?"  Part="1" 
AR Path="/6187B23D/6163E688" Ref="C?"  Part="1" 
AR Path="/618AFEBD/6163E688" Ref="C14"  Part="1" 
F 0 "C14" V 2648 4850 50  0000 C CNN
F 1 "100n" V 2739 4850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2938 4700 50  0001 C CNN
F 3 "~" H 2900 4850 50  0001 C CNN
	1    2900 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6163E692
P 3100 4900
AR Path="/6163E692" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6163E692" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/6163E692" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 3100 4650 50  0001 C CNN
F 1 "GND" H 3105 4727 50  0000 C CNN
F 2 "" H 3100 4900 50  0001 C CNN
F 3 "" H 3100 4900 50  0001 C CNN
	1    3100 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4800 2700 4850
Wire Wire Line
	2700 4850 2750 4850
Connection ~ 2700 4850
Wire Wire Line
	2700 4850 2700 4900
Wire Wire Line
	3050 4850 3100 4850
Wire Wire Line
	3100 4850 3100 4900
Text GLabel 2050 5200 0    50   Input ~ 0
A4
Text GLabel 2050 5300 0    50   Input ~ 0
A5
Text GLabel 2050 5400 0    50   Input ~ 0
A6
Wire Wire Line
	2050 5200 2200 5200
Wire Wire Line
	2050 5300 2200 5300
Wire Wire Line
	2050 5400 2200 5400
Wire Wire Line
	2150 5700 2200 5700
Text GLabel 1850 5900 0    50   Input ~ 0
~IOSEL
Wire Wire Line
	2050 5800 2200 5800
Text GLabel 2050 5800 0    50   Input ~ 0
A7
Wire Wire Line
	1850 5900 2200 5900
Text GLabel 3700 5400 2    50   Input ~ 0
~ACIASEL
Text GLabel 3700 5200 2    50   Input ~ 0
~VIA0SEL
Text GLabel 4100 5300 2    50   Input ~ 0
~VIA1SEL
Text Notes 3200 5200 0    50   ~ 0
7f00-7f0f
Text Notes 3200 5300 0    50   ~ 0
7f10-7f1f
Text Notes 3200 5400 0    50   ~ 0
7f20-7f2f
Text Notes 3200 5500 0    50   ~ 0
7f30-7f3f
Text Notes 3200 5600 0    50   ~ 0
7f40-7f4f
Text Notes 3200 5700 0    50   ~ 0
7f50-7f5f
Text Notes 3200 5800 0    50   ~ 0
7f60-7f6f
Text Notes 3200 5900 0    50   ~ 0
7f70-7f7f
Wire Wire Line
	3200 5200 3700 5200
Wire Wire Line
	3200 5300 4100 5300
Wire Wire Line
	3200 5400 3700 5400
Wire Wire Line
	3200 5600 3700 5600
Wire Wire Line
	3200 5500 4100 5500
Wire Wire Line
	3200 5700 3700 5700
Wire Wire Line
	3200 5800 3700 5800
Wire Wire Line
	3200 5900 3700 5900
NoConn ~ 3700 5900
$Comp
L 74xx:74LS21 U9
U 1 1 615F6BF5
P 6450 3300
F 0 "U9" H 6450 3675 50  0000 C CNN
F 1 "74HC21" H 6450 3584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6450 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 6450 3300 50  0001 C CNN
	1    6450 3300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U9
U 3 1 615F7E26
P 7300 1600
F 0 "U9" H 7530 1646 50  0000 L CNN
F 1 "74HC21" H 7530 1555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7300 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 7300 1600 50  0001 C CNN
	3    7300 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61606930
P 7300 1000
AR Path="/61606930" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61606930" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61606930" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 7300 850 50  0001 C CNN
F 1 "+5V" H 7300 1150 50  0000 C CNN
F 2 "" H 7300 1000 50  0001 C CNN
F 3 "" H 7300 1000 50  0001 C CNN
	1    7300 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6160693A
P 7500 1050
AR Path="/6160693A" Ref="C?"  Part="1" 
AR Path="/6187B23D/6160693A" Ref="C?"  Part="1" 
AR Path="/618AFEBD/6160693A" Ref="C13"  Part="1" 
F 0 "C13" V 7248 1050 50  0000 C CNN
F 1 "100n" V 7339 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7538 900 50  0001 C CNN
F 3 "~" H 7500 1050 50  0001 C CNN
	1    7500 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1000 7300 1050
Wire Wire Line
	7300 1050 7350 1050
Connection ~ 7300 1050
Wire Wire Line
	7300 1050 7300 1100
Wire Wire Line
	7650 1050 7700 1050
Wire Wire Line
	7700 1050 7700 1100
$Comp
L power:GND #PWR?
U 1 1 6160694A
P 7700 1100
AR Path="/6160694A" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6160694A" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/6160694A" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 7700 850 50  0001 C CNN
F 1 "GND" H 7705 927 50  0000 C CNN
F 2 "" H 7700 1100 50  0001 C CNN
F 3 "" H 7700 1100 50  0001 C CNN
	1    7700 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61606954
P 7300 2150
AR Path="/61606954" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61606954" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61606954" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 7300 1900 50  0001 C CNN
F 1 "GND" H 7300 2000 50  0000 C CNN
F 2 "" H 7300 2150 50  0001 C CNN
F 3 "" H 7300 2150 50  0001 C CNN
	1    7300 2150
	1    0    0    -1  
$EndComp
Text GLabel 7000 3300 2    50   Input ~ 0
~IRQ
Wire Wire Line
	6750 3300 7000 3300
Text GLabel 5950 3100 0    50   Input ~ 0
~IRQVIA0
Text GLabel 5950 3250 0    50   Input ~ 0
~IRQVIA1
Wire Wire Line
	6100 3450 6150 3450
Wire Wire Line
	5950 3250 6150 3250
Wire Wire Line
	5950 3100 6050 3100
Wire Wire Line
	6050 3100 6050 3150
Wire Wire Line
	6050 3150 6150 3150
Text GLabel 5950 3400 0    50   Input ~ 0
~IRQACIA
Wire Wire Line
	5950 3400 6050 3400
Wire Wire Line
	6050 3400 6050 3350
Wire Wire Line
	6050 3350 6150 3350
Wire Wire Line
	6100 3450 6100 3050
Wire Wire Line
	2150 5650 2150 5700
$Comp
L power:+5V #PWR?
U 1 1 61658FB1
P 2150 5650
AR Path="/61658FB1" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/61658FB1" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/61658FB1" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 2150 5500 50  0001 C CNN
F 1 "+5V" H 2165 5823 50  0000 C CNN
F 2 "" H 2150 5650 50  0001 C CNN
F 3 "" H 2150 5650 50  0001 C CNN
	1    2150 5650
	1    0    0    -1  
$EndComp
NoConn ~ 3700 5800
NoConn ~ 3700 5700
Text GLabel 4100 5500 2    50   Input ~ 0
~EXTSEL
Text GLabel 5950 3550 0    50   Input ~ 0
~IRQEXT
$Comp
L power:+5V #PWR?
U 1 1 617B9291
P 6100 2700
AR Path="/617B9291" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/617B9291" Ref="#PWR?"  Part="1" 
AR Path="/618AFEBD/617B9291" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 6100 2550 50  0001 C CNN
F 1 "+5V" H 6100 2850 50  0000 C CNN
F 2 "" H 6100 2700 50  0001 C CNN
F 3 "" H 6100 2700 50  0001 C CNN
	1    6100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 617B9297
P 6100 2900
AR Path="/617B9297" Ref="R?"  Part="1" 
AR Path="/61857D2D/617B9297" Ref="R?"  Part="1" 
AR Path="/618AFEBD/617B9297" Ref="R6"  Part="1" 
F 0 "R6" H 6150 2900 50  0000 L CNN
F 1 "3.3k" V 6100 2800 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 2900 50  0001 C CNN
F 3 "~" H 6100 2900 50  0001 C CNN
	1    6100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2750 6100 2700
Wire Wire Line
	5950 3550 6100 3550
Wire Wire Line
	6100 3550 6100 3450
Connection ~ 6100 3450
NoConn ~ 3700 5600
Wire Wire Line
	6450 2100 6450 2150
Wire Wire Line
	7300 2100 7300 2150
$Comp
L Mechanical:MountingHole H1
U 1 1 615E5FE7
P 8500 1000
F 0 "H1" H 8600 1046 50  0000 L CNN
F 1 "M0" H 8600 955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8500 1000 50  0001 C CNN
F 3 "~" H 8500 1000 50  0001 C CNN
	1    8500 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 615EAE7B
P 8500 1350
F 0 "H3" H 8600 1396 50  0000 L CNN
F 1 "M3" H 8600 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8500 1350 50  0001 C CNN
F 3 "~" H 8500 1350 50  0001 C CNN
	1    8500 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 615EB15B
P 9000 1000
F 0 "H2" H 9100 1046 50  0000 L CNN
F 1 "M1" H 9100 955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 9000 1000 50  0001 C CNN
F 3 "~" H 9000 1000 50  0001 C CNN
	1    9000 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 615EB685
P 9000 1350
F 0 "H4" H 9100 1396 50  0000 L CNN
F 1 "M2" H 9100 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 9000 1350 50  0001 C CNN
F 3 "~" H 9000 1350 50  0001 C CNN
	1    9000 1350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
