import '../../../app/imports.dart';

class BookMarksView extends StatefulWidget {
  const BookMarksView({super.key});

  @override
  State<BookMarksView> createState() => _BookMarksViewState();
}

class _BookMarksViewState extends State<BookMarksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'BookMarks',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('BookMarks Screen'),
      ),
    );
  }
}
