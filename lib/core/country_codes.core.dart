
import 'package:movies_app/core/dartz/dartz.core.dart';

const countryCodes = [
  Tuple('EG', 20),
  Tuple('AF', 93),
  Tuple('AX', 358),
  Tuple('AL', 355),
  Tuple('DZ', 213),
  Tuple('AS', 1),
  Tuple('AD', 376),
  Tuple('AO', 244),
  Tuple('AI', 1),
  Tuple('AG', 1),
  Tuple('AR', 54),
  Tuple('AM', 374),
  Tuple('AW', 297),
  Tuple('AC', 247),
  Tuple('AU', 61),
  Tuple('AT', 43),
  Tuple('AZ', 994),
  Tuple('BS', 1),
  Tuple('BH', 973),
  Tuple('BD', 880),
  Tuple('BB', 1),
  Tuple('BY', 375),
  Tuple('BE', 32),
  Tuple('BZ', 501),
  Tuple('BJ', 229),
  Tuple('BM', 1),
  Tuple('BT', 975),
  Tuple('BO', 591),
  Tuple('BA', 387),
  Tuple('BW', 267),
  Tuple('BR', 55),
  Tuple('IO', 246),
  Tuple('VG', 1),
  Tuple('BN', 673),
  Tuple('BG', 359),
  Tuple('BF', 226),
  Tuple('BI', 257),
  Tuple('KH', 855),
  Tuple('CM', 237),
  Tuple('CA', 1),
  Tuple('CV', 238),
  Tuple('BQ', 599),
  Tuple('KY', 1),
  Tuple('CF', 236),
  Tuple('TD', 235),
  Tuple('CL', 56),
  Tuple('CN', 86),
  Tuple('CX', 61),
  Tuple('CC', 61),
  Tuple('CO', 57),
  Tuple('KM', 269),
  Tuple('CD', 243),
  Tuple('CG', 242),
  Tuple('CK', 682),
  Tuple('CR', 506),
  Tuple('CI', 225),
  Tuple('HR', 385),
  Tuple('CU', 53),
  Tuple('CW', 599),
  Tuple('CY', 357),
  Tuple('CZ', 420),
  Tuple('DK', 45),
  Tuple('DJ', 253),
  Tuple('DM', 1),
  Tuple('DO', 1),
  Tuple('TL', 670),
  Tuple('EC', 593),
  Tuple('SV', 503),
  Tuple('GQ', 240),
  Tuple('ER', 291),
  Tuple('EE', 372),
  Tuple('SZ', 268),
  Tuple('ET', 251),
  Tuple('FK', 500),
  Tuple('FO', 298),
  Tuple('FJ', 679),
  Tuple('FI', 358),
  Tuple('FR', 33),
  Tuple('GF', 594),
  Tuple('PF', 689),
  Tuple('GA', 241),
  Tuple('GM', 220),
  Tuple('GE', 995),
  Tuple('DE', 49),
  Tuple('GH', 233),
  Tuple('GI', 350),
  Tuple('GR', 30),
  Tuple('GL', 299),
  Tuple('GD', 1),
  Tuple('GP', 590),
  Tuple('GU', 1),
  Tuple('GT', 502),
  Tuple('GG', 44),
  Tuple('GN', 224),
  Tuple('GW', 245),
  Tuple('GY', 592),
  Tuple('HT', 509),
  Tuple('HM', 672),
  Tuple('HN', 504),
  Tuple('HK', 852),
  Tuple('HU', 36),
  Tuple('IS', 354),
  Tuple('IN', 91),
  Tuple('ID', 62),
  Tuple('IR', 98),
  Tuple('IQ', 964),
  Tuple('IE', 353),
  Tuple('IM', 44),
  Tuple('IL', 972),
  Tuple('IT', 39),
  Tuple('JM', 1),
  Tuple('JP', 81),
  Tuple('JE', 44),
  Tuple('JO', 962),
  Tuple('KZ', 7),
  Tuple('KE', 254),
  Tuple('KI', 686),
  Tuple('XK', 383),
  Tuple('KW', 965),
  Tuple('KG', 996),
  Tuple('LA', 856),
  Tuple('LV', 371),
  Tuple('LB', 961),
  Tuple('LS', 266),
  Tuple('LR', 231),
  Tuple('LY', 218),
  Tuple('LI', 423),
  Tuple('LT', 370),
  Tuple('LU', 352),
  Tuple('MO', 853),
  Tuple('MK', 389),
  Tuple('MG', 261),
  Tuple('MW', 265),
  Tuple('MY', 60),
  Tuple('MV', 960),
  Tuple('ML', 223),
  Tuple('MT', 356),
  Tuple('MH', 692),
  Tuple('MQ', 596),
  Tuple('MR', 222),
  Tuple('MU', 230),
  Tuple('YT', 262),
  Tuple('MX', 52),
  Tuple('FM', 691),
  Tuple('MD', 373),
  Tuple('MC', 377),
  Tuple('MN', 976),
  Tuple('ME', 382),
  Tuple('MS', 1),
  Tuple('MA', 212),
  Tuple('MZ', 258),
  Tuple('MM', 95),
  Tuple('NA', 264),
  Tuple('NR', 674),
  Tuple('NP', 977),
  Tuple('NL', 31),
  Tuple('NC', 687),
  Tuple('NZ', 64),
  Tuple('NI', 505),
  Tuple('NE', 227),
  Tuple('NG', 234),
  Tuple('NU', 683),
  Tuple('NF', 672),
  Tuple('KP', 850),
  Tuple('MP', 1),
  Tuple('NO', 47),
  Tuple('OM', 968),
  Tuple('PK', 92),
  Tuple('PW', 680),
  Tuple('PS', 970),
  Tuple('PA', 507),
  Tuple('PG', 675),
  Tuple('PY', 595),
  Tuple('PE', 51),
  Tuple('PH', 63),
  Tuple('PL', 48),
  Tuple('PT', 351),
  Tuple('PR', 1),
  Tuple('QA', 974),
  Tuple('RE', 262),
  Tuple('RO', 40),
  Tuple('RU', 7),
  Tuple('RW', 250),
  Tuple('BL', 590),
  Tuple('SH', 290),
  Tuple('KN', 1),
  Tuple('LC', 1),
  Tuple('MF', 590),
  Tuple('PM', 508),
  Tuple('VC', 1),
  Tuple('WS', 685),
  Tuple('SM', 378),
  Tuple('ST', 239),
  Tuple('SA', 966),
  Tuple('SN', 221),
  Tuple('RS', 381),
  Tuple('SC', 248),
  Tuple('SL', 232),
  Tuple('SG', 65),
  Tuple('SX', 1),
  Tuple('SK', 421),
  Tuple('SI', 386),
  Tuple('SB', 677),
  Tuple('SO', 252),
  Tuple('ZA', 27),
  Tuple('GS', 500),
  Tuple('KR', 82),
  Tuple('SS', 211),
  Tuple('ES', 34),
  Tuple('LK', 94),
  Tuple('SD', 249),
  Tuple('SR', 597),
  Tuple('SJ', 47),
  Tuple('SE', 46),
  Tuple('CH', 41),
  Tuple('SY', 963),
  Tuple('TW', 886),
  Tuple('TJ', 992),
  Tuple('TZ', 255),
  Tuple('TH', 66),
  Tuple('TG', 228),
  Tuple('TK', 690),
  Tuple('TO', 676),
  Tuple('TT', 1),
  Tuple('TN', 216),
  Tuple('TR', 90),
  Tuple('TM', 993),
  Tuple('TC', 1),
  Tuple('TV', 688),
  Tuple('VI', 1),
  Tuple('UG', 256),
  Tuple('UA', 380),
  Tuple('AE', 971),
  Tuple('GB', 44),
  Tuple('US', 1),
  Tuple('UY', 598),
  Tuple('UZ', 998),
  Tuple('VU', 678),
  Tuple('VA', 379),
  Tuple('VE', 58),
  Tuple('VN', 84),
  Tuple('WF', 681),
  Tuple('EH', 212),
  Tuple('YE', 967),
  Tuple('ZM', 260),
  Tuple('ZW', 263),
];
