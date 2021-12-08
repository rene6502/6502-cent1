EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "Power"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 6188FE75
P 1250 1500
AR Path="/6188FE75" Ref="J?"  Part="1" 
AR Path="/6187B23D/6188FE75" Ref="J1"  Part="1" 
F 0 "J1" H 1307 1817 50  0000 C CNN
F 1 "Ext. Power" H 1307 1726 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1300 1460 50  0001 C CNN
F 3 "~" H 1300 1460 50  0001 C CNN
	1    1250 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6188FE7B
P 3350 1700
AR Path="/6188FE7B" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FE7B" Ref="C1"  Part="1" 
F 0 "C1" H 3465 1746 50  0000 L CNN
F 1 "100n" H 3465 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3388 1550 50  0001 C CNN
F 3 "~" H 3350 1700 50  0001 C CNN
	1    3350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1500 1700 1500
Wire Wire Line
	1700 1600 1550 1600
Wire Wire Line
	3350 1400 3350 1550
Wire Wire Line
	4650 1800 4650 1750
Wire Wire Line
	4650 1450 4650 1400
Wire Wire Line
	1700 1500 1700 1600
$Comp
L Device:CP C?
U 1 1 6188FE8E
P 2000 1750
AR Path="/6188FE8E" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FE8E" Ref="C2"  Part="1" 
F 0 "C2" H 2118 1796 50  0000 L CNN
F 1 "1u" H 2118 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2038 1600 50  0001 C CNN
F 3 "~" H 2000 1750 50  0001 C CNN
	1    2000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1400 2000 1600
$Comp
L power:GND #PWR?
U 1 1 6188FE95
P 2800 2300
AR Path="/6188FE95" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6188FE95" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 2800 2050 50  0001 C CNN
F 1 "GND" H 2800 2150 50  0000 C CNN
F 2 "" H 2800 2300 50  0001 C CNN
F 3 "" H 2800 2300 50  0001 C CNN
	1    2800 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2200 3350 2200
Wire Wire Line
	4650 2200 4650 2100
Connection ~ 2800 2200
Wire Wire Line
	2800 2200 2800 2300
Wire Wire Line
	2000 2200 2000 1900
Wire Wire Line
	2000 2200 1700 2200
Wire Wire Line
	1700 2200 1700 1600
Connection ~ 2000 2200
Connection ~ 1700 1600
Wire Wire Line
	3350 2200 3350 1850
$Comp
L Device:R R?
U 1 1 6188FEA8
P 4650 1600
AR Path="/6188FEA8" Ref="R?"  Part="1" 
AR Path="/6187B23D/6188FEA8" Ref="R1"  Part="1" 
F 0 "R1" H 4700 1600 50  0000 L CNN
F 1 "1k" V 4650 1550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4580 1600 50  0001 C CNN
F 3 "~" H 4650 1600 50  0001 C CNN
	1    4650 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1400 2100 1400
$Comp
L Diode:1N5819 D?
U 1 1 6188FEAF
P 2250 1400
AR Path="/6188FEAF" Ref="D?"  Part="1" 
AR Path="/6187B23D/6188FEAF" Ref="D1"  Part="1" 
F 0 "D1" H 2250 1183 50  0000 C CNN
F 1 "1N5819" H 2250 1274 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 2250 1225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 2250 1400 50  0001 C CNN
	1    2250 1400
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Linear:L7805 U?
U 1 1 6188FEB5
P 2800 1400
AR Path="/6188FEB5" Ref="U?"  Part="1" 
AR Path="/6187B23D/6188FEB5" Ref="U1"  Part="1" 
F 0 "U1" H 2800 1642 50  0000 C CNN
F 1 "L7805" H 2800 1551 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2825 1250 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2800 1350 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1400 3350 1400
Wire Wire Line
	2800 1700 2800 2200
Wire Wire Line
	1550 1400 2000 1400
Connection ~ 2000 1400
Text Notes 1000 1100 0    50   ~ 0
Power supply
$Comp
L Timer:NE555D U?
U 1 1 6188FEE0
P 2700 3900
AR Path="/6188FEE0" Ref="U?"  Part="1" 
AR Path="/6187B23D/6188FEE0" Ref="U2"  Part="1" 
F 0 "U2" H 2700 3950 50  0000 C CNN
F 1 "NE555" H 2700 3850 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 3550 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 3550 3500 50  0001 C CNN
	1    2700 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6188FEE6
