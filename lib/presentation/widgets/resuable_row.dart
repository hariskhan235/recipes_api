import 'package:recipes_api/presentation/widgets/small_text.dart';

import '../../app/imports.dart';

Widget reusableRow(BuildContext context, String title, String value) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SmallText(
          text: title,
        ),
      ),
      Flexible(
        child: SmallText(
          text: value,
        ),
      ),
    ],
  );
}
