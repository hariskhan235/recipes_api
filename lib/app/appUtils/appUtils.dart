import '../imports.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
        ),
      ),
    );
  }
}
