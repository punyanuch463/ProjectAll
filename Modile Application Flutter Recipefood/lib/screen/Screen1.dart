import 'dart:ui';
import 'package:recipefood/food/result0.dart';
import 'package:recipefood/food/result1.dart';
import 'package:recipefood/food/result2.dart';
import 'package:recipefood/food/result3.dart';
import 'package:flutter/material.dart';
import 'package:recipefood/api/foodmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Home Tab

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);
  @override
  State<Screen1> createState() => _Screen1();
}

class _Screen1 extends State<Screen1> {
  late TextEditingController _search;
  final _selectedColor = Color.fromARGB(255, 212, 90, 19);
  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

// void search() {
  late Recipe data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: const Text(
          "Prung Rose",
          style: TextStyle(fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'Search.... ',
                      prefixIcon: GestureDetector(
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 30,
                              color: Color.fromARGB(255, 255, 231, 123),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Screen1()),
                              );
                            }),
                      ),
                      suffixIcon: GestureDetector(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 212, 90, 19),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Screensearch(searchtext: _search.text)),
                            );
                          },
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Screensearch extends StatelessWidget {
  var searchtext;
  Screensearch({
    super.key,
    @required this.searchtext,
  });

  late Recipe data;
  Future fetchFood() async {
    String search = searchtext;
    final url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=' +
            '${search}' +
            '&addRecipeInformation=true&fillIngredients=true&apiKey=a1662b50b3f442bcbd567cf15f4b9264');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("${search}");
      print(data["results"]);
      return data["results"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _selectedColor = Color.fromARGB(255, 212, 90, 19);
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          leading: GestureDetector(
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                  color: Color.fromARGB(255, 255, 231, 123),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: _selectedColor,
          title: const Text(
            "Search",
            style: TextStyle(fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
            future: fetchFood(),
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
