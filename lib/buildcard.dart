import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget _buildCard(
    BuildContext context, String title, String value, IconData icon,String subtext) {

  Widget percentIndicator;
  if (title == 'Calories') {
    percentIndicator = CircularPercentIndicator(
      radius: 35.0,
      lineWidth: 5.0,
      percent: 0.7,
      animation: true,
      center: Text(value),
      progressColor: Colors.green,
    );
  } else if (title == 'Walk') {
    percentIndicator = CircularPercentIndicator(
      radius: 35.0,
      lineWidth: 5.0,
      percent: 0.7,
      center: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      progressColor: Colors.green,
    );
  } else {
    percentIndicator = const SizedBox(
      width: 0,
    );
  }

  Widget Sleep;
  if (title == 'Sleep') {
    Sleep = Container(
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          Icon(
            Icons.circle_rounded,
            size: 20.0,
          )
        ],
      ),
    );
  } else {
    Sleep = const SizedBox(
      width: 0,
    );
  }

  Widget Water;
  if (title == 'Water') {
    Water = Container(
      child: Column(children: <Widget>[]),
    );
  }

  Widget Heart;
  if (title == 'Heart') {
    Heart = Column(children: <Widget>[
      const Image(
        image: AssetImage(
          'asset/heartbeat.png',
        ),
        fit: BoxFit.fitWidth,
      ),
    ]);
  } else {
    Heart = const SizedBox(
      width: 0,
    );
  }

  return Expanded(
    child: InkWell(
      hoverColor: Color(0xFF262e5b),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              //SizedBox(width: 30.0,),
              Center(child: percentIndicator),
              Sleep,
              //Heart,
              //Text(value),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/activitydetail',
        arguments: {
          'title': title,
          'value': value,
          'icon': icon,
        });
      },
    ),
  );
}