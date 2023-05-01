import '../../app/imports.dart';

Widget mediumText(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.displaySmall,
  );
}