P 1600 3450
AR Path="/6188FEE6" Ref="R?"  Part="1" 
AR Path="/6187B23D/6188FEE6" Ref="R2"  Part="1" 
F 0 "R2" H 1670 3496 50  0000 L CNN
F 1 "1M" V 1600 3400 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 3450 50  0001 C CNN
F 3 "~" H 1600 3450 50  0001 C CNN
	1    1600 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6188FEEC
P 3350 3500
AR Path="/6188FEEC" Ref="R?"  Part="1" 
AR Path="/6187B23D/6188FEEC" Ref="R3"  Part="1" 
F 0 "R3" H 3420 3546 50  0000 L CNN
F 1 "47k" V 3350 3450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3280 3500 50  0001 C CNN
F 3 "~" H 3350 3500 50  0001 C CNN
	1    3350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6188FEF2
P 2950 3450
AR Path="/6188FEF2" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FEF2" Ref="C3"  Part="1" 
F 0 "C3" V 2698 3450 50  0000 C CNN
F 1 "100n" V 2789 3450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2988 3300 50  0001 C CNN
F 3 "~" H 2950 3450 50  0001 C CNN
	1    2950 3450
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6188FEF8
P 2700 3250
AR Path="/6188FEF8" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6188FEF8" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 2700 3100 50  0001 C CNN
F 1 "+5V" H 2700 3400 50  0000 C CNN
F 2 "" H 2700 3250 50  0001 C CNN
F 3 "" H 2700 3250 50  0001 C CNN
	1    2700 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6188FEFE
P 2700 4550
AR Path="/6188FEFE" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6188FEFE" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 2700 4300 50  0001 C CNN
F 1 "GND" H 2700 4400 50  0000 C CNN
F 2 "" H 2700 4550 50  0001 C CNN
F 3 "" H 2700 4550 50  0001 C CNN
	1    2700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3500 2700 3450
Connection ~ 2700 3450
Wire Wire Line
	2700 3450 2700 3300
Wire Wire Line
	1950 4050 1950 3900
Wire Wire Line
	1950 3900 2200 3900
Wire Wire Line
	1600 4050 1600 3700
Wire Wire Line
	1600 3700 2200 3700
Connection ~ 1600 3700
Wire Wire Line
	1600 3600 1600 3700
Wire Wire Line
	1600 3300 2150 3300
Connection ~ 2700 3300
Wire Wire Line
	2700 3300 2700 3250
Wire Wire Line
	3350 3900 3200 3900
Wire Wire Line
	3200 4100 3350 4100
Connection ~ 3350 4100
Wire Wire Line
	3350 4100 3350 3900
Wire Wire Line
	3350 3650 3350 3900
Connection ~ 3350 3900
Wire Wire Line
	3350 3350 3350 3300
Wire Wire Line
	3350 3300 2700 3300
$Comp
L power:GND #PWR?
U 1 1 6188FF18
P 3200 3500
AR Path="/6188FF18" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6188FF18" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 3200 3250 50  0001 C CNN
F 1 "GND" H 3205 3327 50  0000 C CNN
F 2 "" H 3200 3500 50  0001 C CNN
F 3 "" H 3200 3500 50  0001 C CNN
	1    3200 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3450 2800 3450
Wire Wire Line
	1100 4000 1100 3700
Wire Wire Line
	1100 3700 1600 3700
Wire Wire Line
	3350 4150 3350 4100
$Comp
L Device:CP C?
U 1 1 6188FF22
P 3350 4300
AR Path="/6188FF22" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FF22" Ref="C6"  Part="1" 
F 0 "C6" H 3468 4346 50  0000 L CNN
F 1 "10u" H 3468 4255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3388 4150 50  0001 C CNN
F 3 "~" H 3350 4300 50  0001 C CNN
	1    3350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4550 2700 4500
Wire Wire Line
	3350 4450 3350 4500
Wire Wire Line
	3350 4500 2700 4500
Connection ~ 2700 4500
Wire Wire Line
	2700 4500 2700 4300
$Comp
L Switch:SW_Push SW?
U 1 1 6188FF2D
P 1100 4200
AR Path="/6188FF2D" Ref="SW?"  Part="1" 
AR Path="/6187B23D/6188FF2D" Ref="SW1"  Part="1" 
F 0 "SW1" V 1054 4348 50  0000 L CNN
F 1 "Reset" V 1145 4348 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 1100 4400 50  0001 C CNN
F 3 "~" H 1100 4400 50  0001 C CNN
	1    1100 4200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 6188FF33
