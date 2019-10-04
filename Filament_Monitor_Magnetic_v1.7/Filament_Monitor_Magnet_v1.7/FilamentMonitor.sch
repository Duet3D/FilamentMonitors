EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:smart
LIBS:FilamentMonitor-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Filament Monitor - Rotating Magnet"
Date "2019-03-31"
Rev "v1.7"
Comp "Duet3D"
Comment1 "see License.md for licensing information"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FilamentMonitor-rescue:ATTINY44A-MMH-PAD- U2
U 1 1 58A41D42
P 4175 1850
F 0 "U2" H 3850 2600 50  0000 C CNN
F 1 "ATtiny44A-MFR  /  ATtiny44A-MUR" H 4750 1050 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm" H 5125 1850 50  0001 C CIN
F 3 "" H 4175 1850 50  0000 C CNN
	1    4175 1850
	-1   0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:AS5601- U1
U 1 1 58A425D4
P 4150 6150
F 0 "U1" H 4150 6600 60  0000 C CNN
F 1 "AS5601" H 4150 5650 60  0000 C CNN
F 2 "complib:SOIC-8" H 4150 6150 60  0001 C CNN
F 3 ".." H 4150 6150 60  0001 C CNN
	1    4150 6150
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:Led_2x2- D1
U 1 1 58A42AC4
P 1975 3150
F 0 "D1" H 1975 3400 50  0000 C CNN
F 1 "Led_2x2" H 1975 2900 50  0000 C CNN
F 2 "complib:2x2_SMD_LED_1.6x1.25mm" H 1975 3150 50  0001 C CNN
F 3 " .. " H 1975 3150 50  0001 C CNN
	1    1975 3150
	0    -1   -1   0   
$EndComp
$Comp
L FilamentMonitor-rescue:R_Small- R3
U 1 1 58A42C1D
P 1875 2650
F 0 "R3" H 1905 2670 50  0000 L CNN
F 1 "470R" H 1650 2600 50  0000 L CNN
F 2 "complib:R_0603" H 1875 2650 50  0001 C CNN
F 3 "" H 1875 2650 50  0000 C CNN
	1    1875 2650
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:R_Small- R4
U 1 1 58A42E33
P 2075 2650
F 0 "R4" H 2105 2670 50  0000 L CNN
F 1 "470R" H 2125 2600 50  0000 L CNN
F 2 "complib:R_0603" H 2075 2650 50  0001 C CNN
F 3 "" H 2075 2650 50  0000 C CNN
	1    2075 2650
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:R_Small- R2
U 1 1 58A434ED
P 2575 2000
F 0 "R2" V 2675 1950 50  0000 L CNN
F 1 "330R" V 2475 1900 50  0000 L CNN
F 2 "complib:R_0603" H 2575 2000 50  0001 C CNN
F 3 "" H 2575 2000 50  0000 C CNN
	1    2575 2000
	0    1    1    0   
$EndComp
Text GLabel 2350 2000 0    60   Input ~ 0
OUT
Text GLabel 5625 1250 2    60   Input ~ 0
VCC
$Comp
L FilamentMonitor-rescue:GND- #PWR01
U 1 1 58A4392F
P 5625 2450
F 0 "#PWR01" H 5625 2200 50  0001 C CNN
F 1 "GND" H 5625 2300 50  0000 C CNN
F 2 "" H 5625 2450 50  0000 C CNN
F 3 "" H 5625 2450 50  0000 C CNN
	1    5625 2450
	1    0    0    -1  
$EndComp
Text GLabel 2350 1725 0    60   Input ~ 0
MISO
$Comp
L FilamentMonitor-rescue:C_Small- C1
U 1 1 58A4419B
P 3000 6250
F 0 "C1" H 3010 6320 50  0000 L CNN
F 1 "100n" H 3010 6170 50  0000 L CNN
F 2 "complib:C_0603" H 3000 6250 50  0001 C CNN
F 3 "" H 3000 6250 50  0000 C CNN
	1    3000 6250
	1    0    0    -1  
