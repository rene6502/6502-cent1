EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "CPU"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 61877369
P 2950 4650
AR Path="/61877369" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61877369" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 2950 4400 50  0001 C CNN
F 1 "GND" H 2950 4500 50  0000 C CNN
F 2 "" H 2950 4650 50  0001 C CNN
F 3 "" H 2950 4650 50  0001 C CNN
	1    2950 4650
	1    0    0    -1  
$EndComp
$Comp
L 65xx:W65C02SxP U?
U 1 1 6187736F
P 2950 3050
AR Path="/6187736F" Ref="U?"  Part="1" 
AR Path="/61857D2D/6187736F" Ref="U5"  Part="1" 
F 0 "U5" H 2950 3350 50  0000 C CNN
F 1 "W65C02S" H 2950 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket_LongPads" H 2950 5050 50  0001 C CNN
F 3 "http://www.westerndesigncenter.com/wdc/documentation/w65c02s.pdf" H 2950 4950 50  0001 C CNN
	1    2950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4600 2950 4650
$Comp
L power:+5V #PWR?
U 1 1 61877376
P 2950 1400
AR Path="/61877376" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61877376" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 2950 1250 50  0001 C CNN
F 1 "+5V" H 2950 1550 50  0000 C CNN
F 2 "" H 2950 1400 50  0001 C CNN
F 3 "" H 2950 1400 50  0001 C CNN
	1    2950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1400 2950 1450
$Comp
L Oscillator:GTXO-14T X?
U 1 1 6187737D
P 1300 2150
AR Path="/6187737D" Ref="X?"  Part="1" 
AR Path="/61857D2D/6187737D" Ref="X1"  Part="1" 
F 0 "X1" H 1400 2500 50  0000 L CNN
F 1 "1MHz" H 1400 2400 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1750 1800 50  0001 C CNN
F 3 "http://www.golledge.com/pdf/products/tcxos/gtxo14.pdf" H 1200 2150 50  0001 C CNN
	1    1300 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61877383
P 1300 1800
AR Path="/61877383" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61877383" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 1300 1650 50  0001 C CNN
F 1 "+5V" H 1300 1950 50  0000 C CNN
F 2 "" H 1300 1800 50  0001 C CNN
F 3 "" H 1300 1800 50  0001 C CNN
	1    1300 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61877389
P 1300 2500
AR Path="/61877389" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61877389" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 1300 2250 50  0001 C CNN
F 1 "GND" H 1300 2350 50  0000 C CNN
F 2 "" H 1300 2500 50  0001 C CNN
F 3 "" H 1300 2500 50  0001 C CNN
	1    1300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1800 1300 1850
Wire Wire Line
	1300 2450 1300 2500
NoConn ~ 1000 2150
NoConn ~ 2350 2350
NoConn ~ 2350 2250
Wire Wire Line
	1600 2150 2350 2150
$Comp
L power:+5V #PWR?
U 1 1 61877395
P 1300 2950
AR Path="/61877395" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61877395" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 1300 2800 50  0001 C CNN
F 1 "+5V" H 1300 3100 50  0000 C CNN
F 2 "" H 1300 2950 50  0001 C CNN
F 3 "" H 1300 2950 50  0001 C CNN
	1    1300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6187739B
P 1300 3150
AR Path="/6187739B" Ref="R?"  Part="1" 
AR Path="/61857D2D/6187739B" Ref="R4"  Part="1" 
F 0 "R4" H 1350 3150 50  0000 L CNN
F 1 "3.3k" V 1300 3050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1230 3150 50  0001 C CNN
F 3 "~" H 1300 3150 50  0001 C CNN
	1    1300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3300 1300 3450
Wire Wire Line
	1300 3450 2350 3450
Wire Wire Line
	1300 3000 1300 2950
$Comp
L Device:R R?
U 1 1 618773A4
P 1600 3150
AR Path="/618773A4" Ref="R?"  Part="1" 
AR Path="/61857D2D/618773A4" Ref="R5"  Part="1" 
F 0 "R5" H 1650 3150 50  0000 L CNN
F 1 "3.3k" V 1600 3050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 3150 50  0001 C CNN
F 3 "~" H 1600 3150 50  0001 C CNN
	1    1600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3300 1600 3350
Wire Wire Line
	1600 3350 2350 3350
