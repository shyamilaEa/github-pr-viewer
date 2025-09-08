import 'package:flutter/material.dart';
import '../services/token_service.dart';
import 'pr_list_screen.dart';

class LoginScreen extends StatelessWidget {
  final TokenService _tokenService = TokenService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF24292E), Color(0xFF444C56)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.code,
              size: 90,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              "GitHub PR Viewer",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
              ),
              icon: const Icon(Icons.login),
              label: const Text(
                "Login with GitHub",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                const token = "abc123";
                await _tokenService.saveToken(token);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("✅ Token saved successfully!")),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PRListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
