EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ArcadeController-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-P IC1
U 1 1 5605B382
P 3150 2500
F 0 "IC1" H 2400 3750 40  0000 L BNN
F 1 "ATMEGA328-P" H 3550 1100 40  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm_LongPads" H 3150 2500 30  0001 C CIN
F 3 "" H 3150 2500 60  0000 C CNN
	1    3150 2500
	1    0    0    -1  
$EndComp
$Comp
L USB_A P3
U 1 1 5605B3DE
P 6850 2150
F 0 "P3" H 7050 1950 50  0000 C CNN
F 1 "USB_A" H 6800 2350 50  0000 C CNN
F 2 "Connect:USB_B" V 6800 2050 60  0001 C CNN
F 3 "" V 6800 2050 60  0000 C CNN
	1    6850 2150
	1    0    0    -1  
$EndComp
$Comp
L ZENER D1
U 1 1 5605B443
P 7350 2650
F 0 "D1" H 7350 2750 50  0000 C CNN
F 1 "3.6 ZENER" H 7350 2550 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-35_SOD27_Horizontal_RM10" H 7350 2650 60  0001 C CNN
F 3 "" H 7350 2650 60  0000 C CNN
	1    7350 2650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D2
U 1 1 5605B482
P 7350 3000
F 0 "D2" H 7350 3100 50  0000 C CNN
F 1 "3.6 ZENER" H 7350 2900 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-35_SOD27_Horizontal_RM10" H 7350 3000 60  0001 C CNN
F 3 "" H 7350 3000 60  0000 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5605B4AC
P 6750 3250
F 0 "R1" V 6830 3250 50  0000 C CNN
F 1 "68" V 6750 3250 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6680 3250 30  0001 C CNN
F 3 "" H 6750 3250 30  0000 C CNN
	1    6750 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5605B58A
P 7550 3200
F 0 "#PWR01" H 7550 2950 50  0001 C CNN
F 1 "GND" H 7550 3050 50  0000 C CNN
F 2 "" H 7550 3200 60  0000 C CNN
F 3 "" H 7550 3200 60  0000 C CNN
	1    7550 3200
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5605B60D
P 6950 3250
F 0 "R2" V 7030 3250 50  0000 C CNN
F 1 "68" V 6950 3250 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6880 3250 30  0001 C CNN
F 3 "" H 6950 3250 30  0000 C CNN
	1    6950 3250
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5605B637
P 6650 2850
F 0 "R3" V 6730 2850 50  0000 C CNN
F 1 "1.5K" V 6650 2850 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6580 2850 30  0001 C CNN
F 3 "" H 6650 2850 30  0000 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5605B787
P 2000 3800
F 0 "#PWR02" H 2000 3550 50  0001 C CNN
F 1 "GND" H 2000 3650 50  0000 C CNN
F 2 "" H 2000 3800 60  0000 C CNN
F 3 "" H 2000 3800 60  0000 C CNN
	1    2000 3800
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 5605B7EE
P 5800 2400
F 0 "Y1" H 5800 2550 50  0000 C CNN
F 1 "16MHz Crystal" H 5800 2250 50  0000 C CNN
F 2 "Crystals:HC-49V" H 5800 2400 60  0001 C CNN
F 3 "" H 5800 2400 60  0000 C CNN
	1    5800 2400
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5605B81C
P 5550 2750
F 0 "C1" H 5575 2850 50  0000 L CNN
F 1 "22pf" H 5575 2650 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 5588 2600 30  0001 C CNN
F 3 "" H 5550 2750 60  0000 C CNN
	1    5550 2750
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5605B853
P 6050 2750
F 0 "C2" H 6075 2850 50  0000 L CNN
F 1 "22pf" H 6075 2650 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 6088 2600 30  0001 C CNN
F 3 "" H 6050 2750 60  0000 C CNN
	1    6050 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5605B927
P 5550 3000
F 0 "#PWR03" H 5550 2750 50  0001 C CNN
F 1 "GND" H 5550 2850 50  0000 C CNN
F 2 "" H 5550 3000 60  0000 C CNN
F 3 "" H 5550 3000 60  0000 C CNN
	1    5550 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5605B94F
P 6050 3000
F 0 "#PWR04" H 6050 2750 50  0001 C CNN
F 1 "GND" H 6050 2850 50  0000 C CNN
F 2 "" H 6050 3000 60  0000 C CNN
F 3 "" H 6050 3000 60  0000 C CNN
	1    6050 3000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 5605BA39
P 6450 2700
F 0 "#PWR05" H 6450 2550 50  0001 C CNN
F 1 "+5V" H 6450 2840 50  0000 C CNN
F 2 "" H 6450 2700 60  0000 C CNN
F 3 "" H 6450 2700 60  0000 C CNN
	1    6450 2700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 5605BBDB
