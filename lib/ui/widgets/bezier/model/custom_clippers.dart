import 'package:flutter/material.dart';

// ----- HANDLE -----

class HandleClipper extends CustomClipper<Path> {
  HandleClipper({Key? key});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 470.85;
    final double yScaling = size.height / 55.98;
    path.lineTo(235.425 * xScaling, 55.985 * yScaling);
    path.cubicTo(
      235.425 * xScaling,
      55.985 * yScaling,
      0 * xScaling,
      55.985 * yScaling,
      0 * xScaling,
      55.985 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      55.985 * yScaling,
      0.017 * xScaling,
      54.617 * yScaling,
      0 * xScaling,
      50.7 * yScaling,
    );
    path.cubicTo(
      -0.017 * xScaling,
      46.78300000000001 * yScaling,
      2.14 * xScaling,
      41 * yScaling,
      5.424 * xScaling,
      38.493 * yScaling,
    );
    path.cubicTo(
      8.708 * xScaling,
      35.986000000000004 * yScaling,
      14.586 * xScaling,
      32.9 * yScaling,
      23.853 * xScaling,
      32.9 * yScaling,
    );
    path.cubicTo(
      23.853 * xScaling,
      32.9 * yScaling,
      149.353 * xScaling,
      32.9 * yScaling,
      149.353 * xScaling,
      32.9 * yScaling,
    );
    path.cubicTo(
      149.353 * xScaling,
      32.9 * yScaling,
      154.172 * xScaling,
      33.025 * yScaling,
      162.15300000000002 * xScaling,
      32.9 * yScaling,
    );
    path.cubicTo(
      170.13400000000004 * xScaling,
      32.775 * yScaling,
      178.45900000000003 * xScaling,
      31.49 * yScaling,
      183.341 * xScaling,
      29.738999999999997 * yScaling,
    );
    path.cubicTo(
      188.22299999999998 * xScaling,
      27.987999999999996 * yScaling,
      191.906 * xScaling,
      27.086 * yScaling,
      195.841 * xScaling,
      21.052999999999997 * yScaling,
    );
    path.cubicTo(
      199.776 * xScaling,
      15.019999999999996 * yScaling,
      200.221 * xScaling,
      11.913999999999998 * yScaling,
      202.973 * xScaling,
      7.5159999999999965 * yScaling,
    );
    path.cubicTo(
      205.72500000000002 * xScaling,
      3.117999999999995 * yScaling,
      208.807 * xScaling,
      0 * yScaling,
      218.2 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      218.2 * xScaling,
      0 * yScaling,
      252.648 * xScaling,
      0 * yScaling,
      252.648 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      262.042 * xScaling,
      0 * yScaling,
      265.115 * xScaling,
      3.121 * yScaling,
      267.866 * xScaling,
      7.519 * yScaling,
    );
    path.cubicTo(
      270.61699999999996 * xScaling,
      11.917 * yScaling,
      271.06 * xScaling,
      15.024000000000001 * yScaling,
      274.99699999999996 * xScaling,
      21.056 * yScaling,
    );
    path.cubicTo(
      278.9339999999999 * xScaling,
      27.088 * yScaling,
      282.61799999999994 * xScaling,
      27.992 * yScaling,
      287.49699999999996 * xScaling,
      29.742 * yScaling,
    );
    path.cubicTo(
      292.376 * xScaling,
      31.492 * yScaling,
      300.69699999999995 * xScaling,
      32.778 * yScaling,
      308.686 * xScaling,
      32.903 * yScaling,
    );
    path.cubicTo(
      316.675 * xScaling,
      33.028 * yScaling,
      321.486 * xScaling,
      32.903 * yScaling,
      321.486 * xScaling,
      32.903 * yScaling,
    );
    path.cubicTo(
      321.486 * xScaling,
      32.903 * yScaling,
      447 * xScaling,
      32.903 * yScaling,
      447 * xScaling,
      32.903 * yScaling,
    );
    path.cubicTo(
      456.266 * xScaling,
      32.903 * yScaling,
      462.142 * xScaling,
      35.983 * yScaling,
      465.427 * xScaling,
      38.494 * yScaling,
    );
    path.cubicTo(
      468.71200000000005 * xScaling,
      41.005 * yScaling,
      470.868 * xScaling,
      46.786 * yScaling,
      470.851 * xScaling,
      50.702 * yScaling,
    );
    path.cubicTo(
      470.834 * xScaling,
      54.617999999999995 * yScaling,
      470.851 * xScaling,
      55.985 * yScaling,
      470.851 * xScaling,
      55.985 * yScaling,
    );
    path.cubicTo(
      470.851 * xScaling,
      55.985 * yScaling,
      235.425 * xScaling,
      55.985 * yScaling,
      235.425 * xScaling,
      55.985 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // throw UnimplementedError();
    return false;
  }
}

