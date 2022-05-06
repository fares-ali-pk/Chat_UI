import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late ScrollController _scrollController;
  int _selectIndex = 0;
  final List<String> _categories = ['Messages', 'OnLine', 'Groups', 'Requests'];

@override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                _selectIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 30.0),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: (_selectIndex == index) ? Colors.white : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  letterSpacing: 1.2
                ),
              ),
            ),
          );
        },
        itemCount: _categories.length,
        controller: _scrollController,
      ),
    );
  }
}
