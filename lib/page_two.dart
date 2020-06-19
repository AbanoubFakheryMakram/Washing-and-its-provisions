import 'package:dead/details_page.dart';
import 'package:dead/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            width: size.width * .5,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/decor.png',
                      fit: BoxFit.fill,
                      width: size.width * .5,
                      height: ScreenUtil().setHeight(95),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(95),
                      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
                      width: size.width * .42,
                      child: FlatButton(
                        child: RichText(
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: data2[index].keys.first,
                                style: TextStyle(
                                  color: Color(0xffF5BF04),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                details: data2[index].values.first,
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
              itemCount: data2.length,
            ),
          ),
        ],
      ),
    );
  }
}
