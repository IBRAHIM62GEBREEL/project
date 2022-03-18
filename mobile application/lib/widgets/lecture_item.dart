import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

class LectureItem extends StatelessWidget {
  String name;
  String id;
  LectureItem({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(LectureVideo.routeName, arguments: id);
      },
      child: ListTile(
        title: Text(utf8.decode(name.runes.toList())),
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/shoe2.jpg'),
        ),
        trailing: SizedBox(
          width: 120,
          child: IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {},
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
