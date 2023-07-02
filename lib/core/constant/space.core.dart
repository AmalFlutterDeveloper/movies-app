import 'package:flutter/material.dart';
import 'package:movies_app/service/navigation.service.dart';

/// it will return SizedBox.shrink();
const empty = SizedBox.shrink();

/// gap 2*2
const space2 = _Space(2);

/// gap 3*3
const space3 = _Space(3);

/// gap 4*4
const space4 = _Space(4);

/// gap 6*6
const space6 = _Space(6);

/// gap 8*8
const space8 = _Space(8);

/// gap 10*10
const space10 = _Space(10);

/// gap 12*12
const space12 = _Space(12);

/// gap 11*11
const space11 = _Space(11);

/// gap 14*14
const space14 = _Space(14);

/// gap 16*16
const space16 = _Space(16);

/// gap 20*20
const space20 = _Space(20);

/// gap 23*23
const space23 = _Space(23);

/// gap 24*24
const space24 = _Space(24);

/// gap 26*26
const space26 = _Space(26);

/// gap 32*32
const space32 = _Space(32);

/// gap 34*34
const space34 = _Space(34);

/// gap 40*40
const space40 = _Space(40);

/// gap 48*48
const space48 = _Space(48);

/// gap 64*64
const space64 = _Space(64);

/// gap 75*75
const space75 = _Space(75);

/// gap 100*100
const space100 = _Space(100);

/// default divider
const divider = Divider(
  thickness: 1,
  color: Color(0xffF2F4F7),
);

/// this method will be used to return a sized box with height of status bar
/// to avoid hide any content if screen behind status bar
SizedBox get appbarHeight => SizedBox(
      height: MediaQuery.of(NavigationService.context!).viewPadding.top,
    );

/// bottom navigation bar height, this must be used in
/// 'menu,booking request,home,favorites and inbox' pages
const bottomNavigationBarHeight = SizedBox(height: 64);

const spaceW = SizedBox(width: double.infinity);

class _Space extends StatelessWidget {
  const _Space(this.size);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size, height: size);
  }
}
