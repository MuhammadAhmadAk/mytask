// lib/repositories/auth_repository.dart
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<bool> login(String email) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users?email=$email'));
    return response.statusCode == 200 && response.body.contains(email);
  }

  Future<bool> signup(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      body: {'name': name, 'email': email, 'password': password},
    );
    return response.statusCode == 201;
  }

  Future<bool> verifyOtp(String otp) async {
    // Simulating OTP verification
    return otp == "1234"; // Replace with actual verification logic
  }
}
