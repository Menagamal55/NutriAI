import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  final AuthService _authService = AuthService();

  // ================= Register =================
  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    try {
      await _authService.register(
        email: email,
        password: password,
      );

      emit(const AuthSuccess(
        message: "Account created successfully",
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseError(e.code)));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  // ================= Login =================
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    try {
      await _authService.login(
        email: email,
        password: password,
      );

      emit(const AuthSuccess(
        message: "Login successful",
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseError(e.code)));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  // ================= Forgot Password =================
  Future<void> resetPassword({
    required String email,
  }) async {
    emit(const AuthLoading());

    try {
      await _authService.resetPassword(email: email);

      emit(const AuthSuccess(
        message: "Password reset email sent",
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseError(e.code)));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  // ================= Logout =================
  Future<void> logout() async {
    emit(const AuthLoading());

    try {
      await _authService.logout();

      emit(const AuthSuccess(
        message: "Logged out successfully",
      ));
    } catch (_) {
      emit(const AuthFailure("Logout failed"));
    }
  }

  // ================= Firebase Errors =================
  String _getFirebaseError(String code) {
    switch (code) {
      case "email-already-in-use":
        return "This email is already in use.";

      case "weak-password":
        return "Password is too weak.";

      case "invalid-email":
        return "Invalid email address.";

      case "user-not-found":
        return "No user found with this email.";

      case "wrong-password":
        return "Incorrect password.";

      case "invalid-credential":
        return "Invalid email or password.";

      case "too-many-requests":
        return "Too many attempts. Please try again later.";

      case "network-request-failed":
        return "Check your internet connection.";

      default:
        return "Authentication failed.";
    }
  }
}