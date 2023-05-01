// ignore: must_be_immutable
import 'package:flutter/services.dart';

import '../../../app/imports.dart';
import '../../widgets/resuable_row.dart';

// ignore: must_be_immutable
class RecipeDetailsScreen extends StatefulWidget {
  RecipeDetailsScreen({
    super.key,
    required this.recipe,
    required this.ingredients,
  });
  // ignore: prefer_typing_uninitialized_variables
  var recipe;
  List<dynamic> ingredients;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          widget.recipe['label'],
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.light),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.010,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        child: Image.network(
                          widget.recipe['image'],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.050,
                  ),
                  child: Text(
                    widget.recipe['label'],
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.016,
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.050),
                  child: Row(
                    children: [
                      Text(
                        'Calories',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Chip(
                        label: Text(
                          getCalories(widget.recipe['calories']),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.016,
                ),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/icon_bookmark.svg',
                      //color: Colors.white,
                    ),
                    label: Text(
                      'Bookmark',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.ingredients.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Card(
                          elevation: 10.0,
                          color: Colors.grey[30],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ExpansionTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  child: Image.network(
                                    widget.ingredients[index]['image']
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              backgroundColor: Colors.green,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              expandedAlignment: Alignment.topLeft,
                              childrenPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              title: Text(
                                widget.ingredients[index]['food'],
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              children: [
                                reusableRow(
                                  context,
                                  'Measure:',
                                  widget.ingredients[index]['measure'],
                                ),
                                reusableRow(
                                  context,
                                  'Quantity: ',
                                  widget.ingredients[index]['quantity']
                                      .toString(),
                                ),
                                reusableRow(
                                  context,
                                  'Food Quantity: ',
                                  widget.ingredients[index]['foodCategory']
                                      .toString(),
                                ),
                                reusableRow(
                                  context,
                                  'Weight: ',
                                  widget.ingredients[index]['foodCategory']
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
