import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Add gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9CB2E4).withOpacity(0.6),
              Color(0xFF9CB2E4).withOpacity(0.1), // Lighter variation of the same color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IBMPlexMono',
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      //backgroundImage: AssetImage('assets/twitter-logo.jpg'),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      //backgroundImage: AssetImage('assets/facebook-logo.jpg'),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      //backgroundImage: AssetImage('assets/google-logo.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      fontFamily: 'IBMPlexMono',
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      fontFamily: 'IBMPlexMono',
                    ),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey, // Set the color to grey
                      ),
                      onPressed: _togglePasswordView,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to HomePage on sign in
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white for contrast
                      fontFamily: 'IBMPlexMono',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9575CD).withOpacity(0.70), // Set button color with 70% opacity
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New here?', style: TextStyle(fontFamily: 'IBMPlexMono', color: Colors.black54),),
                    TextButton(
                      onPressed: () {
                        // Handle create account action
                      },
                      child: Text('Create a new account', style: TextStyle(fontFamily: 'IBMPlexMono', color: Colors.black54),),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Handle forgot password action
                  },
                  child: Text('Forgot your password?', style: TextStyle(fontFamily: 'IBMPlexMono', color: Colors.black54),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