$EndComp
Text Notes 2050 6400 0    39   ~ 0
Leave out C1 or C3\nIf one can serve both chips
$Comp
L FilamentMonitor-rescue:C_Small- C2
U 1 1 58A444A6
P 3250 6250
F 0 "C2" H 3260 6320 50  0000 L CNN
F 1 "1u" H 3260 6170 50  0000 L CNN
F 2 "complib:C_0603" H 3250 6250 50  0001 C CNN
F 3 "" H 3250 6250 50  0000 C CNN
	1    3250 6250
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:GND- #PWR02
U 1 1 58A44792
P 3250 6650
F 0 "#PWR02" H 3250 6400 50  0001 C CNN
F 1 "GND" H 3250 6500 50  0000 C CNN
F 2 "" H 3250 6650 50  0000 C CNN
F 3 "" H 3250 6650 50  0000 C CNN
	1    3250 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 58A448F5
P 2250 5900
F 0 "JP1" H 2250 6050 50  0000 C CNN
F 1 "3.3V" H 2250 5820 50  0000 C CNN
F 2 "complib:SJ_Bridged" H 2250 5900 50  0001 C CNN
F 3 "" H 2250 5900 50  0000 C CNN
	1    2250 5900
	0    -1   -1   0   
$EndComp
Text GLabel 2450 5450 1    60   Input ~ 0
VCC
$Comp
L FilamentMonitor-rescue:R_Small- R5
U 1 1 58A45924
P 5150 5750
F 0 "R5" H 5180 5770 50  0000 L CNN
F 1 "4K7" H 4950 5700 50  0000 L CNN
F 2 "complib:R_0603" H 5150 5750 50  0001 C CNN
F 3 "" H 5150 5750 50  0000 C CNN
	1    5150 5750
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:R_Small- R6
U 1 1 58A459D3
P 5450 5750
F 0 "R6" H 5480 5770 50  0000 L CNN
F 1 "4K7" H 5250 5700 50  0000 L CNN
F 2 "complib:R_0603" H 5450 5750 50  0001 C CNN
F 3 "" H 5450 5750 50  0000 C CNN
	1    5450 5750
	1    0    0    -1  
$EndComp
Text GLabel 5600 6050 2    60   Input ~ 0
SCL
Text GLabel 5600 6250 2    60   Input ~ 0
SDA/MOSI
NoConn ~ 3600 6250
NoConn ~ 4700 5850
NoConn ~ 4700 6450
Text GLabel 2350 1600 0    60   Input ~ 0
SCL
Text GLabel 2350 1850 0    60   Input ~ 0
SDA/MOSI
$Comp
L FilamentMonitor-rescue:SW_PUSH- SW1
U 1 1 58A4716D
P 2675 3225
F 0 "SW1" H 2825 3335 50  0000 C CNN
F 1 "Push" H 2675 3145 50  0001 C CNN
F 2 "complib:SW_SIDE_1_lugs" H 2675 3225 50  0001 C CNN
F 3 "" H 2675 3225 50  0000 C CNN
	1    2675 3225
	0    1    1    0   
$EndComp
$Comp
L FilamentMonitor-rescue:R_Small- R1
U 1 1 58A4783B
P 1050 1175
F 0 "R1" H 1080 1195 50  0000 L CNN
F 1 "4K7" H 850 1125 50  0000 L CNN
F 2 "complib:R_0603" H 1050 1175 50  0001 C CNN
F 3 "" H 1050 1175 50  0000 C CNN
	1    1050 1175
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:L_Small- L1
U 1 1 58A481C2
P 7470 3050
F 0 "L1" V 7570 3000 50  0000 L CNN
F 1 "220R @100Mhz" V 7370 2895 50  0000 L CNN
F 2 "complib:R_0603" H 7470 3050 50  0001 C CNN
F 3 ".." H 7470 3050 50  0001 C CNN
	1    7470 3050
	0    -1   -1   0   
