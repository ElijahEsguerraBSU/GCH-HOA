import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _srCodeController = TextEditingController(text: 'HO-');
  final _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode(); // For field focus control
  bool _obscurePassword = true;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 500 ? double.infinity : 400,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    'assets/logo.png',
                    height: 250,
                  ),
                  const SizedBox(height: 30),

                  // HO-Code Field
                  TextFormField(
                    controller: _srCodeController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    autofillHints: const <String>[],
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'HO-Code',
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'HO-Code is required';
                      }
                      final hoCodeRegex = RegExp(r'^HO-\d{5}$');
                      if (!hoCodeRegex.hasMatch(value)) {
                        return 'Invalid format. Use HO-12345';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) => _handleLogin(),
                    autofillHints: const <String>[],
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 5) {
                        return 'Password must be at least 5 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text("Login"),
                  ),

                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register'),
                    child: const Text("Don't have an account? Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
