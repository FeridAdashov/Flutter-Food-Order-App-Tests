import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage(
    this.onClose, {
    Key key,
    this.imagePath,
    this.imageName,
  }) : super(key: key);

  final void Function({String returnValue}) onClose;
  final String imagePath, imageName;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    int _initialDragTimeStamp;
    int _currentDragTimeStamp;
    int _timeDelta;
    double _initialPositionY;
    double _currentPositionY;
    double _positionYDelta;

    void _startVerticalDrag(details) {
      _initialDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
     _initialPositionY = details.globalPosition.dy;
    }

    void _whileVerticalDrag(details) {
      _currentDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
      _currentPositionY = details.globalPosition.dy;

      _timeDelta = _currentDragTimeStamp - _initialDragTimeStamp;
      _positionYDelta = _currentPositionY - _initialPositionY;

      if (_timeDelta < 200 && _positionYDelta > 120) Navigator.pop(context);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: (details) => _startVerticalDrag(details),
      onVerticalDragUpdate: (details) => _whileVerticalDrag(details),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.35,
              width: width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FittedBox(
                    child: Image.asset(imagePath),
                    fit: BoxFit.fill,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF65AE00)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: height * 0.50,
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(imageName,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Spacer(),
                      Icon(Icons.access_time_sharp, color: Color(0xFF65AE00)),
                      SizedBox(width: 5),
                      Text('20 min',
                          style: TextStyle(color: Color(0xFF65AE00))),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('20.00 AZN',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  SizedBox(height: 25),
                  Text(
                      'Hayvansal gıda içermeyen (Mozeralla içermeyen) veganlara özel yaptığımız, Taze Domates,Taze Mantar, Soğan,Yeşil Biber,Siyah Zeytin ve Mısır\'dan oluşan Vegan Pizzamız.',
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          wordSpacing: 2)),
                ],
              ),
            ),
            Container(
              height: height * 0.15,
              padding: EdgeInsets.all(30),
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  primary: Color(0xFF65AE00),
                ),
                onPressed: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_basket_outlined, color: Colors.white),
                    SizedBox(width: 15),
                    Text('SƏBƏTƏ ƏLAVƏ ET',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
