import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Home/Table/Helpers/custom_meal_card.dart';

class MainSection extends StatelessWidget {
  final Function visibleTopSection;

  const MainSection({Key key, this.visibleTopSection}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScrollController _controller = ScrollController();
    _controller.addListener((){
      if (_controller.offset >= 50 &&
          !_controller.position.outOfRange) {
        visibleTopSection(false);
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        visibleTopSection(true);
      }
    });

    return GestureDetector(
      child: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            7,
            (index) {
              return CustomCard(
                imagePath: 'assets/images/meals/${index + 1}.jpg',
                imageName: 'Daily Meal ${index + 1}',
              );
            },
          ),
          controller: _controller,
        ),
      ),
    );
  }
}
