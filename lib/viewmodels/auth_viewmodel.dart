import 'package:flutter/foundation.dart';
import '../services/token_service.dart';

class AuthViewModel extends ChangeNotifier {
  final TokenService _tokenService = TokenService();
  String? _token;

  String? get token => _token;

  Future<void> login(String token) async {
    await _tokenService.saveToken(token);
    _token = await _tokenService.getToken();
    notifyListeners();
  }


  Future<void> logout() async {
    await _tokenService.clearToken();
    _token = null;
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _tokenService.getToken();
    notifyListeners();
  }
}
