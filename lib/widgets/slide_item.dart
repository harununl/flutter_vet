import 'package:flutter/material.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:  [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Container(
              width: 380,
              height: 300,

              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(image: AssetImage(slideList[index].imageUrl),
                      fit: BoxFit.fill)


              ),
            ),
            SizedBox(height: 27,),
            Text(
              slideList[index].title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24
              ),
            ),
            Text(
              slideList[index].description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20
              ),
            )
          ],
        )
      ],
    );
    throw UnimplementedError();
  }

}