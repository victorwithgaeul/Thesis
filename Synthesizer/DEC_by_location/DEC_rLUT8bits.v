// Product (AN) Code DEC r-LUT
// DEC_rLUT8bits.v
// Used to do DEC, but corrected errors by locations, not AWE
// Received remainder r, output two error locations.
module DEC_rLUT8bits(r, l_1, l_2);
input 	[10:0]	r;
output	reg	signed	[5:0]	l_1;
output	reg	signed	[5:0]	l_2;
always@(*) begin
	case(r)
		1: begin l_1 = -1;
				 l_2 = +2; end
		1938: begin l_1 = +1;
				 l_2 = -2; end
		2: begin l_1 = +1;
				 l_2 = +1; end
		1937: begin l_1 = -1;
				 l_2 = -1; end
		4: begin l_1 = +2;
				 l_2 = +2; end
		1935: begin l_1 = -2;
				 l_2 = -2; end
		8: begin l_1 = +3;
				 l_2 = +3; end
		1931: begin l_1 = -3;
				 l_2 = -3; end
		16: begin l_1 = +4;
				 l_2 = +4; end
		1923: begin l_1 = -4;
				 l_2 = -4; end
		32: begin l_1 = +5;
				 l_2 = +5; end
		1907: begin l_1 = -5;
				 l_2 = -5; end
		64: begin l_1 = +6;
				 l_2 = +6; end
		1875: begin l_1 = -6;
				 l_2 = -6; end
		128: begin l_1 = +7;
				 l_2 = +7; end
		1811: begin l_1 = -7;
				 l_2 = -7; end
		256: begin l_1 = +8;
				 l_2 = +8; end
		1683: begin l_1 = -8;
				 l_2 = -8; end
		512: begin l_1 = +9;
				 l_2 = +9; end
		1427: begin l_1 = -9;
				 l_2 = -9; end
		1024: begin l_1 = +10;
				 l_2 = +10; end
		915: begin l_1 = -10;
				 l_2 = -10; end
		109: begin l_1 = +11;
				 l_2 = +11; end
		1830: begin l_1 = -11;
				 l_2 = -11; end
		218: begin l_1 = +12;
				 l_2 = +12; end
		1721: begin l_1 = -12;
				 l_2 = -12; end
		436: begin l_1 = +13;
				 l_2 = +13; end
		1503: begin l_1 = -13;
				 l_2 = -13; end
		872: begin l_1 = +14;
				 l_2 = +14; end
		1067: begin l_1 = -14;
				 l_2 = -14; end
		1744: begin l_1 = +15;
				 l_2 = +15; end
		195: begin l_1 = -15;
				 l_2 = -15; end
		1549: begin l_1 = +16;
				 l_2 = +16; end
		390: begin l_1 = -16;
				 l_2 = -16; end
		1159: begin l_1 = +17;
				 l_2 = +17; end
		780: begin l_1 = -17;
				 l_2 = -17; end
		379: begin l_1 = +18;
				 l_2 = +18; end
		1560: begin l_1 = -18;
				 l_2 = -18; end
		3: begin l_1 = -1;
				 l_2 = +3; end
		1936: begin l_1 = -1;
				 l_2 = -2; end
		5: begin l_1 = +1;
				 l_2 = +3; end
		1934: begin l_1 = -1;
				 l_2 = -3; end
		9: begin l_1 = +1;
				 l_2 = +4; end
		1932: begin l_1 = +1;
				 l_2 = -4; end
		7: begin l_1 = -1;
				 l_2 = +4; end
		1930: begin l_1 = -1;
				 l_2 = -4; end
		17: begin l_1 = +1;
				 l_2 = +5; end
		1924: begin l_1 = +1;
				 l_2 = -5; end
		15: begin l_1 = -1;
				 l_2 = +5; end
		1922: begin l_1 = -1;
				 l_2 = -5; end
		33: begin l_1 = +1;
				 l_2 = +6; end
		1908: begin l_1 = +1;
				 l_2 = -6; end
		31: begin l_1 = -1;
				 l_2 = +6; end
		1906: begin l_1 = -1;
				 l_2 = -6; end
		65: begin l_1 = +1;
				 l_2 = +7; end
		1876: begin l_1 = +1;
				 l_2 = -7; end
		63: begin l_1 = -1;
				 l_2 = +7; end
		1874: begin l_1 = -1;
				 l_2 = -7; end
		129: begin l_1 = +1;
				 l_2 = +8; end
		1812: begin l_1 = +1;
				 l_2 = -8; end
		127: begin l_1 = -1;
				 l_2 = +8; end
		1810: begin l_1 = -1;
				 l_2 = -8; end
		257: begin l_1 = +1;
				 l_2 = +9; end
		1684: begin l_1 = +1;
				 l_2 = -9; end
		255: begin l_1 = -1;
				 l_2 = +9; end
		1682: begin l_1 = -1;
				 l_2 = -9; end
		513: begin l_1 = +1;
				 l_2 = +10; end
		1428: begin l_1 = +1;
				 l_2 = -10; end
		511: begin l_1 = -1;
				 l_2 = +10; end
		1426: begin l_1 = -1;
				 l_2 = -10; end
		1025: begin l_1 = +1;
				 l_2 = +11; end
		916: begin l_1 = +1;
				 l_2 = -11; end
		1023: begin l_1 = -1;
				 l_2 = +11; end
		914: begin l_1 = -1;
				 l_2 = -11; end
		110: begin l_1 = +1;
				 l_2 = +12; end
		1831: begin l_1 = +1;
				 l_2 = -12; end
		108: begin l_1 = -1;
				 l_2 = +12; end
		1829: begin l_1 = -1;
				 l_2 = -12; end
		219: begin l_1 = +1;
				 l_2 = +13; end
		1722: begin l_1 = +1;
				 l_2 = -13; end
		217: begin l_1 = -1;
				 l_2 = +13; end
		1720: begin l_1 = -1;
				 l_2 = -13; end
		437: begin l_1 = +1;
				 l_2 = +14; end
		1504: begin l_1 = +1;
				 l_2 = -14; end
		435: begin l_1 = -1;
				 l_2 = +14; end
		1502: begin l_1 = -1;
				 l_2 = -14; end
		873: begin l_1 = +1;
				 l_2 = +15; end
		1068: begin l_1 = +1;
				 l_2 = -15; end
		871: begin l_1 = -1;
				 l_2 = +15; end
		1066: begin l_1 = -1;
				 l_2 = -15; end
		1745: begin l_1 = +1;
				 l_2 = +16; end
		196: begin l_1 = +1;
				 l_2 = -16; end
		1743: begin l_1 = -1;
				 l_2 = +16; end
		194: begin l_1 = -1;
				 l_2 = -16; end
		1550: begin l_1 = +1;
				 l_2 = +17; end
		391: begin l_1 = +1;
				 l_2 = -17; end
		1548: begin l_1 = -1;
				 l_2 = +17; end
		389: begin l_1 = -1;
				 l_2 = -17; end
		1160: begin l_1 = +1;
				 l_2 = +18; end
		781: begin l_1 = +1;
				 l_2 = -18; end
		1158: begin l_1 = -1;
				 l_2 = +18; end
		779: begin l_1 = -1;
				 l_2 = -18; end
		380: begin l_1 = +1;
				 l_2 = +19; end
		1561: begin l_1 = +1;
				 l_2 = -19; end
		378: begin l_1 = -1;
				 l_2 = +19; end
		1559: begin l_1 = -1;
				 l_2 = -19; end
		6: begin l_1 = -2;
				 l_2 = +4; end
		1933: begin l_1 = -2;
				 l_2 = -3; end
		10: begin l_1 = +2;
				 l_2 = +4; end
		1929: begin l_1 = -2;
				 l_2 = -4; end
		18: begin l_1 = +2;
				 l_2 = +5; end
		1925: begin l_1 = +2;
				 l_2 = -5; end
		14: begin l_1 = -2;
				 l_2 = +5; end
		1921: begin l_1 = -2;
				 l_2 = -5; end
		34: begin l_1 = +2;
				 l_2 = +6; end
		1909: begin l_1 = +2;
				 l_2 = -6; end
		30: begin l_1 = -2;
				 l_2 = +6; end
		1905: begin l_1 = -2;
				 l_2 = -6; end
		66: begin l_1 = +2;
				 l_2 = +7; end
		1877: begin l_1 = +2;
				 l_2 = -7; end
		62: begin l_1 = -2;
				 l_2 = +7; end
		1873: begin l_1 = -2;
				 l_2 = -7; end
		130: begin l_1 = +2;
				 l_2 = +8; end
		1813: begin l_1 = +2;
				 l_2 = -8; end
		126: begin l_1 = -2;
				 l_2 = +8; end
		1809: begin l_1 = -2;
				 l_2 = -8; end
		258: begin l_1 = +2;
				 l_2 = +9; end
		1685: begin l_1 = +2;
				 l_2 = -9; end
		254: begin l_1 = -2;
				 l_2 = +9; end
		1681: begin l_1 = -2;
				 l_2 = -9; end
		514: begin l_1 = +2;
				 l_2 = +10; end
		1429: begin l_1 = +2;
				 l_2 = -10; end
		510: begin l_1 = -2;
				 l_2 = +10; end
		1425: begin l_1 = -2;
				 l_2 = -10; end
		1026: begin l_1 = +2;
				 l_2 = +11; end
		917: begin l_1 = +2;
				 l_2 = -11; end
		1022: begin l_1 = -2;
				 l_2 = +11; end
		913: begin l_1 = -2;
				 l_2 = -11; end
		111: begin l_1 = +2;
				 l_2 = +12; end
		1832: begin l_1 = +2;
				 l_2 = -12; end
		107: begin l_1 = -2;
				 l_2 = +12; end
		1828: begin l_1 = -2;
				 l_2 = -12; end
		220: begin l_1 = +2;
				 l_2 = +13; end
		1723: begin l_1 = +2;
				 l_2 = -13; end
		216: begin l_1 = -2;
				 l_2 = +13; end
		1719: begin l_1 = -2;
				 l_2 = -13; end
		438: begin l_1 = +2;
				 l_2 = +14; end
		1505: begin l_1 = +2;
				 l_2 = -14; end
		434: begin l_1 = -2;
				 l_2 = +14; end
		1501: begin l_1 = -2;
				 l_2 = -14; end
		874: begin l_1 = +2;
				 l_2 = +15; end
		1069: begin l_1 = +2;
				 l_2 = -15; end
		870: begin l_1 = -2;
				 l_2 = +15; end
		1065: begin l_1 = -2;
				 l_2 = -15; end
		1746: begin l_1 = +2;
				 l_2 = +16; end
		197: begin l_1 = +2;
				 l_2 = -16; end
		1742: begin l_1 = -2;
				 l_2 = +16; end
		193: begin l_1 = -2;
				 l_2 = -16; end
		1551: begin l_1 = +2;
				 l_2 = +17; end
		392: begin l_1 = +2;
				 l_2 = -17; end
		1547: begin l_1 = -2;
				 l_2 = +17; end
		388: begin l_1 = -2;
				 l_2 = -17; end
		1161: begin l_1 = +2;
				 l_2 = +18; end
		782: begin l_1 = +2;
				 l_2 = -18; end
		1157: begin l_1 = -2;
				 l_2 = +18; end
		778: begin l_1 = -2;
				 l_2 = -18; end
		381: begin l_1 = +2;
				 l_2 = +19; end
		1562: begin l_1 = +2;
				 l_2 = -19; end
		377: begin l_1 = -2;
				 l_2 = +19; end
		1558: begin l_1 = -2;
				 l_2 = -19; end
		12: begin l_1 = -3;
				 l_2 = +5; end
		1927: begin l_1 = -3;
				 l_2 = -4; end
		20: begin l_1 = +3;
				 l_2 = +5; end
		1919: begin l_1 = -3;
				 l_2 = -5; end
		36: begin l_1 = +3;
				 l_2 = +6; end
		1911: begin l_1 = +3;
				 l_2 = -6; end
		28: begin l_1 = -3;
				 l_2 = +6; end
		1903: begin l_1 = -3;
				 l_2 = -6; end
		68: begin l_1 = +3;
				 l_2 = +7; end
		1879: begin l_1 = +3;
				 l_2 = -7; end
		60: begin l_1 = -3;
				 l_2 = +7; end
		1871: begin l_1 = -3;
				 l_2 = -7; end
		132: begin l_1 = +3;
				 l_2 = +8; end
		1815: begin l_1 = +3;
				 l_2 = -8; end
		124: begin l_1 = -3;
				 l_2 = +8; end
		1807: begin l_1 = -3;
				 l_2 = -8; end
		260: begin l_1 = +3;
				 l_2 = +9; end
		1687: begin l_1 = +3;
				 l_2 = -9; end
		252: begin l_1 = -3;
				 l_2 = +9; end
		1679: begin l_1 = -3;
				 l_2 = -9; end
		516: begin l_1 = +3;
				 l_2 = +10; end
		1431: begin l_1 = +3;
				 l_2 = -10; end
		508: begin l_1 = -3;
				 l_2 = +10; end
		1423: begin l_1 = -3;
				 l_2 = -10; end
		1028: begin l_1 = +3;
				 l_2 = +11; end
		919: begin l_1 = +3;
				 l_2 = -11; end
		1020: begin l_1 = -3;
				 l_2 = +11; end
		911: begin l_1 = -3;
				 l_2 = -11; end
		113: begin l_1 = +3;
				 l_2 = +12; end
		1834: begin l_1 = +3;
				 l_2 = -12; end
		105: begin l_1 = -3;
				 l_2 = +12; end
		1826: begin l_1 = -3;
				 l_2 = -12; end
		222: begin l_1 = +3;
				 l_2 = +13; end
		1725: begin l_1 = +3;
				 l_2 = -13; end
		214: begin l_1 = -3;
				 l_2 = +13; end
		1717: begin l_1 = -3;
				 l_2 = -13; end
		440: begin l_1 = +3;
				 l_2 = +14; end
		1507: begin l_1 = +3;
				 l_2 = -14; end
		432: begin l_1 = -3;
				 l_2 = +14; end
		1499: begin l_1 = -3;
				 l_2 = -14; end
		876: begin l_1 = +3;
				 l_2 = +15; end
		1071: begin l_1 = +3;
				 l_2 = -15; end
		868: begin l_1 = -3;
				 l_2 = +15; end
		1063: begin l_1 = -3;
				 l_2 = -15; end
		1748: begin l_1 = +3;
				 l_2 = +16; end
		199: begin l_1 = +3;
				 l_2 = -16; end
		1740: begin l_1 = -3;
				 l_2 = +16; end
		191: begin l_1 = -3;
				 l_2 = -16; end
		1553: begin l_1 = +3;
				 l_2 = +17; end
		394: begin l_1 = +3;
				 l_2 = -17; end
		1545: begin l_1 = -3;
				 l_2 = +17; end
		386: begin l_1 = -3;
				 l_2 = -17; end
		1163: begin l_1 = +3;
				 l_2 = +18; end
		784: begin l_1 = +3;
				 l_2 = -18; end
		1155: begin l_1 = -3;
				 l_2 = +18; end
		776: begin l_1 = -3;
				 l_2 = -18; end
		383: begin l_1 = +3;
				 l_2 = +19; end
		1564: begin l_1 = +3;
				 l_2 = -19; end
		375: begin l_1 = -3;
				 l_2 = +19; end
		1556: begin l_1 = -3;
				 l_2 = -19; end
		24: begin l_1 = -4;
				 l_2 = +6; end
		1915: begin l_1 = -4;
				 l_2 = -5; end
		40: begin l_1 = +4;
				 l_2 = +6; end
		1899: begin l_1 = -4;
				 l_2 = -6; end
		72: begin l_1 = +4;
				 l_2 = +7; end
		1883: begin l_1 = +4;
				 l_2 = -7; end
		56: begin l_1 = -4;
				 l_2 = +7; end
		1867: begin l_1 = -4;
				 l_2 = -7; end
		136: begin l_1 = +4;
				 l_2 = +8; end
		1819: begin l_1 = +4;
				 l_2 = -8; end
		120: begin l_1 = -4;
				 l_2 = +8; end
		1803: begin l_1 = -4;
				 l_2 = -8; end
		264: begin l_1 = +4;
				 l_2 = +9; end
		1691: begin l_1 = +4;
				 l_2 = -9; end
		248: begin l_1 = -4;
				 l_2 = +9; end
		1675: begin l_1 = -4;
				 l_2 = -9; end
		520: begin l_1 = +4;
				 l_2 = +10; end
		1435: begin l_1 = +4;
				 l_2 = -10; end
		504: begin l_1 = -4;
				 l_2 = +10; end
		1419: begin l_1 = -4;
				 l_2 = -10; end
		1032: begin l_1 = +4;
				 l_2 = +11; end
		923: begin l_1 = +4;
				 l_2 = -11; end
		1016: begin l_1 = -4;
				 l_2 = +11; end
		907: begin l_1 = -4;
				 l_2 = -11; end
		117: begin l_1 = +4;
				 l_2 = +12; end
		1838: begin l_1 = +4;
				 l_2 = -12; end
		101: begin l_1 = -4;
				 l_2 = +12; end
		1822: begin l_1 = -4;
				 l_2 = -12; end
		226: begin l_1 = +4;
				 l_2 = +13; end
		1729: begin l_1 = +4;
				 l_2 = -13; end
		210: begin l_1 = -4;
				 l_2 = +13; end
		1713: begin l_1 = -4;
				 l_2 = -13; end
		444: begin l_1 = +4;
				 l_2 = +14; end
		1511: begin l_1 = +4;
				 l_2 = -14; end
		428: begin l_1 = -4;
				 l_2 = +14; end
		1495: begin l_1 = -4;
				 l_2 = -14; end
		880: begin l_1 = +4;
				 l_2 = +15; end
		1075: begin l_1 = +4;
				 l_2 = -15; end
		864: begin l_1 = -4;
				 l_2 = +15; end
		1059: begin l_1 = -4;
				 l_2 = -15; end
		1752: begin l_1 = +4;
				 l_2 = +16; end
		203: begin l_1 = +4;
				 l_2 = -16; end
		1736: begin l_1 = -4;
				 l_2 = +16; end
		187: begin l_1 = -4;
				 l_2 = -16; end
		1557: begin l_1 = +4;
				 l_2 = +17; end
		398: begin l_1 = +4;
				 l_2 = -17; end
		1541: begin l_1 = -4;
				 l_2 = +17; end
		382: begin l_1 = -4;
				 l_2 = -17; end
		1167: begin l_1 = +4;
				 l_2 = +18; end
		788: begin l_1 = +4;
				 l_2 = -18; end
		1151: begin l_1 = -4;
				 l_2 = +18; end
		772: begin l_1 = -4;
				 l_2 = -18; end
		387: begin l_1 = +4;
				 l_2 = +19; end
		1568: begin l_1 = +4;
				 l_2 = -19; end
		371: begin l_1 = -4;
				 l_2 = +19; end
		1552: begin l_1 = -4;
				 l_2 = -19; end
		48: begin l_1 = -5;
				 l_2 = +7; end
		1891: begin l_1 = -5;
				 l_2 = -6; end
		80: begin l_1 = +5;
				 l_2 = +7; end
		1859: begin l_1 = -5;
				 l_2 = -7; end
		144: begin l_1 = +5;
				 l_2 = +8; end
		1827: begin l_1 = +5;
				 l_2 = -8; end
		112: begin l_1 = -5;
				 l_2 = +8; end
		1795: begin l_1 = -5;
				 l_2 = -8; end
		272: begin l_1 = +5;
				 l_2 = +9; end
		1699: begin l_1 = +5;
				 l_2 = -9; end
		240: begin l_1 = -5;
				 l_2 = +9; end
		1667: begin l_1 = -5;
				 l_2 = -9; end
		528: begin l_1 = +5;
				 l_2 = +10; end
		1443: begin l_1 = +5;
				 l_2 = -10; end
		496: begin l_1 = -5;
				 l_2 = +10; end
		1411: begin l_1 = -5;
				 l_2 = -10; end
		1040: begin l_1 = +5;
				 l_2 = +11; end
		931: begin l_1 = +5;
				 l_2 = -11; end
		1008: begin l_1 = -5;
				 l_2 = +11; end
		899: begin l_1 = -5;
				 l_2 = -11; end
		125: begin l_1 = +5;
				 l_2 = +12; end
		1846: begin l_1 = +5;
				 l_2 = -12; end
		93: begin l_1 = -5;
				 l_2 = +12; end
		1814: begin l_1 = -5;
				 l_2 = -12; end
		234: begin l_1 = +5;
				 l_2 = +13; end
		1737: begin l_1 = +5;
				 l_2 = -13; end
		202: begin l_1 = -5;
				 l_2 = +13; end
		1705: begin l_1 = -5;
				 l_2 = -13; end
		452: begin l_1 = +5;
				 l_2 = +14; end
		1519: begin l_1 = +5;
				 l_2 = -14; end
		420: begin l_1 = -5;
				 l_2 = +14; end
		1487: begin l_1 = -5;
				 l_2 = -14; end
		888: begin l_1 = +5;
				 l_2 = +15; end
		1083: begin l_1 = +5;
				 l_2 = -15; end
		856: begin l_1 = -5;
				 l_2 = +15; end
		1051: begin l_1 = -5;
				 l_2 = -15; end
		1760: begin l_1 = +5;
				 l_2 = +16; end
		211: begin l_1 = +5;
				 l_2 = -16; end
		1728: begin l_1 = -5;
				 l_2 = +16; end
		179: begin l_1 = -5;
				 l_2 = -16; end
		1565: begin l_1 = +5;
				 l_2 = +17; end
		406: begin l_1 = +5;
				 l_2 = -17; end
		1533: begin l_1 = -5;
				 l_2 = +17; end
		374: begin l_1 = -5;
				 l_2 = -17; end
		1175: begin l_1 = +5;
				 l_2 = +18; end
		796: begin l_1 = +5;
				 l_2 = -18; end
		1143: begin l_1 = -5;
				 l_2 = +18; end
		764: begin l_1 = -5;
				 l_2 = -18; end
		395: begin l_1 = +5;
				 l_2 = +19; end
		1576: begin l_1 = +5;
				 l_2 = -19; end
		363: begin l_1 = -5;
				 l_2 = +19; end
		1544: begin l_1 = -5;
				 l_2 = -19; end
		96: begin l_1 = -6;
				 l_2 = +8; end
		1843: begin l_1 = -6;
				 l_2 = -7; end
		160: begin l_1 = +6;
				 l_2 = +8; end
		1779: begin l_1 = -6;
				 l_2 = -8; end
		288: begin l_1 = +6;
				 l_2 = +9; end
		1715: begin l_1 = +6;
				 l_2 = -9; end
		224: begin l_1 = -6;
				 l_2 = +9; end
		1651: begin l_1 = -6;
				 l_2 = -9; end
		544: begin l_1 = +6;
				 l_2 = +10; end
		1459: begin l_1 = +6;
				 l_2 = -10; end
		480: begin l_1 = -6;
				 l_2 = +10; end
		1395: begin l_1 = -6;
				 l_2 = -10; end
		1056: begin l_1 = +6;
				 l_2 = +11; end
		947: begin l_1 = +6;
				 l_2 = -11; end
		992: begin l_1 = -6;
				 l_2 = +11; end
		883: begin l_1 = -6;
				 l_2 = -11; end
		141: begin l_1 = +6;
				 l_2 = +12; end
		1862: begin l_1 = +6;
				 l_2 = -12; end
		77: begin l_1 = -6;
				 l_2 = +12; end
		1798: begin l_1 = -6;
				 l_2 = -12; end
		250: begin l_1 = +6;
				 l_2 = +13; end
		1753: begin l_1 = +6;
				 l_2 = -13; end
		186: begin l_1 = -6;
				 l_2 = +13; end
		1689: begin l_1 = -6;
				 l_2 = -13; end
		468: begin l_1 = +6;
				 l_2 = +14; end
		1535: begin l_1 = +6;
				 l_2 = -14; end
		404: begin l_1 = -6;
				 l_2 = +14; end
		1471: begin l_1 = -6;
				 l_2 = -14; end
		904: begin l_1 = +6;
				 l_2 = +15; end
		1099: begin l_1 = +6;
				 l_2 = -15; end
		840: begin l_1 = -6;
				 l_2 = +15; end
		1035: begin l_1 = -6;
				 l_2 = -15; end
		1776: begin l_1 = +6;
				 l_2 = +16; end
		227: begin l_1 = +6;
				 l_2 = -16; end
		1712: begin l_1 = -6;
				 l_2 = +16; end
		163: begin l_1 = -6;
				 l_2 = -16; end
		1581: begin l_1 = +6;
				 l_2 = +17; end
		422: begin l_1 = +6;
				 l_2 = -17; end
		1517: begin l_1 = -6;
				 l_2 = +17; end
		358: begin l_1 = -6;
				 l_2 = -17; end
		1191: begin l_1 = +6;
				 l_2 = +18; end
		812: begin l_1 = +6;
				 l_2 = -18; end
		1127: begin l_1 = -6;
				 l_2 = +18; end
		748: begin l_1 = -6;
				 l_2 = -18; end
		411: begin l_1 = +6;
				 l_2 = +19; end
		1592: begin l_1 = +6;
				 l_2 = -19; end
		347: begin l_1 = -6;
				 l_2 = +19; end
		1528: begin l_1 = -6;
				 l_2 = -19; end
		192: begin l_1 = -7;
				 l_2 = +9; end
		1747: begin l_1 = -7;
				 l_2 = -8; end
		320: begin l_1 = +7;
				 l_2 = +9; end
		1619: begin l_1 = -7;
				 l_2 = -9; end
		576: begin l_1 = +7;
				 l_2 = +10; end
		1491: begin l_1 = +7;
				 l_2 = -10; end
		448: begin l_1 = -7;
				 l_2 = +10; end
		1363: begin l_1 = -7;
				 l_2 = -10; end
		1088: begin l_1 = +7;
				 l_2 = +11; end
		979: begin l_1 = +7;
				 l_2 = -11; end
		960: begin l_1 = -7;
				 l_2 = +11; end
		851: begin l_1 = -7;
				 l_2 = -11; end
		173: begin l_1 = +7;
				 l_2 = +12; end
		1894: begin l_1 = +7;
				 l_2 = -12; end
		45: begin l_1 = -7;
				 l_2 = +12; end
		1766: begin l_1 = -7;
				 l_2 = -12; end
		282: begin l_1 = +7;
				 l_2 = +13; end
		1785: begin l_1 = +7;
				 l_2 = -13; end
		154: begin l_1 = -7;
				 l_2 = +13; end
		1657: begin l_1 = -7;
				 l_2 = -13; end
		500: begin l_1 = +7;
				 l_2 = +14; end
		1567: begin l_1 = +7;
				 l_2 = -14; end
		372: begin l_1 = -7;
				 l_2 = +14; end
		1439: begin l_1 = -7;
				 l_2 = -14; end
		936: begin l_1 = +7;
				 l_2 = +15; end
		1131: begin l_1 = +7;
				 l_2 = -15; end
		808: begin l_1 = -7;
				 l_2 = +15; end
		1003: begin l_1 = -7;
				 l_2 = -15; end
		1808: begin l_1 = +7;
				 l_2 = +16; end
		259: begin l_1 = +7;
				 l_2 = -16; end
		1680: begin l_1 = -7;
				 l_2 = +16; end
		131: begin l_1 = -7;
				 l_2 = -16; end
		1613: begin l_1 = +7;
				 l_2 = +17; end
		454: begin l_1 = +7;
				 l_2 = -17; end
		1485: begin l_1 = -7;
				 l_2 = +17; end
		326: begin l_1 = -7;
				 l_2 = -17; end
		1223: begin l_1 = +7;
				 l_2 = +18; end
		844: begin l_1 = +7;
				 l_2 = -18; end
		1095: begin l_1 = -7;
				 l_2 = +18; end
		716: begin l_1 = -7;
				 l_2 = -18; end
		443: begin l_1 = +7;
				 l_2 = +19; end
		1624: begin l_1 = +7;
				 l_2 = -19; end
		315: begin l_1 = -7;
				 l_2 = +19; end
		1496: begin l_1 = -7;
				 l_2 = -19; end
		384: begin l_1 = -8;
				 l_2 = +10; end
		1555: begin l_1 = -8;
				 l_2 = -9; end
		640: begin l_1 = +8;
				 l_2 = +10; end
		1299: begin l_1 = -8;
				 l_2 = -10; end
		1152: begin l_1 = +8;
				 l_2 = +11; end
		1043: begin l_1 = +8;
				 l_2 = -11; end
		896: begin l_1 = -8;
				 l_2 = +11; end
		787: begin l_1 = -8;
				 l_2 = -11; end
		237: begin l_1 = +8;
				 l_2 = +12; end
		19: begin l_1 = +8;
				 l_2 = -12; end
		1920: begin l_1 = -8;
				 l_2 = +12; end
		1702: begin l_1 = -8;
				 l_2 = -12; end
		346: begin l_1 = +8;
				 l_2 = +13; end
		1849: begin l_1 = +8;
				 l_2 = -13; end
		90: begin l_1 = -8;
				 l_2 = +13; end
		1593: begin l_1 = -8;
				 l_2 = -13; end
		564: begin l_1 = +8;
				 l_2 = +14; end
		1631: begin l_1 = +8;
				 l_2 = -14; end
		308: begin l_1 = -8;
				 l_2 = +14; end
		1375: begin l_1 = -8;
				 l_2 = -14; end
		1000: begin l_1 = +8;
				 l_2 = +15; end
		1195: begin l_1 = +8;
				 l_2 = -15; end
		744: begin l_1 = -8;
				 l_2 = +15; end
		939: begin l_1 = -8;
				 l_2 = -15; end
		1872: begin l_1 = +8;
				 l_2 = +16; end
		323: begin l_1 = +8;
				 l_2 = -16; end
		1616: begin l_1 = -8;
				 l_2 = +16; end
		67: begin l_1 = -8;
				 l_2 = -16; end
		1677: begin l_1 = +8;
				 l_2 = +17; end
		518: begin l_1 = +8;
				 l_2 = -17; end
		1421: begin l_1 = -8;
				 l_2 = +17; end
		262: begin l_1 = -8;
				 l_2 = -17; end
		1287: begin l_1 = +8;
				 l_2 = +18; end
		908: begin l_1 = +8;
				 l_2 = -18; end
		1031: begin l_1 = -8;
				 l_2 = +18; end
		652: begin l_1 = -8;
				 l_2 = -18; end
		507: begin l_1 = +8;
				 l_2 = +19; end
		1688: begin l_1 = +8;
				 l_2 = -19; end
		251: begin l_1 = -8;
				 l_2 = +19; end
		1432: begin l_1 = -8;
				 l_2 = -19; end
		768: begin l_1 = -9;
				 l_2 = +11; end
		1171: begin l_1 = -9;
				 l_2 = -10; end
		1280: begin l_1 = +9;
				 l_2 = +11; end
		659: begin l_1 = -9;
				 l_2 = -11; end
		365: begin l_1 = +9;
				 l_2 = +12; end
		147: begin l_1 = +9;
				 l_2 = -12; end
		1792: begin l_1 = -9;
				 l_2 = +12; end
		1574: begin l_1 = -9;
				 l_2 = -12; end
		474: begin l_1 = +9;
				 l_2 = +13; end
		38: begin l_1 = +9;
				 l_2 = -13; end
		1901: begin l_1 = -9;
				 l_2 = +13; end
		1465: begin l_1 = -9;
				 l_2 = -13; end
		692: begin l_1 = +9;
				 l_2 = +14; end
		1759: begin l_1 = +9;
				 l_2 = -14; end
		180: begin l_1 = -9;
				 l_2 = +14; end
		1247: begin l_1 = -9;
				 l_2 = -14; end
		1128: begin l_1 = +9;
				 l_2 = +15; end
		1323: begin l_1 = +9;
				 l_2 = -15; end
		616: begin l_1 = -9;
				 l_2 = +15; end
		811: begin l_1 = -9;
				 l_2 = -15; end
		61: begin l_1 = +9;
				 l_2 = +16; end
		451: begin l_1 = +9;
				 l_2 = -16; end
		1488: begin l_1 = -9;
				 l_2 = +16; end
		1878: begin l_1 = -9;
				 l_2 = -16; end
		1805: begin l_1 = +9;
				 l_2 = +17; end
		646: begin l_1 = +9;
				 l_2 = -17; end
		1293: begin l_1 = -9;
				 l_2 = +17; end
		134: begin l_1 = -9;
				 l_2 = -17; end
		1415: begin l_1 = +9;
				 l_2 = +18; end
		1036: begin l_1 = +9;
				 l_2 = -18; end
		903: begin l_1 = -9;
				 l_2 = +18; end
		524: begin l_1 = -9;
				 l_2 = -18; end
		635: begin l_1 = +9;
				 l_2 = +19; end
		1816: begin l_1 = +9;
				 l_2 = -19; end
		123: begin l_1 = -9;
				 l_2 = +19; end
		1304: begin l_1 = -9;
				 l_2 = -19; end
		1536: begin l_1 = -10;
				 l_2 = +12; end
		403: begin l_1 = -10;
				 l_2 = -11; end
		621: begin l_1 = +10;
				 l_2 = +12; end
		1318: begin l_1 = -10;
				 l_2 = -12; end
		730: begin l_1 = +10;
				 l_2 = +13; end
		294: begin l_1 = +10;
				 l_2 = -13; end
		1645: begin l_1 = -10;
				 l_2 = +13; end
		1209: begin l_1 = -10;
				 l_2 = -13; end
		948: begin l_1 = +10;
				 l_2 = +14; end
		76: begin l_1 = +10;
				 l_2 = -14; end
		1863: begin l_1 = -10;
				 l_2 = +14; end
		991: begin l_1 = -10;
				 l_2 = -14; end
		1384: begin l_1 = +10;
				 l_2 = +15; end
		1579: begin l_1 = +10;
				 l_2 = -15; end
		360: begin l_1 = -10;
				 l_2 = +15; end
		555: begin l_1 = -10;
				 l_2 = -15; end
		317: begin l_1 = +10;
				 l_2 = +16; end
		707: begin l_1 = +10;
				 l_2 = -16; end
		1232: begin l_1 = -10;
				 l_2 = +16; end
		1622: begin l_1 = -10;
				 l_2 = -16; end
		122: begin l_1 = +10;
				 l_2 = +17; end
		902: begin l_1 = +10;
				 l_2 = -17; end
		1037: begin l_1 = -10;
				 l_2 = +17; end
		1817: begin l_1 = -10;
				 l_2 = -17; end
		1671: begin l_1 = +10;
				 l_2 = +18; end
		1292: begin l_1 = +10;
				 l_2 = -18; end
		647: begin l_1 = -10;
				 l_2 = +18; end
		268: begin l_1 = -10;
				 l_2 = -18; end
		891: begin l_1 = +10;
				 l_2 = +19; end
		133: begin l_1 = +10;
				 l_2 = -19; end
		1806: begin l_1 = -10;
				 l_2 = +19; end
		1048: begin l_1 = -10;
				 l_2 = -19; end
		1133: begin l_1 = -11;
				 l_2 = +13; end
		806: begin l_1 = -11;
				 l_2 = -12; end
		1242: begin l_1 = +11;
				 l_2 = +13; end
		697: begin l_1 = -11;
				 l_2 = -13; end
		1460: begin l_1 = +11;
				 l_2 = +14; end
		588: begin l_1 = +11;
				 l_2 = -14; end
		1351: begin l_1 = -11;
				 l_2 = +14; end
		479: begin l_1 = -11;
				 l_2 = -14; end
		1896: begin l_1 = +11;
				 l_2 = +15; end
		152: begin l_1 = +11;
				 l_2 = -15; end
		1787: begin l_1 = -11;
				 l_2 = +15; end
		43: begin l_1 = -11;
				 l_2 = -15; end
		829: begin l_1 = +11;
				 l_2 = +16; end
		1219: begin l_1 = +11;
				 l_2 = -16; end
		720: begin l_1 = -11;
				 l_2 = +16; end
		1110: begin l_1 = -11;
				 l_2 = -16; end
		634: begin l_1 = +11;
				 l_2 = +17; end
		1414: begin l_1 = +11;
				 l_2 = -17; end
		525: begin l_1 = -11;
				 l_2 = +17; end
		1305: begin l_1 = -11;
				 l_2 = -17; end
		244: begin l_1 = +11;
				 l_2 = +18; end
		1804: begin l_1 = +11;
				 l_2 = -18; end
		135: begin l_1 = -11;
				 l_2 = +18; end
		1695: begin l_1 = -11;
				 l_2 = -18; end
		1403: begin l_1 = +11;
				 l_2 = +19; end
		645: begin l_1 = +11;
				 l_2 = -19; end
		1294: begin l_1 = -11;
				 l_2 = +19; end
		536: begin l_1 = -11;
				 l_2 = -19; end
		327: begin l_1 = -12;
				 l_2 = +14; end
		1612: begin l_1 = -12;
				 l_2 = -13; end
		545: begin l_1 = +12;
				 l_2 = +14; end
		1394: begin l_1 = -12;
				 l_2 = -14; end
		981: begin l_1 = +12;
				 l_2 = +15; end
		1176: begin l_1 = +12;
				 l_2 = -15; end
		763: begin l_1 = -12;
				 l_2 = +15; end
		958: begin l_1 = -12;
				 l_2 = -15; end
		1853: begin l_1 = +12;
				 l_2 = +16; end
		304: begin l_1 = +12;
				 l_2 = -16; end
		1635: begin l_1 = -12;
				 l_2 = +16; end
		86: begin l_1 = -12;
				 l_2 = -16; end
		1658: begin l_1 = +12;
				 l_2 = +17; end
		499: begin l_1 = +12;
				 l_2 = -17; end
		1440: begin l_1 = -12;
				 l_2 = +17; end
		281: begin l_1 = -12;
				 l_2 = -17; end
		1268: begin l_1 = +12;
				 l_2 = +18; end
		889: begin l_1 = +12;
				 l_2 = -18; end
		1050: begin l_1 = -12;
				 l_2 = +18; end
		671: begin l_1 = -12;
				 l_2 = -18; end
		488: begin l_1 = +12;
				 l_2 = +19; end
		1669: begin l_1 = +12;
				 l_2 = -19; end
		270: begin l_1 = -12;
				 l_2 = +19; end
		1451: begin l_1 = -12;
				 l_2 = -19; end
		654: begin l_1 = -13;
				 l_2 = +15; end
		1285: begin l_1 = -13;
				 l_2 = -14; end
		1090: begin l_1 = +13;
				 l_2 = +15; end
		849: begin l_1 = -13;
				 l_2 = -15; end
		23: begin l_1 = +13;
				 l_2 = +16; end
		413: begin l_1 = +13;
				 l_2 = -16; end
		1526: begin l_1 = -13;
				 l_2 = +16; end
		1916: begin l_1 = -13;
				 l_2 = -16; end
		1767: begin l_1 = +13;
				 l_2 = +17; end
		608: begin l_1 = +13;
				 l_2 = -17; end
		1331: begin l_1 = -13;
				 l_2 = +17; end
		172: begin l_1 = -13;
				 l_2 = -17; end
		1377: begin l_1 = +13;
				 l_2 = +18; end
		998: begin l_1 = +13;
				 l_2 = -18; end
		941: begin l_1 = -13;
				 l_2 = +18; end
		562: begin l_1 = -13;
				 l_2 = -18; end
		597: begin l_1 = +13;
				 l_2 = +19; end
		1778: begin l_1 = +13;
				 l_2 = -19; end
		161: begin l_1 = -13;
				 l_2 = +19; end
		1342: begin l_1 = -13;
				 l_2 = -19; end
		1308: begin l_1 = -14;
				 l_2 = +16; end
		631: begin l_1 = -14;
				 l_2 = -15; end
		241: begin l_1 = +14;
				 l_2 = +16; end
		1698: begin l_1 = -14;
				 l_2 = -16; end
		46: begin l_1 = +14;
				 l_2 = +17; end
		826: begin l_1 = +14;
				 l_2 = -17; end
		1113: begin l_1 = -14;
				 l_2 = +17; end
		1893: begin l_1 = -14;
				 l_2 = -17; end
		1595: begin l_1 = +14;
				 l_2 = +18; end
		1216: begin l_1 = +14;
				 l_2 = -18; end
		723: begin l_1 = -14;
				 l_2 = +18; end
		344: begin l_1 = -14;
				 l_2 = -18; end
		815: begin l_1 = +14;
				 l_2 = +19; end
		57: begin l_1 = +14;
				 l_2 = -19; end
		1882: begin l_1 = -14;
				 l_2 = +19; end
		1124: begin l_1 = -14;
				 l_2 = -19; end
		677: begin l_1 = -15;
				 l_2 = +17; end
		1262: begin l_1 = -15;
				 l_2 = -16; end
		482: begin l_1 = +15;
				 l_2 = +17; end
		1457: begin l_1 = -15;
				 l_2 = -17; end
		92: begin l_1 = +15;
				 l_2 = +18; end
		1652: begin l_1 = +15;
				 l_2 = -18; end
		287: begin l_1 = -15;
				 l_2 = +18; end
		1847: begin l_1 = -15;
				 l_2 = -18; end
		1251: begin l_1 = +15;
				 l_2 = +19; end
		493: begin l_1 = +15;
				 l_2 = -19; end
		1446: begin l_1 = -15;
				 l_2 = +19; end
		688: begin l_1 = -15;
				 l_2 = -19; end
		1354: begin l_1 = -16;
				 l_2 = +18; end
		585: begin l_1 = -16;
				 l_2 = -17; end
		964: begin l_1 = +16;
				 l_2 = +18; end
		975: begin l_1 = -16;
				 l_2 = -18; end
		184: begin l_1 = +16;
				 l_2 = +19; end
		1365: begin l_1 = +16;
				 l_2 = -19; end
		574: begin l_1 = -16;
				 l_2 = +19; end
		1755: begin l_1 = -16;
				 l_2 = -19; end
		769: begin l_1 = -17;
				 l_2 = +19; end
		1170: begin l_1 = -17;
				 l_2 = -18; end
		1928: begin l_1 = +17;
				 l_2 = +19; end
		11: begin l_1 = -17;
				 l_2 = -19; end
		1538: begin l_1 = +18;
				 l_2 = +19; end
		401: begin l_1 = -18;
				 l_2 = -19; end
		default: begin l_1 = 0;
					   l_2 = 0; end
	endcase
end

endmodule