P 1950 4200
AR Path="/6188FF33" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FF33" Ref="C5"  Part="1" 
F 0 "C5" H 2065 4246 50  0000 L CNN
F 1 "10n" H 2065 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1988 4050 50  0001 C CNN
F 3 "~" H 1950 4200 50  0001 C CNN
	1    1950 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6188FF39
P 1600 4200
AR Path="/6188FF39" Ref="C?"  Part="1" 
AR Path="/6187B23D/6188FF39" Ref="C4"  Part="1" 
F 0 "C4" H 1715 4246 50  0000 L CNN
F 1 "100n" H 1715 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1638 4050 50  0001 C CNN
F 3 "~" H 1600 4200 50  0001 C CNN
	1    1600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 4400 1100 4500
Wire Wire Line
	1100 4500 1600 4500
Wire Wire Line
	1600 4350 1600 4500
Connection ~ 1600 4500
Wire Wire Line
	1600 4500 1950 4500
Wire Wire Line
	1950 4350 1950 4500
Connection ~ 1950 4500
Wire Wire Line
	1950 4500 2700 4500
Wire Wire Line
	3100 3450 3200 3450
Wire Wire Line
	3200 3450 3200 3500
Text Notes 1000 3100 0    50   ~ 0
Reset circuit
Wire Wire Line
	2200 4100 2150 4100
Wire Wire Line
	2150 4100 2150 3300
Connection ~ 2150 3300
Wire Wire Line
	2150 3300 2700 3300
Text Notes 2850 4750 0    50   ~ 0
After power on, Q\nwill be high for ~~0.5s
$Comp
L power:+5V #PWR?
U 1 1 6188FED3
P 4350 1200
AR Path="/6188FED3" Ref="#PWR?"  Part="1" 
AR Path="/6187B23D/6188FED3" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 4350 1050 50  0001 C CNN
F 1 "+5V" H 4350 1350 50  0000 C CNN
F 2 "" H 4350 1200 50  0001 C CNN
F 3 "" H 4350 1200 50  0001 C CNN
	1    4350 1200
	1    0    0    -1  
$EndComp
Text GLabel 3900 2050 0    50   Input ~ 0
USB+5V
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 6152593A
P 4000 1700
F 0 "JP1" V 4050 1450 50  0000 L CNN
F 1 "Power" V 4150 1400 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 1700 50  0001 C CNN
F 3 "~" H 4000 1700 50  0001 C CNN
	1    4000 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 1950 4000 2050
Wire Wire Line
	4000 2050 3900 2050
Wire Wire Line
	2450 1400 2400 1400
Wire Wire Line
	2500 1400 2450 1400
Connection ~ 2450 1400
Wire Wire Line
	2450 1350 2450 1400
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6188FEBF
P 2450 1350
AR Path="/6188FEBF" Ref="#FLG?"  Part="1" 
AR Path="/6187B23D/6188FEBF" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 2450 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 2450 1523 50  0001 C CNN
F 2 "" H 2450 1350 50  0001 C CNN
F 3 "~" H 2450 1350 50  0001 C CNN
	1    2450 1350
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6148CEFB
P 4350 1300
AR Path="/6148CEFB" Ref="#FLG?"  Part="1" 
AR Path="/6187B23D/6148CEFB" Ref="#FLG01"  Part="1" 
F 0 "#FLG01" H 4350 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 4350 1473 50  0001 C CNN
F 2 "" H 4350 1300 50  0001 C CNN
F 3 "~" H 4350 1300 50  0001 C CNN
	1    4350 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 1400 4000 1400
Wire Wire Line
	4000 1400 4000 1450
Connection ~ 3350 1400
Wire Wire Line
	4150 1700 4350 1700
Wire Wire Line
	3350 2200 4650 2200
Wire Wire Line
	4350 1400 4650 1400
Wire Wire Line
	4350 1200 4350 1300
Wire Wire Line
	4350 1400 4350 1700
Connection ~ 4350 1400
Connection ~ 4350 1300
Wire Wire Line
	4350 1300 4350 1400
Connection ~ 3350 2200
Text Notes 3750 1800 0    50   ~ 0
bus
Text Notes 3650 1650 0    50   ~ 0
external
Text GLabel 3600 3700 2    50   Input ~ 0
RESET
Wire Wire Line
	3200 3700 3600 3700
$Comp
L Device:LED D2
U 1 1 61832C6C
P 4650 1950
F 0 "D2" V 4689 1832 50  0000 R CNN
F 1 "Power" V 4598 1832 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 4650 1950 50  0001 C CNN
F 3 "~" H 4650 1950 50  0001 C CNN
	1    4650 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 2200 2800 2200
$EndSCHEMATC
