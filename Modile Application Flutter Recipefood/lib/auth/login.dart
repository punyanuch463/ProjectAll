import 'package:flutter/material.dart';
import '/home_page.dart';
import 'package:recipefood/sql/sql.dart';
import 'package:recipefood/component/aleat.dart';
import 'package:recipefood/sql/sqlmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  late TextEditingController _email;
  late TextEditingController _password;
  var dbHelper;
  bool _validate = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    dbHelper = DbHelper();
  }

  Future setSP(Signup user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  login() async {
    String email = _email.text;
    String password = _password.text;

    if (email.isEmpty) {
      alertDialog(context, "Please Enter Email");
    } else if (validateEmail(email) == false) {
      alertDialog(context, "Please Enter name@email.com");
    } else if (password.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(email, password).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            print(validateEmail(email));
            print("Login");
            // print(validateEmail(email));
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        // print( );
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
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
              child: Text("LOGIN",
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
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 82, 82),
                ),
              ),
              onPressed: login,
            ),
          ),
        ),
      ],
    ));
  }
}