$Comp
L power:+5V #PWR?
U 1 1 618773AC
P 1600 2950
AR Path="/618773AC" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773AC" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 1600 2800 50  0001 C CNN
F 1 "+5V" H 1600 3100 50  0000 C CNN
F 2 "" H 1600 2950 50  0001 C CNN
F 3 "" H 1600 2950 50  0001 C CNN
	1    1600 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2950 1600 3000
$Comp
L Device:C C?
U 1 1 618773B4
P 3150 1450
AR Path="/618773B4" Ref="C?"  Part="1" 
AR Path="/61857D2D/618773B4" Ref="C7"  Part="1" 
F 0 "C7" V 2898 1450 50  0000 C CNN
F 1 "100n" V 2989 1450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3188 1300 50  0001 C CNN
F 3 "~" H 3150 1450 50  0001 C CNN
	1    3150 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618773BA
P 3350 1500
AR Path="/618773BA" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773BA" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 3350 1250 50  0001 C CNN
F 1 "GND" H 3355 1327 50  0000 C CNN
F 2 "" H 3350 1500 50  0001 C CNN
F 3 "" H 3350 1500 50  0001 C CNN
	1    3350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1450 3350 1450
Wire Wire Line
	3350 1450 3350 1500
Wire Wire Line
	3000 1450 2950 1450
Connection ~ 2950 1450
Wire Wire Line
	2950 1450 2950 1500
$Comp
L power:+5V #PWR?
U 1 1 618773C5
P 1850 2650
AR Path="/618773C5" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773C5" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 1850 2500 50  0001 C CNN
F 1 "+5V" H 1865 2823 50  0000 C CNN
F 2 "" H 1850 2650 50  0001 C CNN
F 3 "" H 1850 2650 50  0001 C CNN
	1    1850 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2650 1850 2750
Wire Wire Line
	1850 2750 2350 2750
NoConn ~ 2350 3750
NoConn ~ 2350 3850
NoConn ~ 2350 3950
NoConn ~ 2350 4250
Text GLabel 2300 1850 0    50   Input ~ 0
~RES
Wire Wire Line
	2300 1850 2350 1850
$Comp
L Memory_EEPROM:28C256 U?
U 1 1 618773D3
P 5600 2700
AR Path="/618773D3" Ref="U?"  Part="1" 
AR Path="/61857D2D/618773D3" Ref="U4"  Part="1" 
F 0 "U4" H 5600 2800 50  0000 C CNN
F 1 "28C256" H 5650 2700 50  0000 C CNN
F 2 "Socket:DIP_Socket-28_W11.9_W12.7_W15.24_W17.78_W18.5_3M_228-1277-00-0602J" H 5600 2700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 5600 2700 50  0001 C CNN
	1    5600 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 618773D9
P 5600 1350
AR Path="/618773D9" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773D9" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 5600 1200 50  0001 C CNN
F 1 "+5V" H 5600 1500 50  0000 C CNN
F 2 "" H 5600 1350 50  0001 C CNN
F 3 "" H 5600 1350 50  0001 C CNN
	1    5600 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 618773DF
P 5800 1450
AR Path="/618773DF" Ref="C?"  Part="1" 
AR Path="/61857D2D/618773DF" Ref="C8"  Part="1" 
F 0 "C8" V 5548 1450 50  0000 C CNN
F 1 "100n" V 5639 1450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5838 1300 50  0001 C CNN
F 3 "~" H 5800 1450 50  0001 C CNN
	1    5800 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618773E5
P 6000 1500
AR Path="/618773E5" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773E5" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 6000 1250 50  0001 C CNN
F 1 "GND" H 6005 1327 50  0000 C CNN
F 2 "" H 6000 1500 50  0001 C CNN
F 3 "" H 6000 1500 50  0001 C CNN
	1    6000 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1350 5600 1450
Wire Wire Line
	5600 1450 5650 1450
Connection ~ 5600 1450
Wire Wire Line
	5600 1450 5600 1600
Wire Wire Line
	5950 1450 6000 1450
Wire Wire Line
	6000 1450 6000 1500
$Comp
L power:GND #PWR?
U 1 1 618773F1
P 5600 3850
AR Path="/618773F1" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618773F1" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 5600 3600 50  0001 C CNN
F 1 "GND" H 5600 3700 50  0000 C CNN
F 2 "" H 5600 3850 50  0001 C CNN
F 3 "" H 5600 3850 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3800 5600 3850
Text GLabel 2300 3050 0    50   Input ~ 0
R~W
Wire Wire Line
	2300 3050 2350 3050
