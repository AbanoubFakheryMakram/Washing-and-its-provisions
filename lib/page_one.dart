import 'package:dead/details_page.dart';
import 'package:dead/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.fill,
              width: size.width,
              height: size.height,
            ),
            Container(
              width: size.width * .6,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),

                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/decor.png',
                        fit: BoxFit.fill,
                        width: size.width * .65,
                        height: ScreenUtil().setHeight(65),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(65),
                        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
                        width: size.width * .5,
                        child: FlatButton(
                          child: RichText(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: data1[index].keys.first,
                                  style: TextStyle(
                                    color: Color(0xffF5BF04),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailsPage(
                                  details: data1[index].values.first,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                addAutomaticKeepAlives: true,
                itemCount: data1.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
