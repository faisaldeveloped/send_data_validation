import 'package:data_between_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Send Data From one page to another',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void validate() {
  //   (formKey.currentState!.validate());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Name",
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Requird"),
                      MinLengthValidator(3,
                          errorText: "Should Be At least 3 characters"),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Email",
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Requird"),
                      EmailValidator(errorText: "Not A Valid Email"),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Phone",
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Requird"),
                      MinLengthValidator(10,
                          errorText: "Should Be At least 10 Numbers"),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                        name: _name.text,
                        email: _email.text,
                        phone: _phone.text),
                  ),
                );
              }
            },
            child: const Text("Go To Home"),
          ),
        ],
      ),
    );
  }
}