Text GLabel 4900 3600 0    50   Input ~ 0
~ROMSEL
$Comp
L Memory_RAM:HM62256BLP U3
U 1 1 618B6DEF
P 7450 2500
F 0 "U3" H 7500 2500 50  0000 C CNN
F 1 "62C256" H 7500 2400 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 7450 2400 50  0001 C CNN
F 3 "https://web.mit.edu/6.115/www/document/62256.pdf" H 7450 2400 50  0001 C CNN
	1    7450 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618BB119
P 7450 3450
AR Path="/618BB119" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618BB119" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7450 3200 50  0001 C CNN
F 1 "GND" H 7450 3300 50  0000 C CNN
F 2 "" H 7450 3450 50  0001 C CNN
F 3 "" H 7450 3450 50  0001 C CNN
	1    7450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3400 7450 3450
$Comp
L power:+5V #PWR?
U 1 1 618BE703
P 7450 1350
AR Path="/618BE703" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618BE703" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7450 1200 50  0001 C CNN
F 1 "+5V" H 7450 1500 50  0000 C CNN
F 2 "" H 7450 1350 50  0001 C CNN
F 3 "" H 7450 1350 50  0001 C CNN
	1    7450 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 618BE913
P 7650 1450
AR Path="/618BE913" Ref="C?"  Part="1" 
AR Path="/61857D2D/618BE913" Ref="C9"  Part="1" 
F 0 "C9" V 7398 1450 50  0000 C CNN
F 1 "100n" V 7489 1450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7688 1300 50  0001 C CNN
F 3 "~" H 7650 1450 50  0001 C CNN
	1    7650 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618BE91D
P 7850 1500
AR Path="/618BE91D" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/618BE91D" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 7850 1250 50  0001 C CNN
F 1 "GND" H 7855 1327 50  0000 C CNN
F 2 "" H 7850 1500 50  0001 C CNN
F 3 "" H 7850 1500 50  0001 C CNN
	1    7850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1350 7450 1450
Wire Wire Line
	7450 1450 7500 1450
Connection ~ 7450 1450
Wire Wire Line
	7450 1450 7450 1600
Wire Wire Line
	7800 1450 7850 1450
Wire Wire Line
	7850 1450 7850 1500
Text GLabel 8050 3000 2    50   Input ~ 0
~WE
Wire Wire Line
	7950 3000 8050 3000
Text GLabel 8050 2700 2    50   Input ~ 0
~RAMSEL
Wire Wire Line
	7950 2700 8050 2700
Wire Wire Line
	7950 2900 8250 2900
Text GLabel 2300 2050 0    50   Input ~ 0
CLK
Wire Wire Line
	2300 2050 2350 2050
Wire Wire Line
	2350 2050 2350 2150
Connection ~ 2350 2150
Text GLabel 3650 1850 2    50   Input ~ 0
A0
Text GLabel 3650 1950 2    50   Input ~ 0
A1
Text GLabel 3650 2050 2    50   Input ~ 0
A2
Text GLabel 3650 2150 2    50   Input ~ 0
A3
Text GLabel 3650 2250 2    50   Input ~ 0
A4
Text GLabel 3650 2350 2    50   Input ~ 0
A5
Text GLabel 3650 2450 2    50   Input ~ 0
A6
Text GLabel 3650 2550 2    50   Input ~ 0
A7
Text GLabel 3650 2650 2    50   Input ~ 0
A8
Text GLabel 3650 2750 2    50   Input ~ 0
A9
Text GLabel 3650 2850 2    50   Input ~ 0
A10
Text GLabel 3650 2950 2    50   Input ~ 0
A11
Text GLabel 3650 3050 2    50   Input ~ 0
A12
Text GLabel 3650 3150 2    50   Input ~ 0
A13
Text GLabel 3650 3250 2    50   Input ~ 0
A14
Text GLabel 3650 3350 2    50   Input ~ 0
A15
Wire Wire Line
	3550 1850 3650 1850
Wire Wire Line
	3550 1950 3650 1950
Wire Wire Line
	3550 2050 3650 2050
Wire Wire Line
	3550 2150 3650 2150
Wire Wire Line
	3550 2250 3650 2250
Wire Wire Line
	3550 2350 3650 2350
Wire Wire Line
	3550 2450 3650 2450
Wire Wire Line
	3550 2550 3650 2550
