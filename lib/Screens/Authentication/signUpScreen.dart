import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assignment/Controllers/authController.dart';
import 'package:news_assignment/Theme/theme.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('MyNews',
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: SystemTheme.primary)),
            const Spacer(),
            Form(
                child: TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: SystemTheme.secondary,
                filled: true,
                labelText: "Full Name",
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Form(
                child: TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: SystemTheme.secondary,
                filled: true,
                labelText: "Email",
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Form(
                child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: SystemTheme.secondary,
                filled: true,
                labelText: "Password",
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  authController.signUpController(_emailController.text,
                      _passwordController.text, _nameController.text, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: SystemTheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Sign Up',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: SystemTheme.secondary)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: SystemTheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