// ----- ANIMATED BACKGROUND (3 states, 3 transitions) -----

class BigClipper_animated_0_1 extends CustomClipper<Path> {
  double progress; //[0,1]
  BigClipper_animated_0_1({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.81 + (0) * progress;
    final double artboardH = 284.51 + (-3.009999999999991) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (138.224 + (-64.58099999999999) * progress) * xScaling,
      (285.82800000000003 + (3.8600000000000136) * progress) * yScaling,
      (322.752 + (-75.46800000000002) * progress) * xScaling,
      (273.47200000000004 + (-27.310999999999922) * progress) * yScaling,
    );
    path.cubicTo(
      (507.28000000000003 + (-86.35500000000008) * progress) * xScaling,
      (261.11600000000004 + (-58.48199999999986) * progress) * yScaling,
      (503.03499999999997 + (1.0980000000000132) * progress) * xScaling,
      (241.65900000000005 + (-64.54599999999994) * progress) * yScaling,
      (699.2819999999999 + (0.46100000000001273) * progress) * xScaling,
      (273.47200000000004 + (-40.68399999999997) * progress) * yScaling,
    );
    path.cubicTo(
      (895.5289999999999 + (-0.17600000000004457) * progress) * xScaling,
      (305.285 + (-16.822000000000003) * progress) * yScaling,
      (956.299 + (119.21399999999994) * progress) * xScaling,
      (226.84500000000008 + (-40.68399999999997) * progress) * yScaling,
      (1094.456 + (119.21400000000017) * progress) * xScaling,
      (273.47200000000004 + (-40.68399999999997) * progress) * yScaling,
    );
    path.cubicTo(
      (1232.6129999999998 + (119.2140000000004) * progress) * xScaling,
      (320.099 + (-40.68399999999997) * progress) * yScaling,
      (1418.2 + (73.38599999999997) * progress) * xScaling,
      (207.74100000000004 + (26.391000000000076) * progress) * yScaling,
      (1583.69 + (73.38000000000011) * progress) * xScaling,
      (247.08099999999996 + (26.391000000000076) * progress) * yScaling,
    );
    path.cubicTo(
      (1749.18 + (73.37400000000025) * progress) * xScaling,
      (286.4209999999999 + (26.391000000000076) * progress) * yScaling,
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (203.35499999999996 + (-0.0009999999998626663) * progress) * yScaling,
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (203.35499999999996 + (-0.0009999999998626663) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (203.35499999999996 + (-0.0009999999998626663) * progress) * yScaling,
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.313 + (-0.0009999999999763531) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BigClipper_animated_1_2 extends CustomClipper<Path> {
  double progress; //[0,1]
  BigClipper_animated_1_2({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.81 + (2.4300000000000637) * progress;
    final double artboardH = 281.5 + (-14.129999999999995) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0.22099999999999997) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (73.643 + (-84.446) * progress) * xScaling,
      (289.68800000000005 + (-13.376999999999953) * progress) * yScaling,
      (247.284 + (-84.446) * progress) * xScaling,
      (246.16100000000012 + (-13.373000000000047) * progress) * yScaling,
    );
    path.cubicTo(
      (420.92499999999995 + (-84.44599999999997) * progress) * xScaling,
      (202.63400000000019 + (-13.369000000000142) * progress) * yScaling,
      (504.133 + (54.286) * progress) * xScaling,
      (177.1130000000001 + (17.024999999999977) * progress) * yScaling,
      (699.7429999999999 + (54.28600000000006) * progress) * xScaling,
      (232.78800000000007 + (17.024999999999977) * progress) * yScaling,
    );
    path.cubicTo(
      (895.3529999999998 + (54.28600000000017) * progress) * xScaling,
      (288.463 + (17.024999999999977) * progress) * yScaling,
      (1075.513 + (140.14600000000019) * progress) * xScaling,
      (186.16100000000012 + (-0.00100000000009004) * progress) * yScaling,
      (1213.67 + (140.14699999999993) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1351.8270000000002 + (140.14799999999968) * progress) * xScaling,
      (279.415 + (0.00100000000009004) * progress) * yScaling,
      (1491.586 + (136.49399999999991) * progress) * xScaling,
      (234.13200000000012 + (45.59299999999996) * progress) * yScaling,
      (1657.0700000000002 + (133.47199999999975) * progress) * xScaling,
      (273.47200000000004 + (-40.68399999999997) * progress) * yScaling,
    );
    path.cubicTo(
      (1822.5540000000003 + (130.4499999999996) * progress) * xScaling,
      (312.81199999999995 + (-126.9609999999999) * progress) * yScaling,
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (203.3540000000001 + (0) * progress) * yScaling,
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (203.3540000000001 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (203.3540000000001 + (0) * progress) * yScaling,
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3120000000001 + (0.22299999999972897) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BigClipper_animated_2_0 extends CustomClipper<Path> {
  double progress; //[0,1]
  BigClipper_animated_2_0({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1924.24 + (-2.4300000000000637) * progress;
    final double artboardH = 267.37 + (17.139999999999986) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.721 + (-0.22099999999999997) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (232.78800000000007 + (0) * progress) * yScaling,
      (-10.802999999999999 + (149.027) * progress) * xScaling,
      (276.3110000000001 + (9.516999999999939) * progress) * yScaling,
      (162.838 + (159.91400000000002) * progress) * xScaling,
      (232.78800000000007 + (40.68399999999997) * progress) * yScaling,
    );
    path.cubicTo(
      (336.479 + (170.80100000000004) * progress) * xScaling,
      (189.26500000000004 + (71.851) * progress) * yScaling,
      (558.419 + (-55.384000000000015) * progress) * xScaling,
      (194.1380000000001 + (47.52099999999996) * progress) * yScaling,
      (754.029 + (-54.74700000000007) * progress) * xScaling,
      (249.81300000000005 + (23.658999999999992) * progress) * yScaling,
    );
    path.cubicTo(
      (949.639 + (-54.11000000000013) * progress) * xScaling,
      (305.488 + (-0.20299999999997453) * progress) * yScaling,
      (1215.659 + (-259.3600000000001) * progress) * xScaling,
      (186.16000000000003 + (40.68500000000006) * progress) * yScaling,
      (1353.817 + (-259.3610000000001) * progress) * xScaling,
      (232.78800000000007 + (40.68399999999997) * progress) * yScaling,
    );
    path.cubicTo(
      (1491.975 + (-259.3620000000001) * progress) * xScaling,
      (279.4160000000001 + (40.68299999999988) * progress) * yScaling,
      (1628.08 + (-209.87999999999988) * progress) * xScaling,
      (279.7250000000001 + (-71.98400000000004) * progress) * yScaling,
      (1790.542 + (-206.85199999999986) * progress) * xScaling,
      (232.78800000000007 + (14.292999999999893) * progress) * yScaling,
    );
    path.cubicTo(
      (1953.004 + (-203.82399999999984) * progress) * xScaling,
      (185.85100000000006 + (100.56999999999982) * progress) * yScaling,
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (203.3540000000001 + (0.0009999999998626663) * progress) * yScaling,
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (203.3540000000001 + (0.0009999999998626663) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (203.3540000000001 + (0.0009999999998626663) * progress) * yScaling,
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.5349999999999 + (-0.22199999999975262) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.721 + (-0.22099999999999997) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MedClipper_animated_0_1 extends CustomClipper<Path> {
  double progress; //[0,1]
  MedClipper_animated_0_1({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.81 + (0) * progress;
    final double artboardH = 204.42 + (-12.669999999999987) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (34.277 + (71.798) * progress) * xScaling,
      (202.99999999999994 + (0) * progress) * yScaling,
      (218.8 + (71.80000000000001) * progress) * xScaling,
      (190.64600000000002 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (403.32300000000004 + (71.80200000000002) * progress) * xScaling,
      (178.2920000000001 + (0) * progress) * yScaling,
      (604.953 + (-137.48399999999992) * progress) * xScaling,
      (158.83300000000003 + (-26.887) * progress) * yScaling,
      (801.2 + (-137.48400000000004) * progress) * xScaling,
      (190.64600000000002 + (-26.887) * progress) * yScaling,
    );
    path.cubicTo(
      (997.4470000000001 + (-137.48400000000015) * progress) * xScaling,
      (222.459 + (-26.887000000000057) * progress) * yScaling,
      (1099.6080000000002 + (-177.91100000000017) * progress) * xScaling,
      (144.019 + (-26.887) * progress) * yScaling,
      (1237.765 + (-177.91100000000006) * progress) * xScaling,
      (190.64600000000002 + (-26.887) * progress) * yScaling,
    );
    path.cubicTo(
      (1375.922 + (-177.91100000000006) * progress) * xScaling,
      (237.27299999999997 + (-26.886999999999944) * progress) * yScaling,
      (1533.343 + (-177.06200000000013) * progress) * xScaling,
      (151.30700000000002 + (-26.887) * progress) * yScaling,
      (1698.8290000000002 + (-177.06200000000013) * progress) * xScaling,
      (190.64600000000002 + (-26.887) * progress) * yScaling,
    );
    path.cubicTo(
      (1864.3150000000003 + (-177.06200000000013) * progress) * xScaling,
      (229.98499999999996 + (-26.886999999999944) * progress) * yScaling,
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (140.046 + (0.0010000000000331966) * progress) * yScaling,
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (140.046 + (0.0010000000000331966) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (140.046 + (0.0010000000000331966) * progress) * yScaling,
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3080000000002 + (0.0009999999997489795) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MedClipper_animated_1_2 extends CustomClipper<Path> {
  double progress; //[0,1]
  MedClipper_animated_1_2({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.81 + (0.14000000000010004) * progress;
    final double artboardH = 191.75 + (6.5) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0.20199999999999996) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (106.075 + (-116.791) * progress) * xScaling,
      (202.99999999999994 + (-26.886999999999944) * progress) * yScaling,
      (290.6 + (-116.78800000000001) * progress) * xScaling,
      (190.64600000000002 + (-26.888000000000034) * progress) * yScaling,
    );
    path.cubicTo(
      (475.12500000000006 + (-116.78500000000003) * progress) * xScaling,
      (178.2920000000001 + (-26.889000000000124) * progress) * yScaling,
      (467.46900000000005 + (-101.87600000000003) * progress) * xScaling,
      (131.94600000000003 + (21.074999999999932) * progress) * yScaling,
      (663.716 + (-101.87599999999998) * progress) * xScaling,
      (163.75900000000001 + (21.07499999999999) * progress) * yScaling,
    );
    path.cubicTo(
      (859.963 + (-101.87599999999998) * progress) * xScaling,
      (195.57199999999995 + (21.075000000000045) * progress) * yScaling,
      (921.697 + (59.02900000000011) * progress) * xScaling,
      (117.132 + (0.0020000000000095497) * progress) * yScaling,
      (1059.854 + (59.028999999999996) * progress) * xScaling,
      (163.75900000000001 + (-0.0010000000000331966) * progress) * yScaling,
    );
    path.cubicTo(
      (1198.011 + (59.028999999999996) * progress) * xScaling,
      (210.38600000000002 + (-0.004000000000132786) * progress) * yScaling,
      (1356.281 + (190.58000000000015) * progress) * xScaling,
      (124.42000000000002 + (86.01799999999992) * progress) * yScaling,
      (1521.767 + (178.73700000000008) * progress) * xScaling,
      (163.75900000000001 + (-0.0010000000000331966) * progress) * yScaling,
    );
    path.cubicTo(
      (1687.2530000000002 + (166.894) * progress) * xScaling,
      (203.098 + (-86.01999999999998) * progress) * yScaling,
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (140.04700000000003 + (-0.0010000000000331966) * progress) * yScaling,
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (140.04700000000003 + (-0.0010000000000331966) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (140.04700000000003 + (-0.0010000000000331966) * progress) * yScaling,
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.309 + (0.20600000000013097) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MedClipper_animated_2_0 extends CustomClipper<Path> {
  double progress; //[0,1]
  MedClipper_animated_2_0({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.95 + (-0.14000000000010004) * progress;
    final double artboardH = 198.25 + (6.1699999999999875) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.702 + (-0.20199999999999996) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (-10.716 + (44.993) * progress) * xScaling,
      (176.113 + (26.886999999999944) * progress) * yScaling,
      (173.812 + (44.988) * progress) * xScaling,
      (163.75799999999998 + (26.888000000000034) * progress) * yScaling,
    );
    path.cubicTo(
      (358.34000000000003 + (44.983000000000004) * progress) * xScaling,
      (151.40299999999996 + (26.889000000000124) * progress) * yScaling,
      (365.593 + (239.35999999999996) * progress) * xScaling,
      (153.02099999999996 + (5.812000000000069) * progress) * yScaling,
      (561.84 + (239.36) * progress) * xScaling,
      (184.834 + (5.812000000000012) * progress) * yScaling,
    );
    path.cubicTo(
      (758.087 + (239.36000000000013) * progress) * xScaling,
      (216.647 + (5.812000000000012) * progress) * yScaling,
      (980.7260000000001 + (118.88200000000006) * progress) * xScaling,
      (117.13400000000001 + (26.88499999999999) * progress) * yScaling,
      (1118.883 + (118.88200000000006) * progress) * xScaling,
      (163.75799999999998 + (26.888000000000034) * progress) * yScaling,
    );
    path.cubicTo(
      (1257.04 + (118.88200000000006) * progress) * xScaling,
      (210.3819999999999 + (26.891000000000076) * progress) * yScaling,
      (1546.861 + (-13.518000000000029) * progress) * xScaling,
      (210.43799999999993 + (-59.130999999999915) * progress) * yScaling,
      (1700.5040000000001 + (-1.6749999999999545) * progress) * xScaling,
      (163.75799999999998 + (26.888000000000034) * progress) * yScaling,
    );
    path.cubicTo(
      (1854.1470000000002 + (10.16800000000012) * progress) * xScaling,
      (117.07800000000003 + (112.90699999999993) * progress) * yScaling,
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (140.046 + (0) * progress) * yScaling,
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.515 + (-0.20699999999987995) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.702 + (-0.20199999999999996) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SmallClipper_animated_0_1 extends CustomClipper<Path> {
  double progress; //[0,1]
  SmallClipper_animated_0_1({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1922.06 + (-0.25) * progress;
    final double artboardH = 110.48 + (-1.8599999999999994) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (219.459 + (-103.319) * progress) * xScaling,
      (95.851 + (46.150000000000034) * progress) * yScaling,
      (397.876 + (-103.07599999999996) * progress) * xScaling,
      (66.541 + (29.11700000000002) * progress) * yScaling,
    );
    path.cubicTo(
      (576.2929999999999 + (-102.83299999999986) * progress) * xScaling,
      (37.230999999999995 + (12.084000000000003) * progress) * yScaling,
      (815.7 + (-200.52300000000002) * progress) * xScaling,
      (148.961 + (-115.87700000000001) * progress) * yScaling,
      (969.976 + (-183.4219999999999) * progress) * xScaling,
      (95.65699999999998 + (-19.998999999999967) * progress) * yScaling,
    );
    path.cubicTo(
      (1124.252 + (-166.3209999999998) * progress) * xScaling,
      (42.35299999999995 + (75.87900000000008) * progress) * yScaling,
      (1321.804 + (-151.33500000000004) * progress) * xScaling,
      (19.913999999999987 + (19.836000000000013) * progress) * yScaling,
      (1459.961 + (-151.33400000000006) * progress) * xScaling,
      (66.541 + (19.836000000000013) * progress) * yScaling,
    );
    path.cubicTo(
      (1598.118 + (-151.33300000000008) * progress) * xScaling,
      (113.168 + (19.836000000000013) * progress) * yScaling,
      (1630.153 + (-97.39300000000003) * progress) * xScaling,
      (116.21999999999997 + (-65.00799999999998) * progress) * yScaling,
      (1782.443 + (-97.39200000000005) * progress) * xScaling,
      (106.49099999999999 + (-65.00799999999998) * progress) * yScaling,
    );
    path.cubicTo(
      (1934.733 + (-97.39100000000008) * progress) * xScaling,
      (96.762 + (-65.00799999999998) * progress) * yScaling,
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (66.541 + (-0.0020000000000095497) * progress) * yScaling,
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (66.541 + (-0.0020000000000095497) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (66.541 + (-0.0020000000000095497) * progress) * yScaling,
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.316 + (0.0019999999999527063) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SmallClipper_animated_1_2 extends CustomClipper<Path> {
  double progress; //[0,1]
  SmallClipper_animated_1_2({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.81 + (0.009999999999990905) * progress;
    final double artboardH = 108.62 + (15.159999999999997) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.5 + (0.026000000000000023) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (116.14 + (-120.063) * progress) * xScaling,
      (142.00100000000003 + (-144.22500000000002) * progress) * yScaling,
      (294.8 + (-102.767) * progress) * xScaling,
      (95.65800000000002 + (-54.173) * progress) * yScaling,
    );
    path.cubicTo(
      (473.46000000000004 + (-85.471) * progress) * xScaling,
      (49.315 + (35.87900000000002) * progress) * yScaling,
      (615.177 + (-294.459) * progress) * xScaling,
      (33.084 + (68.72800000000001) * progress) * yScaling,
      (786.5540000000001 + (-304.2060000000001) * progress) * xScaling,
      (75.65800000000002 + (31.442999999999984) * progress) * yScaling,
    );
    path.cubicTo(
      (957.9310000000002 + (-313.9530000000002) * progress) * xScaling,
      (118.23200000000003 + (-5.842000000000041) * progress) * yScaling,
      (1170.469 + (-350.4000000000001) * progress) * xScaling,
      (39.75 + (-7.206999999999994) * progress) * yScaling,
      (1308.627 + (-350.40099999999995) * progress) * xScaling,
      (86.37700000000001 + (-7.206000000000017) * progress) * yScaling,
    );
    path.cubicTo(
      (1446.7849999999999 + (-350.4019999999998) * progress) * xScaling,
      (133.00400000000002 + (-7.205000000000041) * progress) * yScaling,
      (1532.76 + (-151.25299999999993) * progress) * xScaling,
      (51.21199999999999 + (87.11899999999997) * progress) * yScaling,
      (1685.051 + (-161.7869999999998) * progress) * xScaling,
      (41.483000000000004 + (65.618) * progress) * yScaling,
    );
    path.cubicTo(
      (1837.3419999999999 + (-172.32099999999969) * progress) * xScaling,
      (31.75400000000002 + (44.11700000000002) * progress) * yScaling,
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (66.53899999999999 + (0.0020000000000095497) * progress) * yScaling,
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (66.53899999999999 + (0.0020000000000095497) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (66.53899999999999 + (0.0020000000000095497) * progress) * yScaling,
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.318 + (0.020000000000209184) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.5 + (0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SmallClipper_animated_2_0 extends CustomClipper<Path> {
  double progress; //[0,1]
  SmallClipper_animated_2_0({Key? key, required this.progress});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 1921.82 + (0.2400000000000091) * progress;
    final double artboardH = 123.78 + (-13.299999999999997) * progress;
    final double xScaling = size.width / artboardW;
    final double yScaling = size.height / artboardH;
    path.lineTo((0.526 + (-0.026000000000000023) * progress) * xScaling, (0.5 + (0) * progress) * yScaling);
    path.cubicTo(
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (53.858000000000004 + (0) * progress) * yScaling,
      (-3.923 + (223.382) * progress) * xScaling,
      (-2.2239999999999895 + (98.07499999999999) * progress) * yScaling,
      (192.03300000000002 + (205.84299999999996) * progress) * xScaling,
      (41.485000000000014 + (25.055999999999983) * progress) * yScaling,
    );
    path.cubicTo(
      (387.98900000000003 + (188.30399999999986) * progress) * xScaling,
      (85.19400000000002 + (-47.96300000000002) * progress) * yScaling,
      (320.718 + (494.982) * progress) * xScaling,
      (101.81200000000001 + (47.149) * progress) * yScaling,
      (482.348 + (487.628) * progress) * xScaling,
      (107.101 + (-11.444000000000017) * progress) * yScaling,
    );
    path.cubicTo(
      (643.978 + (480.274) * progress) * xScaling,
      (112.38999999999999 + (-70.03700000000003) * progress) * yScaling,
      (820.069 + (501.7350000000001) * progress) * xScaling,
      (32.543000000000006 + (-12.629000000000019) * progress) * yScaling,
      (958.226 + (501.735) * progress) * xScaling,
      (79.17099999999999 + (-12.629999999999995) * progress) * yScaling,
    );
    path.cubicTo(
      (1096.383 + (501.7349999999999) * progress) * xScaling,
      (125.79899999999998 + (-12.630999999999972) * progress) * yScaling,
      (1381.507 + (248.64599999999996) * progress) * xScaling,
      (138.33099999999996 + (-22.11099999999999) * progress) * yScaling,
      (1523.2640000000001 + (259.17899999999986) * progress) * xScaling,
      (107.101 + (-0.6100000000000136) * progress) * yScaling,
    );
    path.cubicTo(
      (1665.0210000000002 + (269.71199999999976) * progress) * xScaling,
      (75.87100000000004 + (20.890999999999963) * progress) * yScaling,
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (66.541 + (0) * progress) * yScaling,
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (66.541 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (66.541 + (0) * progress) * yScaling,
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    path.cubicTo(
      (1922.3380000000002 + (-0.02200000000016189) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
      (0.526 + (-0.026000000000000023) * progress) * xScaling,
      (0.5 + (0) * progress) * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
