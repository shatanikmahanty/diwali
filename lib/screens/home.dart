import 'package:diwali/widgets/candle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDiyaLit = false;
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height,
            color: const Color(0xff533263),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Happy\n✦ Diwali ✦",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.8,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Image.asset("assets/images/diya.png"),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "May the festival of light, light up new paths and bring peace, prosperity, and happiness ❤‍🔥 \n\n~ Best wishes from Shatanik",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            width: isDiyaLit ? 0 : size.width * 4,
            height: isDiyaLit ? 0 : size.height * 4,
            duration: const Duration(milliseconds: 500),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff3b3b3b),
              ),
            ),
          ),
          if (!isDiyaLit) ...[
            const Positioned(
              top: 50,
              child: Draggable(
                data: 10,
                feedback: Candle(),
                childWhenDragging: SizedBox(),
                child: Candle(),
              ),
            ),
            Center(
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Image.asset("assets/images/unlit_diya.png");
                },
                onAccept: (int data) {
                  setState(() {
                    isDiyaLit = !isDiyaLit;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 60,
              width: size.width,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Light the diya and celebrate Diwali with me ✦",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.8,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
