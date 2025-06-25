import 'package:flutter/material.dart';

// Home Tab
class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedColor = Color.fromARGB(255, 212, 90, 19);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: _selectedColor,
          title: const Text(
            "About Us",
            style: TextStyle(fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: <Widget>[
          Container(
            color: Color.fromARGB(255, 223, 221, 221),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: "6487047",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.person,
                              color: Colors.red,
                              size: 35,
                            )),
                            TextSpan(
                              text: "Punyanuch Mongkonthipparat",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/aum.png'),
                  radius: 60,
                ),
               
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 255, 238, 238),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: "6487086",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.person,
                              color: Colors.red,
                              size: 35,
                            )),
                            TextSpan(
                              text: "Pimpisa Apiapim",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/TK.jpg'),
                  radius: 60,
                ),
              ],
            ),
          ),
        ]));
  }
}
