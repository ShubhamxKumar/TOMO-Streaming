import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LiveUserTile extends StatefulWidget {
  final String photo;
  final String name;
  final int rank;
  final views;
  final Function onTap;
  final String id;
  final List fans;
  final List following;
  final List friends;
  LiveUserTile({
    this.name,
    this.photo,
    this.rank,
    this.views,
    this.onTap,
    this.fans,
    this.following,
    this.id,
    this.friends,
  });
  @override
  _LiveUserTileState createState() => _LiveUserTileState();
}

class _LiveUserTileState extends State<LiveUserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.photo),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.fire,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      ' ${widget.views}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  widget.onTap(
                    context,
                    widget.photo,
                    widget.name,
                    widget.rank,
                    widget.views,
                    widget.id,
                    widget.fans,
                    widget.following,
                    widget.friends,
                  );
                },
                child: Text(
                  '${widget.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'font',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lime,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    Text(
                      ' ${widget.rank}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
