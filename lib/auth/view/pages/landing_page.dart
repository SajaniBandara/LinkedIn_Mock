import 'package:flutter/material.dart';
import 'package:ilabs/auth/view/pages/signin_page.dart';
import 'signup_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Image.asset(
                'assets/images/linkedin_logo.png',
                height: screenHeight * 0.08,
                width: screenWidth * 0.5,
              ),
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                'assets/images/landing_image.png',
                height: screenHeight * 0.3,
                width: screenWidth * 0.8,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Color(0xFF0A66C2)),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Land your Job',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Connect, Apply and Get Hired with your\nfavorite job around the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: screenHeight * 0.018,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: screenHeight * 0.005,
                      backgroundColor: Colors.grey[400]),
                  SizedBox(width: screenWidth * 0.02),
                  CircleAvatar(
                      radius: screenHeight * 0.005,
                      backgroundColor: Colors.grey[300]),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Color(0xFF0A66C2)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignUpPage()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF0A66C2),
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A66C2),
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SigninPage()),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