Wire Wire Line
	3550 2650 3650 2650
Wire Wire Line
	3550 2750 3650 2750
Wire Wire Line
	3550 2850 3650 2850
Wire Wire Line
	3550 2950 3650 2950
Wire Wire Line
	3550 3050 3650 3050
Wire Wire Line
	3550 3150 3650 3150
Wire Wire Line
	3550 3250 3650 3250
Wire Wire Line
	3550 3350 3650 3350
Text GLabel 3650 3550 2    50   Input ~ 0
D0
Text GLabel 3650 3650 2    50   Input ~ 0
D1
Text GLabel 3650 3750 2    50   Input ~ 0
D2
Text GLabel 3650 3850 2    50   Input ~ 0
D3
Text GLabel 3650 3950 2    50   Input ~ 0
D4
Text GLabel 3650 4050 2    50   Input ~ 0
D5
Text GLabel 3650 4150 2    50   Input ~ 0
D6
Text GLabel 3650 4250 2    50   Input ~ 0
D7
Wire Wire Line
	3550 3550 3650 3550
Wire Wire Line
	3550 3650 3650 3650
Wire Wire Line
	3550 3750 3650 3750
Wire Wire Line
	3550 3850 3650 3850
Wire Wire Line
	3550 3950 3650 3950
Wire Wire Line
	3550 4050 3650 4050
Wire Wire Line
	3550 4150 3650 4150
Wire Wire Line
	3550 4250 3650 4250
Text GLabel 5100 1800 0    50   Input ~ 0
A0
Text GLabel 5100 1900 0    50   Input ~ 0
A1
Text GLabel 5100 2000 0    50   Input ~ 0
A2
Text GLabel 5100 2100 0    50   Input ~ 0
A3
Text GLabel 5100 2200 0    50   Input ~ 0
A4
Text GLabel 5100 2300 0    50   Input ~ 0
A5
Text GLabel 5100 2400 0    50   Input ~ 0
A6
Text GLabel 5100 2500 0    50   Input ~ 0
A7
Text GLabel 5100 2600 0    50   Input ~ 0
A8
Text GLabel 5100 2700 0    50   Input ~ 0
A9
Text GLabel 5100 2800 0    50   Input ~ 0
A10
Text GLabel 5100 2900 0    50   Input ~ 0
A11
Text GLabel 5100 3000 0    50   Input ~ 0
A12
Text GLabel 5100 3100 0    50   Input ~ 0
A13
Text GLabel 5100 3200 0    50   Input ~ 0
A14
Wire Wire Line
	5100 1800 5200 1800
Wire Wire Line
	5100 1900 5200 1900
Wire Wire Line
	5100 2000 5200 2000
Wire Wire Line
	5100 2100 5200 2100
Wire Wire Line
	5100 2200 5200 2200
Wire Wire Line
	5100 2300 5200 2300
Wire Wire Line
	5100 2400 5200 2400
Wire Wire Line
	5100 2500 5200 2500
Wire Wire Line
	5100 2600 5200 2600
Wire Wire Line
	5100 2700 5200 2700
Wire Wire Line
	5100 2800 5200 2800
Wire Wire Line
	5100 2900 5200 2900
Wire Wire Line
	5100 3000 5200 3000
Wire Wire Line
	5100 3100 5200 3100
Wire Wire Line
	5100 3200 5200 3200
Text GLabel 6100 1800 2    50   Input ~ 0
D0
Text GLabel 6100 1900 2    50   Input ~ 0
D1
Text GLabel 6100 2000 2    50   Input ~ 0
D2
Text GLabel 6100 2100 2    50   Input ~ 0
D3
Text GLabel 6100 2200 2    50   Input ~ 0
D4
Text GLabel 6100 2300 2    50   Input ~ 0
D5
Text GLabel 6100 2400 2    50   Input ~ 0
D6
Text GLabel 6100 2500 2    50   Input ~ 0
D7
Wire Wire Line
	6000 1800 6100 1800
Wire Wire Line
	6000 1900 6100 1900
Wire Wire Line
	6000 2000 6100 2000
Wire Wire Line
	6000 2100 6100 2100
Wire Wire Line
	6000 2200 6100 2200
Wire Wire Line
	6000 2300 6100 2300
Wire Wire Line
	6000 2400 6100 2400
Wire Wire Line
	6000 2500 6100 2500
