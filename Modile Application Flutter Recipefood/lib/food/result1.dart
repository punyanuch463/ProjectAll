import 'package:flutter/material.dart';

// Home Tab
class page2 extends StatelessWidget {
  //รับ route มาจาก Screen4
  var screen4page2;
  page2({
    super.key,
    @required this.screen4page2,
  });

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
            "making ",
            style: TextStyle(fontSize: 30),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 170,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          screen4page2['title'],
                          // result[0]['title'],
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        )),
                  ),
                  Image.network(
                    screen4page2['image'],
                     height: 170,
                    width: 170,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.yellow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        screen4page2["summary"],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Ingredients :",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int x = 1;
                            x < screen4page2["extendedIngredients"].length;
                            x++) ...[
                          Text(screen4page2["extendedIngredients"][x]
                              ["original"]),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      "Time : ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Text("ReadyInMinutes : " +
                      "${screen4page2['readyInMinutes']}"),
                  Container(
                    child: Text(
                      "Step  : ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int x = 1;
                            x <
                                screen4page2["analyzedInstructions"][0]["steps"]
                                    .length;
                            x++) ...[
                          Text('$x . )  ' +
                              screen4page2["analyzedInstructions"][0]["steps"]
                                  [x]["step"]),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

