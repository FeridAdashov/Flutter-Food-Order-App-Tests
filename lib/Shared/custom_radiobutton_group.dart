import 'package:flutter/material.dart';

class CustomRadioButtonGroup extends StatelessWidget {
  final Function toggleFunction;
  final Color backColor;
  final Color borderColor;
  final Color selectedButtonColor;
  final Color selectedButtonTextColor;
  final double borderWidth;
  final double radius;
  final double height;
  final bool isFirstSelected;

  const CustomRadioButtonGroup(
      {Key key,
      this.backColor = Colors.white,
      this.borderColor = Colors.black,
      this.selectedButtonColor = Colors.black45,
      this.height = 50,
      this.borderWidth = 1,
      this.radius = 25,
      this.selectedButtonTextColor = Colors.white,
      this.isFirstSelected,
      this.toggleFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: backColor,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => toggleFunction(true),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isFirstSelected ? selectedButtonColor : backColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  color: isFirstSelected ? selectedButtonColor : backColor,
                ),
                child: Center(
                  child: Text('MASA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: isFirstSelected
                              ? selectedButtonTextColor
                              : Colors.black45,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => toggleFunction(false),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: !isFirstSelected ? selectedButtonColor : backColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius - 2)),
                  color: !isFirstSelected ? selectedButtonColor : backColor,
                ),
                child: Center(
                  child: Text('İDARƏEDİCİ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: !isFirstSelected
                              ? selectedButtonTextColor
                              : Colors.black45,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
