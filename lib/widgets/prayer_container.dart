import 'package:flutter/material.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  final String prayerTime;
  final String prayerName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xb30c0c0c),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2),
      ),
      child: Row(
        children: [
          Icon(Icons.alarm_rounded, size: 40, color: Colors.white),
          SizedBox(width: 15),
          Text(
            prayerName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          SizedBox(width: 80),
          Text(
            prayerTime,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
