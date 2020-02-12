import 'package:flushbar/flushbar.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class CustomSnackbar {
  static error(context, {String message}) {
    Flushbar(
      backgroundColor: AppColors.danger,
      message: message,
      animationDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
    ).show(context);
  }
}
