abstract class AuthState {
  const AuthState();
}

/// الحالة الابتدائية
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// أثناء تنفيذ أي عملية (Login / Register / Logout / Reset Password)
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// نجاح العملية
class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess({this.message = ""});
}

/// فشل العملية
class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);
}