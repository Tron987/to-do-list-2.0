import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_list/screens/HomePage.dart';
import 'package:to_do_list/screens/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  StreamSubscription<AuthState>? _authStateSubscription;
  bool _isSigningIn = false;

  @override
  void initState() {
    super.initState();
    // Listen for authentication state changes
    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null && session.user != null && _isSigningIn) {
        // User signed in successfully
        _isSigningIn = false;  // Reset the flag
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _authStateSubscription?.cancel();
    super.dispose();
  }

  Future<void> signIn(BuildContext context) async {
    final email = emailController.text.trim();
    final password = emailController.text.trim();
    final supabase = Supabase.instance.client;

    setState(() {
      _isSigningIn = true;
    });

    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // User signed in successfully
        _isSigningIn = false;  // Reset the flag
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on AuthApiException catch (e) {
      setState(() {
        _isSigningIn = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final supabase = Supabase.instance.client;

    setState(() {
      _isSigningIn = true;
    });

    try {
      await supabase.auth.signInWithOAuth(OAuthProvider.google);
      // The actual navigation to HomePage is handled in the auth state change listener
    } on AuthException catch (e) {
      setState(() {
        _isSigningIn = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => signIn(context),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => signInWithGoogle(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/google.png', height: 24.0),
                  SizedBox(width: 12),
                  Text('Sign in with Google'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
