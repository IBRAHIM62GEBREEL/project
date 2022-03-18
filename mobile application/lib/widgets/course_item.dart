import 'package:e_learning/screens/course_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

class CourseItem extends StatelessWidget {
  final int id;
  final String name;
  final String imgUrl;

  const CourseItem(
      {Key? key, required this.id, required this.name, required this.imgUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const baseUrl = 'http://3.127.31.67';

    print(baseUrl + imgUrl);

    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CourseDetails.routeName, arguments: id);
        },
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              child: Image.network('$baseUrl$imgUrl'),
              // character.image.isNotEmpty
              //     ? FadeInImage.assetNetwork(
              //         width: double.infinity,
              //         height: double.infinity,
              //         placeholder: 'assets/images/loading.gif',
              //         image: character.image,
              //         fit: BoxFit.cover,
              //       )
              //     : Image.asset('assets/images/placeholder.jpg'),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                utf8.decode(name.runes.toList()),
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