Text GLabel 6850 1800 0    50   Input ~ 0
A0
Text GLabel 6850 1900 0    50   Input ~ 0
A1
Text GLabel 6850 2000 0    50   Input ~ 0
A2
Text GLabel 6850 2100 0    50   Input ~ 0
A3
Text GLabel 6850 2200 0    50   Input ~ 0
A4
Text GLabel 6850 2300 0    50   Input ~ 0
A5
Text GLabel 6850 2400 0    50   Input ~ 0
A6
Text GLabel 6850 2500 0    50   Input ~ 0
A7
Text GLabel 6850 2600 0    50   Input ~ 0
A8
Text GLabel 6850 2700 0    50   Input ~ 0
A9
Text GLabel 6850 2800 0    50   Input ~ 0
A10
Text GLabel 6850 2900 0    50   Input ~ 0
A11
Text GLabel 6850 3000 0    50   Input ~ 0
A12
Text GLabel 6850 3100 0    50   Input ~ 0
A13
Text GLabel 6850 3200 0    50   Input ~ 0
A14
Wire Wire Line
	6850 1800 6950 1800
Wire Wire Line
	6850 1900 6950 1900
Wire Wire Line
	6850 2000 6950 2000
Wire Wire Line
	6850 2100 6950 2100
Wire Wire Line
	6850 2200 6950 2200
Wire Wire Line
	6850 2300 6950 2300
Wire Wire Line
	6850 2400 6950 2400
Wire Wire Line
	6850 2500 6950 2500
Wire Wire Line
	6850 2600 6950 2600
Wire Wire Line
	6850 2700 6950 2700
Wire Wire Line
	6850 2800 6950 2800
Wire Wire Line
	6850 2900 6950 2900
Wire Wire Line
	6850 3000 6950 3000
Wire Wire Line
	6850 3100 6950 3100
Text GLabel 8050 1800 2    50   Input ~ 0
D0
Text GLabel 8050 1900 2    50   Input ~ 0
D1
Text GLabel 8050 2000 2    50   Input ~ 0
D2
Text GLabel 8050 2100 2    50   Input ~ 0
D3
Text GLabel 8050 2200 2    50   Input ~ 0
D4
Text GLabel 8050 2300 2    50   Input ~ 0
D5
Text GLabel 8050 2400 2    50   Input ~ 0
D6
Text GLabel 8050 2500 2    50   Input ~ 0
D7
Wire Wire Line
	7950 1800 8050 1800
Wire Wire Line
	7950 1900 8050 1900
Wire Wire Line
	7950 2000 8050 2000
Wire Wire Line
	7950 2100 8050 2100
Wire Wire Line
	7950 2200 8050 2200
Wire Wire Line
	7950 2300 8050 2300
Wire Wire Line
	7950 2400 8050 2400
Wire Wire Line
	7950 2500 8050 2500
Text GLabel 2300 2650 0    50   Input ~ 0
~IRQ
Wire Wire Line
	2300 2650 2350 2650
$Comp
L power:+5V #PWR?
U 1 1 6148D529
P 4800 3350
AR Path="/6148D529" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/6148D529" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 4800 3200 50  0001 C CNN
F 1 "+5V" H 4815 3523 50  0000 C CNN
F 2 "" H 4800 3350 50  0001 C CNN
F 3 "" H 4800 3350 50  0001 C CNN
	1    4800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3350 4800 3400
Wire Wire Line
	4800 3400 5200 3400
Text GLabel 5100 3500 0    50   Input ~ 0
~OE
Wire Wire Line
	5100 3500 5200 3500
Wire Wire Line
	6850 3200 6950 3200
Text GLabel 8250 2900 2    50   Input ~ 0
~OE
Wire Wire Line
	4900 3600 5200 3600