$EndComp
Text GLabel 7270 3050 0    60   Input ~ 0
VCC
Text GLabel 3000 2450 0    60   Input ~ 0
RST
Text GLabel 6545 2800 0    60   Input ~ 0
OUT
$Comp
L FilamentMonitor-rescue:GND- #PWR03
U 1 1 58A495E8
P 7220 3350
F 0 "#PWR03" H 7220 3100 50  0001 C CNN
F 1 "GND" H 7220 3200 50  0000 C CNN
F 2 "" H 7220 3350 50  0000 C CNN
F 3 "" H 7220 3350 50  0000 C CNN
	1    7220 3350
	1    0    0    -1  
$EndComp
$Comp
L FilamentMonitor-rescue:CONN_02X03- P2
U 1 1 58A49DF9
P 7680 4370
F 0 "P2" H 7680 4570 50  0000 C CNN
F 1 "Prog - DNP" H 7680 4170 50  0000 C CNN
F 2 "complib:Test_Point_2x3" H 7680 3170 50  0001 C CNN
F 3 "" H 7680 3170 50  0000 C CNN
	1    7680 4370
	1    0    0    -1  
$EndComp
Text GLabel 7230 4170 0    60   Input ~ 0
MISO
Text GLabel 7230 4370 0    60   Input ~ 0
SCL
Text GLabel 7230 4570 0    60   Input ~ 0
RST
Text GLabel 8030 4170 2    60   Input ~ 0
VCC
Text GLabel 8030 4370 2    60   Input ~ 0
SDA/MOSI
$Comp
L FilamentMonitor-rescue:GND- #PWR04
U 1 1 58A4A747
P 8030 4570
F 0 "#PWR04" H 8030 4320 50  0001 C CNN
F 1 "GND" H 8030 4420 50  0000 C CNN
F 2 "" H 8030 4570 50  0000 C CNN
F 3 "" H 8030 4570 50  0000 C CNN
	1    8030 4570
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole M2
U 1 1 58A4C339
P 1000 7450
F 0 "M2" H 1000 7300 60  0000 C CNN
F 1 "MH 2.5mm" H 1000 7600 60  0000 C CNN
F 2 "complib:Fixing_M2.5_clearance_5.5" H 1000 7450 60  0001 C CNN
F 3 "" H 1000 7450 60  0000 C CNN
	1    1000 7450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole M4
U 1 1 58A4C63C
P 1700 7450
F 0 "M4" H 1700 7300 60  0000 C CNN
F 1 "MH 2.5mm" H 1700 7600 60  0000 C CNN
F 2 "complib:Fixing_M2.5_clearance_5.5" H 1700 7450 60  0001 C CNN
F 3 "" H 1700 7450 60  0000 C CNN
	1    1700 7450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole M5
U 1 1 58A4C69C
P 2500 7450
F 0 "M5" H 2500 7300 60  0000 C CNN
F 1 "MH 2.5mm" H 2500 7600 60  0000 C CNN
F 2 "complib:Fixing_M2.5_clearance_5.5" H 2500 7450 60  0001 C CNN
F 3 "" H 2500 7450 60  0000 C CNN
	1    2500 7450
	1    0    0    -1  
$EndComp
Text Notes 7630 4720 0    39   ~ 0
DNP
$Comp
L FilamentMonitor-rescue:CONN_01X02- P3
U 1 1 58DC5532
P 1250 1600
F 0 "P3" H 1250 1750 50  0000 C CNN
F 1 "SW" V 1350 1600 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 1250 1600 50  0001 C CNN
F 3 "" H 1250 1600 50  0000 C CNN
	1    1250 1600
	1    0    0    1   
$EndComp
Text Notes 5475 1400 0    60   ~ 0
C1 is close enough to both chips
$Comp
L FilamentMonitor-rescue:CONN_01X03- P1
U 1 1 58DEDA56
P 8070 3050
F 0 "P1" H 8070 3250 50  0000 C CNN
F 1 "OUTPUT" V 8170 3050 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 8070 3050 50  0001 C CNN
F 3 "" H 8070 3050 50  0000 C CNN
	1    8070 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1875 2850 1875 2750
