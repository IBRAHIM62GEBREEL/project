import 'dart:convert';

import 'package:e_learning/screens/course_details.dart';
import 'package:flutter/material.dart';

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
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CourseDetails.routeName, arguments: id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // gradient: const LinearGradient(
            //   colors: [
            //     Color(0xffFF2CDF),
            //     Color(0xff00E5FF),
            //   ],
            // ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage('$baseUrl$imgUrl'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  utf8.decode(name.runes.toList()),
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        // child: Container(
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.2,
        //         child: ClipRRect(
        //           borderRadius: const BorderRadius.only(
        //               topLeft: Radius.circular(20),
        //               topRight: Radius.circular(20)),

        //           child: Image.network('$baseUrl$imgUrl'),
        //           // character.image.isNotEmpty
        //           //     ? FadeInImage.assetNetwork(
        //           //         width: double.infinity,
        //           //         height: double.infinity,
        //           //         placeholder: 'assets/images/loading.gif',
        //           //         image: character.image,
        //           //         fit: BoxFit.cover,
        //           //       )
        //           //     : Image.asset('assets/images/placeholder.jpg'),
        //         ),
        //       ),
        //       Container(
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5),
        //           color: Colors.black54,
        //         ),
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //         alignment: Alignment.bottomCenter,
        //         child: Text(
        //           utf8.decode(name.runes.toList()),
        //           style: const TextStyle(
        //             height: 1.3,
        //             fontSize: 16,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //           overflow: TextOverflow.ellipsis,
        //           maxLines: 1,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
