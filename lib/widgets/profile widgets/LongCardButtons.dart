import 'package:flutter/material.dart';

class LongCardButtons extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  LongCardButtons({
    this.icon,
    this.label,
    this.iconColor,
  });
  @override
  _LongCardButtonsState createState() => _LongCardButtonsState();
}

class _LongCardButtonsState extends State<LongCardButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  widget.icon,
                  color: widget.iconColor,
                  size: 35,
                ),
                Text(
                  '  ${widget.label}',
                  style: TextStyle(
                    fontFamily: 'font',
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black.withOpacity(0.3),
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}