Text GLabel 4450 4650 0    50   Input ~ 0
A0
Text GLabel 4450 4750 0    50   Input ~ 0
A1
Text GLabel 4450 4850 0    50   Input ~ 0
A2
Text GLabel 4450 4950 0    50   Input ~ 0
A3
Text GLabel 4450 5050 0    50   Input ~ 0
A4
Text GLabel 4450 5150 0    50   Input ~ 0
A5
Text GLabel 4450 5250 0    50   Input ~ 0
A6
Text GLabel 4450 5350 0    50   Input ~ 0
A7
Text GLabel 4450 5450 0    50   Input ~ 0
A8
Text GLabel 4450 5550 0    50   Input ~ 0
A9
Text GLabel 4450 5650 0    50   Input ~ 0
A10
Text GLabel 4450 5750 0    50   Input ~ 0
A11
Text GLabel 4450 5850 0    50   Input ~ 0
A12
Text GLabel 4450 5950 0    50   Input ~ 0
A13
Text GLabel 4450 6050 0    50   Input ~ 0
A14
Text GLabel 4450 6150 0    50   Input ~ 0
A15
Text GLabel 5150 4650 2    50   Input ~ 0
D0
Text GLabel 5150 4750 2    50   Input ~ 0
D1
Text GLabel 5150 4850 2    50   Input ~ 0
D2
Text GLabel 5150 4950 2    50   Input ~ 0
D3
Text GLabel 5150 5050 2    50   Input ~ 0
D4
Text GLabel 5150 5150 2    50   Input ~ 0
D5
Text GLabel 5150 5250 2    50   Input ~ 0
D6
Text GLabel 5150 5350 2    50   Input ~ 0
D7
Wire Wire Line
	5050 4650 5150 4650
Wire Wire Line
	5050 4750 5150 4750
Wire Wire Line
	5050 4850 5150 4850
Wire Wire Line
	5050 4950 5150 4950
Wire Wire Line
	5050 5050 5150 5050
Wire Wire Line
	5050 5150 5150 5150
Wire Wire Line
	5050 5250 5150 5250
Wire Wire Line
	5050 5350 5150 5350
Wire Wire Line
	4450 4650 4550 4650
Wire Wire Line
	4450 4750 4550 4750
Wire Wire Line
	4450 4850 4550 4850
Wire Wire Line
	4450 4950 4550 4950
Wire Wire Line
	4450 5050 4550 5050
Wire Wire Line
	4450 5150 4550 5150
Wire Wire Line
	4450 5250 4550 5250
Wire Wire Line
	4450 5350 4550 5350
Wire Wire Line
	4450 5450 4550 5450
Wire Wire Line
	4450 5550 4550 5550
Wire Wire Line
	4450 5650 4550 5650
Wire Wire Line
	4450 5750 4550 5750
Wire Wire Line
	4450 5850 4550 5850
Wire Wire Line
	4450 5950 4550 5950
Wire Wire Line
	4450 6050 4550 6050
Wire Wire Line
	4450 6150 4550 6150
$Comp
L power:GND #PWR?
U 1 1 61759E32
P 5150 6200
AR Path="/61759E32" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/61759E32" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5150 5950 50  0001 C CNN
F 1 "GND" H 5150 6050 50  0000 C CNN
F 2 "" H 5150 6200 50  0001 C CNN
F 3 "" H 5150 6200 50  0001 C CNN
	1    5150 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6150 5150 6150
Wire Wire Line
	5150 6150 5150 6200
$Comp
L power:+5V #PWR?
U 1 1 6177027D
P 5500 6050
AR Path="/6177027D" Ref="#PWR?"  Part="1" 
AR Path="/61857D2D/6177027D" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 5500 5900 50  0001 C CNN
F 1 "+5V" H 5600 6150 50  0000 C CNN
F 2 "" H 5500 6050 50  0001 C CNN
F 3 "" H 5500 6050 50  0001 C CNN
	1    5500 6050
	1    0    0    -1  
$EndComp
Text GLabel 5150 5450 2    50   Input ~ 0
CLK
Text GLabel 5500 5550 2    50   Input ~ 0
R~W
Text GLabel 5500 5750 2    50   Input ~ 0
~RES
Text GLabel 5150 5650 2    50   Input ~ 0
~EXTSEL
Text GLabel 5150 5850 2    50   Input ~ 0
~IRQEXT
Wire Wire Line
	5050 5450 5150 5450
Wire Wire Line
	5050 5550 5500 5550
Wire Wire Line
	5050 5650 5150 5650
Wire Wire Line
	5050 5750 5500 5750
Wire Wire Line
	5050 5850 5150 5850
$Comp
L Connector_Generic:Conn_02x16_Top_Bottom J2
U 1 1 617EFFE5
P 4750 5350
F 0 "J2" H 4800 6267 50  0000 C CNN
F 1 "Expansion" H 4800 6176 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 4750 5350 50  0001 C CNN
F 3 "~" H 4750 5350 50  0001 C CNN
	1    4750 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6050 5500 6050
NoConn ~ 5050 5950
$EndSCHEMATC
