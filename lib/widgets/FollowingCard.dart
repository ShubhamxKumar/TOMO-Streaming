import 'package:flutter/material.dart';

class FollowingCard extends StatelessWidget {
  final String name;
  final String id;
  FollowingCard({
    this.name,
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                        fontFamily: 'fontbold',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'ID : $id',
                      style: TextStyle(
                        fontFamily: 'font',
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
