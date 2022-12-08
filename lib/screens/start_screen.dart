import 'package:flutter/material.dart';
import '../model/slide.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_item.dart';
import 'dart:async';
class StartScreen extends StatefulWidget{


  @override
  State<StartScreen> createState()=>_StartScreenState();
}



class _StartScreenState extends State<StartScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
      initialPage: 0
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {

      if (_currentPage < 2) {
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFfff2e6),
          child: Padding(
            padding: const EdgeInsets.all(52),
            child: Column(
              children: [ Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,


                  children:  [
                    PageView.builder(
                      itemBuilder: (ctx, i) => SlideItem(i),
                      itemCount: slideList.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,

                    ),
                    Stack(
                      children:  [
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              for (int i = 0 ; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                //Text('Düzenlenecek Bölge'
                //),

                SizedBox(height: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:  [ElevatedButton(


                    onPressed:() {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35),)// Background color
                    ),


                    child: Wrap(

                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        SizedBox(
                          width:20,
                          height: 50,

                          
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(2, 20, 35, 20),
                          child: Text("Get Started!", style:TextStyle(fontSize:29),),
                        ),



                      ],
                    ),
                  ),


                        //shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.circular(35),
                        //),





                  ],
                ),
              ],
            ),
          ),
        )

    );

    throw UnimplementedError();
  }
}