P 2000 1200
F 0 "#PWR06" H 2000 1050 50  0001 C CNN
F 1 "+5V" H 2000 1340 50  0000 C CNN
F 2 "" H 2000 1200 60  0000 C CNN
F 3 "" H 2000 1200 60  0000 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X06 P1
U 1 1 5605BCFA
P 4550 1650
F 0 "P1" H 4550 2000 50  0000 C CNN
F 1 "CONN_02X06" H 4550 1300 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x06" H 4550 450 60  0001 C CNN
F 3 "" H 4550 450 60  0000 C CNN
	1    4550 1650
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X06 P2
U 1 1 5605BD36
P 4550 2500
F 0 "P2" H 4550 2850 50  0000 C CNN
F 1 "CONN_02X06" H 4550 2150 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x06" H 4550 1300 60  0001 C CNN
F 3 "" H 4550 1300 60  0000 C CNN
	1    4550 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2450 7550 2450
Wire Wire Line
	7550 2450 7550 3200
Connection ~ 7550 2650
Connection ~ 7550 3000
Wire Wire Line
	6850 2450 6850 2900
Wire Wire Line
	6850 2650 7150 2650
Wire Wire Line
	6750 2450 6750 3100
Wire Wire Line
	6650 3000 7150 3000
Connection ~ 6750 3000
Wire Wire Line
	6850 2900 6950 2900
Wire Wire Line
	6950 2900 6950 3100
Connection ~ 6850 2650
Wire Wire Line
	2000 1200 2000 2000
Wire Wire Line
	2250 1400 2000 1400
Connection ~ 2000 1400
Wire Wire Line
	2000 2000 2250 2000
Connection ~ 2000 1700
Wire Wire Line
	2250 3600 2000 3600
Wire Wire Line
	2000 3600 2000 3800
Wire Wire Line
	2000 3700 2250 3700
Connection ~ 2000 3700
Wire Wire Line
	5550 2100 5550 2600
Wire Wire Line
	5550 2400 5650 2400
Wire Wire Line
	5950 2400 6050 2400
Wire Wire Line
	6050 2000 6050 2600
Wire Wire Line
	5550 2900 5550 3000
Wire Wire Line
	6050 2900 6050 3000
Connection ~ 6050 2400
Connection ~ 5550 2400
Wire Wire Line
	6650 2700 6450 2700
Wire Wire Line
	4150 1900 4300 1900
Wire Wire Line
	4300 1800 4150 1800
Wire Wire Line
	4150 1700 4300 1700
Wire Wire Line
	4300 1600 4150 1600
Wire Wire Line
	4150 1500 4300 1500
Wire Wire Line
	4300 1400 4150 1400
Wire Wire Line
	4300 2250 4150 2250
Wire Wire Line
	4150 2350 4300 2350
Wire Wire Line
	4150 2450 4300 2450
Wire Wire Line
	4150 2550 4300 2550
Wire Wire Line
	4150 2650 4300 2650
Wire Wire Line
	4150 2750 4300 2750
$Comp
L GND #PWR07
U 1 1 5605CAF3
P 4800 3000
F 0 "#PWR07" H 4800 2750 50  0001 C CNN
F 1 "GND" H 4800 2850 50  0000 C CNN
F 2 "" H 4800 3000 60  0000 C CNN
F 3 "" H 4800 3000 60  0000 C CNN
	1    4800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1400 4800 3000
Connection ~ 4800 1500
Connection ~ 4800 1600
Connection ~ 4800 1700
Connection ~ 4800 1800
Connection ~ 4800 1900
Connection ~ 4800 2250
Connection ~ 4800 2350
Connection ~ 4800 2450
Connection ~ 4800 2550
Connection ~ 4800 2650
Connection ~ 4800 2750
Wire Wire Line
	4150 2100 5550 2100
Wire Wire Line
	4150 2000 6050 2000
Wire Wire Line
	6750 3400 6750 3700
Wire Wire Line
	6750 3700 4150 3700
Wire Wire Line
	6950 3400 4300 3400
Wire Wire Line
	4300 3400 4300 3200
Wire Wire Line
	4300 3200 4150 3200
$Comp
L R R4
U 1 1 5605D590
P 4450 3100
F 0 "R4" V 4530 3100 50  0000 C CNN
F 1 "10K" V 4450 3100 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4380 3100 30  0001 C CNN
F 3 "" H 4450 3100 30  0000 C CNN
	1    4450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2850 4250 2850
Wire Wire Line
	4250 2850 4250 2950
Wire Wire Line
	4250 2950 4450 2950
Wire Wire Line
	4450 3250 6450 3250
Wire Wire Line
	6450 3250 6450 2700
NoConn ~ 4150 3000
NoConn ~ 4150 3100
NoConn ~ 4150 3300
NoConn ~ 4150 3400
NoConn ~ 4150 3500
NoConn ~ 4150 3600
NoConn ~ 7150 2050
Wire Wire Line
	6650 2700 6650 2450
Wire Wire Line
	2000 1700 2250 1700
$EndSCHEMATC
