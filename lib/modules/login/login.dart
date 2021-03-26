import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final kFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('LoginPage'), automaticallyImplyLeading: false),
      body: Center(
          child: Form(
        key: kFormKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => controller.email.value = value!,
                decoration: InputDecoration(labelText: 'Email'),
                enableSuggestions: true,
                maxLength: 32,
                style: TextStyle(fontSize: 20),
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return 'Please enter a valid email address';
                  } else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => controller.password.value = value!,
                  decoration: InputDecoration(labelText: 'Password'),
                  enableSuggestions: true,
                  obscureText: true,
                  maxLength: 20,
                  style: TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 5) {
                      return 'Password cannot be less than 5 characters';
                    } else
                      return null;
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                final FormState form = kFormKey.currentState!;
                form.validate() ? form.save() : print('error logging in');
                if (form.validate()) {
                  await controller.login();
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      )),
    );
  }
}