Wire Wire Line
	2075 2850 2075 2750
Wire Wire Line
	2075 2250 2075 2550
Wire Wire Line
	1875 2150 1875 2550
Wire Wire Line
	5225 1250 5625 1250
Wire Wire Line
	5225 2450 5375 2450
Wire Wire Line
	1475 3450 1475 3500
Wire Wire Line
	1050 3450 1475 3450
Wire Wire Line
	5375 2300 5375 2450
Connection ~ 5375 2450
Wire Wire Line
	2600 6050 3250 6050
Wire Wire Line
	3250 6050 3250 6150
Connection ~ 3250 6050
Wire Wire Line
	3000 6150 3000 5850
Wire Wire Line
	2600 5850 3000 5850
Connection ~ 3000 5850
Wire Wire Line
	3000 6350 3000 6500
Wire Wire Line
	3000 6500 3250 6500
Wire Wire Line
	3250 6350 3250 6500
Wire Wire Line
	3600 6500 3600 6450
Connection ~ 3250 6500
Wire Wire Line
	2600 5600 2600 5850
Wire Wire Line
	2250 5600 2450 5600
Wire Wire Line
	2250 6200 2600 6200
Wire Wire Line
	2600 6200 2600 6050
Wire Wire Line
	2450 5450 2450 5500
Connection ~ 2450 5600
Wire Wire Line
	2450 5500 5150 5500
Wire Wire Line
	5150 5500 5150 5650
Connection ~ 2450 5500
Wire Wire Line
	5450 5500 5450 5650
Connection ~ 5150 5500
Wire Wire Line
	4700 6050 5150 6050
Wire Wire Line
	5150 5850 5150 6050
Connection ~ 5150 6050
Wire Wire Line
	4700 6250 5450 6250
Wire Wire Line
	5450 5850 5450 6250
Connection ~ 5450 6250
Wire Wire Line
	1200 825  1050 825 
Wire Wire Line
	1050 825  1050 1075
Wire Wire Line
	7270 3050 7370 3050
Wire Wire Line
	7870 3050 7570 3050
Wire Wire Line
	7870 2950 7570 2950
Wire Wire Line
	7570 2950 7570 2800
Wire Wire Line
	7570 2800 6725 2800
Wire Wire Line
	7220 3350 7220 3300
Wire Wire Line
	7720 3300 7720 3150
Wire Wire Line
	7720 3150 7870 3150
Wire Wire Line
	7230 4170 7380 4170
Wire Wire Line
	7380 4170 7380 4270
Wire Wire Line
	7380 4270 7430 4270
Wire Wire Line
	7230 4370 7430 4370
Wire Wire Line
	7230 4570 7380 4570
Wire Wire Line
	7380 4570 7380 4470
Wire Wire Line
	7380 4470 7430 4470
Wire Wire Line
	7930 4270 7980 4270
Wire Wire Line
	7980 4270 7980 4170
Wire Wire Line
	7980 4170 8030 4170
Wire Wire Line
	8030 4370 7930 4370
Wire Wire Line
	7930 4470 8030 4470
Wire Wire Line
	8030 4470 8030 4570
Text GLabel 1200 825  2    60   Input ~ 0
VCC
$Comp
L FilamentMonitor-rescue:GND- #PWR05
U 1 1 5915F46B
P 1475 3500
F 0 "#PWR05" H 1475 3250 50  0001 C CNN
F 1 "GND" H 1475 3350 50  0000 C CNN
F 2 "" H 1475 3500 50  0000 C CNN
F 3 "" H 1475 3500 50  0000 C CNN
	1    1475 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5375 2300 5225 2300
Wire Wire Line
	3125 1850 2350 1850
Wire Wire Line
	3125 1750 2400 1750
Wire Wire Line
	2400 1750 2400 1725
Wire Wire Line
	2400 1725 2350 1725
Wire Wire Line
	2350 1600 2425 1600
Wire Wire Line
	2425 1600 2425 1650
Wire Wire Line
	2425 1650 3125 1650
