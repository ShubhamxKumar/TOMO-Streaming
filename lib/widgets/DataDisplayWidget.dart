import 'package:flutter/material.dart';

class DataDisplayWidget extends StatelessWidget {
  final String label;
  final value;
  final IconData icon;
  final Color color;
  DataDisplayWidget({
    this.label,
    this.value,
    this.icon,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 35,
                ),
                Text(
                  '  $label',
                  style: TextStyle(
                    fontFamily: 'fontbold',
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontFamily: 'font',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
