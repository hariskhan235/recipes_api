import 'package:recipes_api/presentation/widgets/medium_text.dart';
import 'package:recipes_api/presentation/widgets/small_text.dart';

import '../../../app/imports.dart';
import '../../widgets/image_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const String prefSearchKey = 'previousSearches';
  late TextEditingController recipeSearchController;
  final ScrollController _scrollController = ScrollController();
  bool enabled = true;
  List<dynamic> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];

  @override
  void initState() {
    getPreviousSearches();
    recipeSearchController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final trigerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > trigerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    recipeSearchController.dispose();
  }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      final searches = prefs.getStringList(prefSearchKey);
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  getPreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      final searches = prefs.getStringList(prefSearchKey);
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: recipeSearchController,
                        onFieldSubmitted: (value) {
                          BlocProvider.of<RecipeCubit>(context).getRecipes(
                              recipeSearchController.text
                                  .toString()
                                  .toLowerCase()
                                  .trim(),
                              currentStartPosition,
                              currentEndPosition);
                        },
                        cursorColor: Colors.blue,
                        cursorWidth: 5.0,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search Recipes',
                          hintStyle: Theme.of(context).textTheme.displayMedium,
                          border: OutlineInputBorder(
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .outlineBorder!,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .outlineBorder!,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .outlineBorder!,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .outlineBorder!,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .outlineBorder!,
                          ),
                          // suffixIcon: PopupMenuButton<String>(
                          //   icon: Icon(
                          //     Icons.arrow_drop_down,
                          //     color: Colors.grey[100],
                          //   ),
                          //   onSelected: (String value) {
                          //     recipeSearchController.text = value;
                          //     startSearch(recipeSearchController.text);
                          //   },
                          //   itemBuilder: (context) {
                          //     return previousSearches
                          //         .map<CustomDropdownMenuItem<String>>(
                          //             (String value) {
                          //       return CustomDropdownMenuItem<String>(
                          //         text: value,
                          //         value: value,
                          //         callback: () {
                          //           setState(() {
                          //             previousSearches.remove(value);
                          //             savePreviousSearches();
                          //             Navigator.pop(context);
                          //           });
                          //         },
                          //       );
                          //     }).toList();
                          //   },
                          // ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    style: Theme.of(context).iconButtonTheme.style,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      // context.read<RecipeCubit>().getRecipes(
                      //     recipeSearchController.text
                      //         .toString()
                      //         .toLowerCase()
                      //         .trim(),
                      //     currentStartPosition,
                      //     currentEndPosition);
                      print('Height ${mq.height}, Width ${mq.width}');
                      //print(mq.width);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
              BlocConsumer<RecipeCubit, RecipeState>(
                listener: (context, state) {
                  if (state is RecipeError) {
                    AppUtils.showSnackBar(context, state.message);
                  }
                  // if (state is RecipeLoaded) {
                  //   AppUtils.showSnackBar(
                  //     context,
                  //     state.recipes.length.toString(),
                  //   );
                  // }
                },
                builder: (context, state) {
                  if (state is RecipeLoading) {
                    return LoadingWidget(
                      enabled: enabled,
                    );
                  }
                  if (state is RecipeLoaded) {
                    if (recipeSearchController.text.toString().isEmpty ||
                        recipeSearchController.text.toString().length < 3) {
                      return const Center(
                        child: Text('No Recipe found search again...'),
                      );
                    } else {
                      return Flexible(
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (size.width / 2 / 310),
                          ),
                          itemCount: state.recipes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetailsScreen(
                                      recipe: state.recipes['hits'][index]
                                          ['recipe'],
                                      ingredients: state.recipes['hits'][index]
                                          ['recipe']['ingredients'],
                                    ),
                                  ),
                                );
                              },
                              child: RecipeCard(
                                  size: size, state: state, index: index),
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  RecipeCard({
    super.key,
    required this.size,
    required this.state,
    required this.index,
  });

  final Size size;
  RecipeLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            imageWidget(state, index),
            SizedBox(
              height: size.height * 0.012,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SmallText(
                text: state.recipes['hits'][index]['recipe']['label'],
              ),
            ),
            SizedBox(
              height: size.height * 0.004,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: mediumText(
                context,
                getCalories(
                  state.recipes['hits'][index]['recipe']['calories'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
