import 'package:flutter/material.dart';
import 'package:recipefood/auth/login.dart';
import 'package:recipefood/auth/sign_up.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpage();
}

class _firstpage extends State<firstpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 150,
            child: Container(
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                image: NetworkImage(
                    "https://img.freepik.com/premium-vector/cartoon-kid-cook_10308-227.jpg"),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 60, right: 60),
                      child: Column(
                        children: [
                          Text(
                            "Prung Rose",
                            style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 82, 82),
                                height: 1.2, //line height 150% of actual height
                                shadows: [
                                  Shadow(
                                    offset:
                                        Offset(2.0, 2.0), //position of shadow
                                    blurRadius: 8.0, //blur intensity of shadow
                                    color: Colors.black.withOpacity(
                                        0.8), //color of shadow with opacity
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 35),
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 255, 177, 61), // Background color
                              ),
                              child: const Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 255, 82, 82),
                                      ),
                                    ),
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.person,
                                      color: Colors.red,
                                      size: 35,
                                    )),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                // Navigate to second route when tapped.
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const login()),
                                  );
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 255, 177, 61), // Background color
                              ),
                              child: const Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Sing up ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 255, 82, 82),
                                      ),
                                    ),
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.person_add_alt_1,
                                      color: Colors.red,
                                      size: 35,
                                    )),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                // Navigate to second route when tapped.
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const sign_up()),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
