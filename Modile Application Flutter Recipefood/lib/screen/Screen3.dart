import 'package:flutter/material.dart';
import 'package:recipefood/api/convert_unit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Home Tab
class Screen3 extends StatefulWidget {
  const Screen3({super.key});
  @override
  State<Screen3> createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
  late TextEditingController _ingredientName;
  late TextEditingController _sourceAmount;
  late TextEditingController _sourceUnit;
  late TextEditingController _targetUnit;

  @override
  void initState() {
    super.initState();
    _ingredientName = TextEditingController();
    _sourceAmount = TextEditingController();
    _sourceUnit = TextEditingController();
    _targetUnit = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _selectedColor = Color.fromARGB(255, 212, 90, 19);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: const Text(
          "Convert Unit",
          style: TextStyle(fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          // --------------------------ingredientName-----------------

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _ingredientName,
              decoration: InputDecoration(
                prefixIcon: Align(
                  widthFactor: 2.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                hintText: "Ingredient : flour,milk,sugar..",
                filled: true,
                fillColor: Color.fromARGB(255, 219, 219, 219),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          //------------------------------------------------
          //-------------Amount------------------------------

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _sourceAmount,
              decoration: InputDecoration(
                prefixIcon: Align(
                  widthFactor: 2.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                hintText: "Amount :1,2,3,4..",
                filled: true,
                fillColor: Color.fromARGB(255, 219, 219, 219),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          //------------------------------------------------

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _sourceUnit,
              decoration: InputDecoration(
                prefixIcon: Align(
                  widthFactor: 2.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                hintText: "Unit : cups , grams , oz , ml..",
                filled: true,
                fillColor: Color.fromARGB(255, 219, 219, 219),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          //------------------------------------------------

          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 214, 52),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "targetUnit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 212, 90, 19),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _targetUnit,
              decoration: InputDecoration(
                prefixIcon: Align(
                  widthFactor: 2.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                hintText: "targetUnit : cups , grams , oz , ml..",
                filled: true,
                fillColor: Color.fromARGB(255, 219, 219, 219),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 255, 177, 61), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Send',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 82, 82),
                        ),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 244, 238, 54),
                        size: 20,
                      )),
                    ],
                  ),
                ),
               
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Con_Unit(
                            ingredient: _ingredientName.text,
                            sourceAmount: _sourceAmount.text,
                            sourceUnit: _sourceUnit.text,
                            targetUnit: _targetUnit.text)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Con_Unit extends StatelessWidget {
  var ingredient;
  var sourceAmount;
  var sourceUnit;
  var targetUnit;
  Con_Unit({
    super.key,
    @required this.ingredient,
    @required this.sourceAmount,
    @required this.sourceUnit,
    @required this.targetUnit,
  });

  late Convert data;
  Future fetchFood() async {
    String ingredient_ = ingredient;
    String Amount = sourceAmount;
    String Unit = sourceUnit;
    String GoalUnit = targetUnit;
    final url = Uri.parse(
        'https://api.spoonacular.com/recipes/convert?ingredientName=' +
            ingredient_ +
            '&sourceAmount=' +
            Amount +
            '&sourceUnit=' +
            Unit +
            '&targetUnit=' +
            GoalUnit +
            '&apiKey=a1662b50b3f442bcbd567cf15f4b9264');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(ingredient);
      print(Amount);
      print(Unit);
      print(GoalUnit);
      print(data);
      return data;
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
            "Convert Unit",
            style: TextStyle(fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
            future: fetchFood(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var result = snapshot.data;

                return ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 214, 52),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Answer ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 212, 90, 19),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              result['answer'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            )),
                      ),
                    ),
                  ),
                ]);
              }
              return LinearProgressIndicator();
            }));
  }
}
