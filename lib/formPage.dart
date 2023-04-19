import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var formKey = GlobalKey<FormState>();
  var nameConttroller = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameConttroller,
                        decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Kullanıcı adı giriniz!";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Şifre"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Şifre giriniz!";
                          }
                          if (value.length < 6) {
                            return "Şifreyi en az   6 haneli olmalıdır!";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            bool control = formKey.currentState!.validate();
                            if (control) {
                              print(
                                  "Kullanıcı Adı: ${nameConttroller.text} - Şifre: ${passwordController.text}");
                            }
                          },
                          child: Text("Giriş"))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
