class Signup {
  late String name;
  late String email;
  late String password;
  late String gender;
  late String age;
Signup(this.name, this.email, this.password, this.gender,this.age);
  

// columns in the database.
  Map<String, dynamic> toMap() {
   var map = <String, dynamic> {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
    };
    return map;
  }
  

  Signup.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    gender = map['gender'];
    age = map['age'];
  }

//   @override
//   String toString() {
//     return 'Signup{ name: $name, email : $email ,  password : $password,  gender : $gender , age: $age}';
//   }
}
