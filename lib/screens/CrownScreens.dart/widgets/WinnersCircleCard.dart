import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WinnersCircleCard extends StatelessWidget {
  final int pos;
  final String name;
  final int views;
  final String photo;
  WinnersCircleCard({
    this.name,
    this.photo,
    this.pos,
    this.views,
  });

  final List<Color> _colors = [
    Colors.yellow,
    Colors.white,
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          FaIcon(
            FontAwesomeIcons.crown,
            size: 28,
            color: _colors[pos - 1],
          ),
          Container(
            width: pos != 1 ? 100 : 140,
            height: pos != 1 ? 100 : 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(photo),
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: _colors[pos - 1],
                width: 3,
              ),
            ),
          ),
          Text(
            '$name',
            style: TextStyle(
              fontFamily: 'font',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '$views',
                style: TextStyle(
                  fontFamily: 'font',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
