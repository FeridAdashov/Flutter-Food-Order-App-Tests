import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Shared/Animations/fade_animation.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';
import 'package:flutter_restaurant_order/wrapper.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
              page: 1,
              image: 'assets/images/meals/1.jpg',
              title: 'First Title',
              description:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, , when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.'),
          makePage(
              page: 2,
              image: 'assets/images/meals/2.jpg',
              title: 'Second Title',
              description:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, , when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.'),
          makePage(
              page: 3,
              image: 'assets/images/meals/3.jpg',
              title: 'Third Title',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, , when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."),
          makePage(
              page: 4,
              image: 'assets/images/meals/4.jpg',
              title: 'Fourth Title',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, , when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."),
        ],
      ),
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(WRAPPER);
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    FadeAnimation(Text(
                      page.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                    Text(
                      '/' + totalPage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                        delay: 1.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              height: 1.9,
                              fontSize: 15),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        Text(
                          'READ MORE',
                          style: TextStyle(color: Colors.white),
                        ),
                        delay: 2.5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        child:
                            Text("Skip", style: TextStyle(color: Colors.white)),
                        onTap: () {
                          navigationPage();
                        }),
                    if (page == 4)
                      GestureDetector(
                          child: Text("Done",
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            navigationPage();
                          }),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
