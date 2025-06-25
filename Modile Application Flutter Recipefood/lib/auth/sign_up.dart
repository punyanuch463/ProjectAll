import 'package:flutter/material.dart';
import 'package:recipefood/auth/login.dart';
import 'package:recipefood/sql/sql.dart';
import 'package:recipefood/sql/sqlmodel.dart';
import 'package:recipefood/component/aleat.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_up();
}

class _sign_up extends State<sign_up> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _name;
  late TextEditingController _age;
  late TextEditingController _gender;
  var dbHelper;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    _age = TextEditingController();
    _gender = TextEditingController();
    dbHelper = DbHelper();
  }

  signUp() async {
    String name = _name.text;
    String email = _email.text;
    String password = _password.text;
    String gender = _gender.text;
    String age = _age.text;
    print(validateEmail(email));

    if (email.isEmpty) {
      alertDialog(context, "Please Enter Email.");
    } else if (validateEmail(email) == false) {
      alertDialog(context, "Please Enter name@email.com.");
    } else if (password.isEmpty) {
      alertDialog(context, "Please Enter Password.");
    } else if (password.length < 8) {
      alertDialog(context, "A password must have at least 8 characters.");
    } else if (name.isEmpty) {
      alertDialog(context, "Please Enter Name.");
    } else if (gender.isEmpty) {
      alertDialog(context, "Please Enter Gender.");
    } else if (gender.toLowerCase() == "female" ||
        gender.toLowerCase() == "male") {
      alertDialog(context, "Please Enter female or male .");
    } else if (age.isEmpty) {
      alertDialog(context, "Please Enter Age.");
    } else {
      _validate = false;
      Signup sin = Signup(name, email, password, gender, age);
      await dbHelper.saveData(sin).then((userData) {
        alertDialog(this.context, "Successfully Saved.");
        print("Save");
        Navigator.push(
            this.context, MaterialPageRoute(builder: (_) => login()));
      }).catchError((error) {
        print(error);
        alertDialog(this.context, "Error: Data Save Fail.");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 80, right: 90.0, left: 10, bottom: 20),
          child: Container(
            child: Center(
              child: Text("SIGNUP",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
            ),
            height: 70.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 202, 83, 15),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: _name,
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 2.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.person,
                ),
              ),
              hintText: "Name",
              filled: true,
              fillColor: Color.fromARGB(255, 219, 219, 219),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _email,
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.email,
                ),
              ),
              hintText: 'First.Last@Email.com',
              filled: true,
              fillColor: Color.fromARGB(255, 219, 219, 219),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.password,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.all(20),
              hintText: "Password",
              filled: true,
              fillColor: Color.fromARGB(255, 219, 219, 219),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _gender,
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.female,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.all(20),
              hintText: "Female , Male",
              filled: true,
              fillColor: Color.fromARGB(255, 219, 219, 219),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _age,
            decoration: InputDecoration(
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.numbers,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.all(20),
              hintText: "Age",
              filled: true,
              fillColor: Color.fromARGB(255, 219, 219, 219),
            ),
          ),
        ),
        const SizedBox(height: 40),
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
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 82, 82),
                  ),
                ),
                onPressed: signUp),
          ),
        ),
      ],
    ));
  }
}
