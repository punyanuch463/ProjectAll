import 'package:flutter/material.dart';
import 'package:recipefood/food/result0.dart';
import 'package:recipefood/food/result1.dart';
import 'package:recipefood/food/result2.dart';
import 'package:recipefood/food/result3.dart';
import 'package:recipefood/api/foodmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// // Home Tab

class Screen4 extends StatelessWidget {
  Screen4({Key? key}) : super(key: key);

  late Recipe data;

  Future fetchFoodscookie() async {
    final url = Uri.parse(
        "https://api.spoonacular.com/recipes/random?number=5&tags=dessert&apiKey=a1662b50b3f442bcbd567cf15f4b9264");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data["recipes"][0]["extendedIngredients"][0]);
      return data["recipes"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _selectedColor = Color.fromARGB(255, 212, 90, 19);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: _selectedColor,
          title: const Text(
            "Prung Rose",
            style: TextStyle(fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
            future: fetchFoodscookie(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var result = snapshot.data;

                return ListView(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  page1(screen4page1: result[0])),
                           );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(255, 223, 221, 221),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        result[0]['title'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.network(
                                    result[0]['image'],
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  page2(screen4page2: result[1])),
                         );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 255, 238, 238),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 200,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      result[1]['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  result[1]['image'],
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  page3(screen4page3: result[2])),
                         );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(255, 223, 221, 221),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        result[2]['title'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.network(
                                    result[2]['image'],
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  page4(screen4page4: result[3])),
                          );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 255, 238, 238),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 200,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      result[3]['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  result[3]['image'],
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return LinearProgressIndicator();
            }));
  }
}