NoConn ~ 3125 1550
Wire Wire Line
	1050 1650 1050 3450
Wire Wire Line
	1050 1275 1050 1350
Wire Wire Line
	3125 1450 1975 1450
Wire Wire Line
	1975 1450 1975 1350
Wire Wire Line
	1975 1350 1050 1350
Connection ~ 1050 1350
Wire Wire Line
	2675 2000 2725 2000
Wire Wire Line
	2725 2000 2725 1950
Wire Wire Line
	2725 1950 3125 1950
Wire Wire Line
	2475 2000 2350 2000
Wire Wire Line
	2075 2250 3125 2250
Wire Wire Line
	1875 2150 3125 2150
Wire Wire Line
	3125 2450 3000 2450
$Comp
L FilamentMonitor-rescue:GND- #PWR06
U 1 1 5AC9DE83
P 2675 3575
F 0 "#PWR06" H 2675 3325 50  0001 C CNN
F 1 "GND" H 2675 3425 50  0000 C CNN
F 2 "" H 2675 3575 50  0000 C CNN
F 3 "" H 2675 3575 50  0000 C CNN
	1    2675 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 3575 2675 3525
Wire Wire Line
	3125 2350 2675 2350
Wire Wire Line
	2675 2350 2675 2925
$Comp
L FilamentMonitor-rescue:GS2- P4
U 1 1 5AC9E521
P 4675 3425
F 0 "P4" H 4775 3575 50  0000 C CNN
F 1 "M2" H 4775 3276 50  0000 C CNN
F 2 "complib:SJ" V 4749 3425 50  0001 C CNN
F 3 "" H 4675 3425 50  0001 C CNN
	1    4675 3425
	1    0    0    -1  
$EndComp
Text GLabel 2950 1225 0    60   Input ~ 0
PA0
Text GLabel 2950 1350 0    60   Input ~ 0
PA1
Wire Wire Line
	2950 1225 3000 1225
Wire Wire Line
	3000 1225 3000 1250
Wire Wire Line
	3000 1250 3125 1250
Wire Wire Line
	2950 1350 3125 1350
Text GLabel 4475 3625 0    60   Input ~ 0
PA0
Text GLabel 4475 3225 0    60   Input ~ 0
PA1
Wire Wire Line
	4675 3225 4475 3225
Wire Wire Line
	4675 3625 4475 3625
Wire Wire Line
	5375 2450 5625 2450
Wire Wire Line
	3250 6050 3600 6050
Wire Wire Line
	3000 5850 3600 5850
Wire Wire Line
	3250 6500 3600 6500
Wire Wire Line
	3250 6500 3250 6650
Wire Wire Line
	2450 5600 2600 5600
Wire Wire Line
	2450 5500 2450 5600
Wire Wire Line
	5150 5500 5450 5500
Wire Wire Line
	5150 6050 5600 6050
Wire Wire Line
	5450 6250 5600 6250
Wire Wire Line
	1050 1350 1050 1550
Wire Wire Line
	2250 6200 2250 6000
Wire Wire Line
	2250 5800 2250 5600
$Comp
L FilamentMonitor-rescue:R_Small- R7
U 1 1 5BCCC35E
P 6725 3000
F 0 "R7" V 6825 2950 50  0000 L CNN
F 1 "100K" V 6625 2900 50  0000 L CNN
F 2 "complib:R_0603" H 6725 3000 50  0001 C CNN
F 3 "" H 6725 3000 50  0000 C CNN
	1    6725 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6725 2900 6725 2800
Connection ~ 6725 2800
Wire Wire Line
	6725 2800 6545 2800
Wire Wire Line
	6725 3300 6725 3100
Wire Wire Line
	6725 3300 7220 3300
Connection ~ 7220 3300
Wire Wire Line
	7220 3300 7720 3300
Wire Wire Line
	2075 3450 1875 3450
Wire Wire Line
	1875 3450 1475 3450
Connection ~ 1875 3450
Connection ~ 1475 3450
$EndSCHEMATC
