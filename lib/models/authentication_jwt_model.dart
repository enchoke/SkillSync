import 'package:equatable/equatable.dart';

enum UserRole { user, admin, superAdmin }

class AuthenticationTokenModel extends Equatable {
  final UserRole role;
  final String userName;
  final DateTime expirationTime;
  final String jwtToken;

  const AuthenticationTokenModel({this.role = UserRole.user, required this.userName, required this.expirationTime, required this.jwtToken});

  @override
  List<Object?> get props => [role, userName, expirationTime, jwtToken];

  AuthenticationTokenModel copyWith({UserRole? role, String? userName, DateTime? expirationTime, String? jwtToken}) {
    return AuthenticationTokenModel(role: role ?? this.role, userName: userName ?? this.userName, expirationTime: expirationTime ?? this.expirationTime, jwtToken: jwtToken ?? this.jwtToken);
  }

  factory AuthenticationTokenModel.fromMap(Map<String, dynamic> map, String jwt) {
    var expirationSeconds = map['exp'];
    DateTime expirationTime = expirationSeconds != null ? DateTime.fromMillisecondsSinceEpoch(expirationSeconds * 1000) : DateTime.now();
    String? roleString = map['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'] as String?;
    UserRole role = _getUserRoleFromString(roleString);
    String userName = map['sub'] as String? ?? '';
    return AuthenticationTokenModel(role: role, userName: userName, expirationTime: expirationTime, jwtToken: jwt);
  }
}

UserRole _getUserRoleFromString(String? roleString) {
  if (roleString == null) {
    return UserRole.user;
  }

  switch (roleString.toLowerCase()) {
    case 'user':
      return UserRole.user;
    case 'admin':
      return UserRole.admin;
    case 'superadmin':
      return UserRole.superAdmin;
    default:
      return UserRole.user;
  }
}
