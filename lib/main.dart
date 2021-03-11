import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/register.dart';
import 'widgets/home.dart';
import 'widgets/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,

                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXtq-C4jlvqFXGsfXJoqDdzkyDdoJ5XwbnDQ&usqp=CAU")
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  if (usernameController.text == "admin" && passwordController.text == "password"){
                    print("success");
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString("token", "thisismypassword");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  else {
                    // TODO : Add a Toast
                    print("error");
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: Text("New User? Sign Up")
            ),
            // Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
