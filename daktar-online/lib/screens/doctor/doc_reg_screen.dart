import 'dart:math';

import 'package:flutter/material.dart';

class DocRegScreen extends StatefulWidget {
  const DocRegScreen({Key? key}) : super(key: key);

  @override
  State<DocRegScreen> createState() => _DocRegScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

final Map<String, String?> _regData = {
  'name': '',
  'email': '',
  'designation': '',
  'gender': '',
  'phone': '',
  'password': '',
};
final _passwordController = TextEditingController();

class _DocRegScreenState extends State<DocRegScreen> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  // validator: (value) {
                  //   if (value!.isEmpty || !value.contains('@')) {
                  //     return 'Invalid email!';
                  //   }
                  //   return null;
                  // },
                  onSaved: (value) {
                    _regData['name'] = value;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['email'] = value;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Designation',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    _regData['designation'] = value;
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Gender'),
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                      },
                    );
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Mobile no.',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _regData['phone'] = value as String;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _regData['password'] = value as String;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  child: const Text('REGISTER'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
