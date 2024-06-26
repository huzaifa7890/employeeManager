import 'package:employeemanager/constant/navigation_service.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/feature/auth/screens/login_screen.dart';
import 'package:employeemanager/feature/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router;
  AppRouter() {
    router = GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: AppRoutes.mainScreen,
      routes: [
        GoRoute(
          path: AppRoutes.mainScreen,
          builder: (context, state) {
            final firebaseuser = FirebaseAuth.instance;
            final isLoggedIn = firebaseuser.currentUser != null;
            return isLoggedIn ? const HomeScreen() : const LoginScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.loginScreen,
          builder: ((context, state) => const LoginScreen()),
        ),
        GoRoute(
          path: AppRoutes.homeScreen,
          builder: ((context, state) => const HomeScreen()),
        ),
      ],
    );
  }
}
