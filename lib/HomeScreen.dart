// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'CardData.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeff1f5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFeff1f5),
        toolbarHeight: 90,
        //titleSpacing: 10,
        elevation: 0.0,
        title: const Text(
          'My Activity',
          style: TextStyle(
            color: Color(0xFF262e5b),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: ImageIcon(
              AssetImage('assets/four-square-icon.png'),
              color: Color(0xFF262e5b),
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(6.0),
        child: Column(
          children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: _buildCard(
                    context,
                    "Calories",
                    345,
                    Icons.fastfood,
                    "Kcal",
                    2415,
                    "10,350",
                    "124,200",
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: _buildCard(
                    context,
                    "Sleep",
                    85,
                    Icons.dark_mode_outlined,
                    "Score",
                    595,
                    "17,850",
                    "214,200",
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: _buildCard(
                    context,
                    "Walk",
                    2227,
                    Icons.directions_walk,
                    "Steps",
                    "15,589",
                    "467,670",
                    "5,612,040",
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: _buildCard(
                    context,
                    "Water",
                    1.2,
                    Icons.water_drop_outlined,
                    "Litres",
                    8.4,
                    252,
                    "3,024",
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: _buildCard(
                    context,
                    "Heart",
                    72,
                    Icons.favorite_border,
                    "Score",
                    72,
                    72,
                    72,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 3,
                  child: _buildCard(
                    context,
                    "Training",
                    0,
                    Icons.timer_outlined,
                    "Min",
                    15,
                    90,
                    5500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Color(0xFFe7e9ef),
                    //textColor: Colors.white,
                    child: Icon(
                      Icons.watch,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    //textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Color(0xFFe7e9ef),
                    //textColor: Colors.white,
                    child: ImageIcon(
                      AssetImage("assets/gym.png"),
                      size: 24,
                    ),

                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCard(
    BuildContext context,
    String title,
    dynamic dailyvalue,
    IconData icon,
    String subtext,
    dynamic weeklyValue,
    dynamic monthlyValue,
    dynamic yearlyValue) {
  Color? bgColor = Colors.white;
  Color? gColor;
  if (title == 'Calories') {
    gColor = Colors.white;
  }
  Widget percentIndicator;
  if (title == 'Calories') {
    bool color = true;
    //Color? gColor = Colors.white;
    bgColor = Color(0xFFe262e5b);
    percentIndicator = CircularPercentIndicator(
      //fillColor: Colors.red,
      //curve: Curves.,
      reverse: true,
      radius: 40.0,
      lineWidth: 7.0,
      percent: 0.25,
      animation: true,
      center: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${dailyvalue} \n',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: subtext,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      progressColor: Color(0xFFeff1c92),
      //arcBackgroundColor: Colors.red,
    );
  } else if (title == 'Walk') {
    percentIndicator = CircularPercentIndicator(
      startAngle: 180,
      reverse: false,
      radius: 40.0,
      lineWidth: 7.0,
      percent: 0.4,
      center: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${dailyvalue} \n',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: subtext,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      progressColor: Color(0xFFeff6f62),
    );
  } else {
    percentIndicator = const SizedBox(
      width: 0,
    );
  }

  Widget Sleep;
  if (title == 'Sleep') {
    Sleep = Column(
      children: [
        Row(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${dailyvalue} \n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: subtext,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 60.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 20.0,
            )
          ],
        ),
      ],
    );
  } else {
    Sleep = const SizedBox(
      width: 0,
    );
  }

  Widget Water;
  if (title == 'Water') {
    Water = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          './assets/water.jpg',
        ),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${dailyvalue} \n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: subtext,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  } else {
    Water = const SizedBox(
      width: 0,
    );
  }

  Widget Heart;
  if (title == 'Heart') {
    Heart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          './assets/heartbeat13.png',
        ),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${dailyvalue} \n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: subtext,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  } else {
    Heart = const SizedBox(
      width: 0,
    );
  }

  Widget Training;
  if (title == 'Training') {
    Training = Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${dailyvalue} \n',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: subtext,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } else {
    Training = SizedBox(
      width: 0,
    );
  }
  //Color? bgColor =  ? Colors.blue : Colors.indigo[700];

  return Expanded(
    child: InkWell(
      hoverColor: Color(0xFF262e5b),
      child: Container(
        //color: Colors.amber,
        //width: 10,
        child: Card(
          color: bgColor,
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
                    Icon(
                      icon,
                      color: gColor,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                //SizedBox(width: 30.0,),
                Center(child: percentIndicator),
                Sleep,
                Training,
                Heart,
                Water,
                //Heart,
                //Text(value),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.popAndPushNamed(
          context,
          '/activitydetail',
          arguments: {
            'title': title,
            'value': dailyvalue,
            'icon': icon,
            'subtext': subtext,
            'weeklyvalue': weeklyValue,
            'monthlyvalue': monthlyValue,
            'yearlyvalue': yearlyValue,
          },
        );
      },
    ),
  );
}
//String title, String value, IconData icon
