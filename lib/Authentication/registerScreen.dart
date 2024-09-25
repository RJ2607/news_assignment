import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assignment/theme/theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('MyNews',
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: SystemTheme.primary)),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Register'),
            ),
            Row(
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {},
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
