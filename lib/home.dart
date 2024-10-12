import 'dart:ui';
import 'package:animations/animatedWidgetExtension.dart';
import 'package:animations/flutterLogoPointer.dart';
import 'package:animations/typeWrite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin {
  Animation<double>? PoninterAnimation;
  AnimationController? PoninterController;

  AnimationController? shakeController;

  @override
  void initState() {
    super.initState();
    PoninterController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    PoninterController!.forward();
    PoninterAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(PoninterController!);
    PoninterController!.addListener(() {
      if (PoninterAnimation!.value == 1) {
        //shake six times
        shakeController!.forward();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    shakeController!.dispose();
    PoninterController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Curve curve = Curves.bounceOut;

    // Convert 0-1 to 0-1-0
    double shake(double animation) =>
        2 * (0.5 - (0.5 - curve.transform(animation)).abs());

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter, 
            child: AnimatedBuilder(
              animation: shakeController!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-80, 70), // No offset for centering
                  child: SizedBox(
                    width: 100, // Set your desired width
                    height: 100, // Set your desired height
                    child: CustomPaint(
                      painter: FlutterLogoPainter(
                        flutterLogoProgress: PoninterAnimation?.value ?? 0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (PoninterAnimation?.value == 1)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: GoogleFonts.lato(
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0,
                      ),
                    ).fadeInList(1, true),
                    TypeWrite(
                      textScaleFactor: 1,
                      seconds: 2,
                      word: 'F l u t t e r',
                      style: GoogleFonts.lato(
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 45.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }}
