import 'package:flutter/material.dart';

class LeaderBoardTile extends StatelessWidget {
  final int index;
  final String name;
  final String photo;
  final int views;
  LeaderBoardTile({
    this.index,
    this.name,
    this.photo,
    this.views,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        20,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  '${index}',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photo),
                    ),
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 17,
                  color: Colors.orange,
                ),
                Text(
                  '$views',
                  style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
