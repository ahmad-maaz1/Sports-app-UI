import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'HomeScreen.dart';
import 'main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'datamodelforchart.dart';
import 'package:fl_chart/fl_chart.dart';
//import 'dart:html';
//import 'package:horizontal_center_date_picker/datepicker_controller.dart';
//import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
//import 'package:intl/intl_browser.dart';
//import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl_standalone.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({super.key});

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail>
    with SingleTickerProviderStateMixin {
  DateTime now = DateTime.now();
  var _selectedDate = DateTime.now();

  //String formattedDate = DateFormat.yMMMEd().format(now);
  //print(formattedDate);
  List<DateTime> datetime = [];
  Map data = {};
  late TabController _tabController;
  final List<DataModel> _listYearly = [
    DataModel(key: '0', value: '1000'),
    DataModel(key: '1', value: '1200'),
    DataModel(key: '2', value: '1300'),
    DataModel(key: '3', value: '1100'),
    DataModel(key: '4', value: '800'),
  ];
  
  final List<DataModel> _listMonthly = [
    DataModel(key: '0', value: '1000'),
    DataModel(key: '1', value: '1200'),
  ];
  final List<DataModel> _listWeekly = [
    DataModel(key: '0', value: '40'),
    DataModel(key: '1', value: '50'),
    DataModel(key: '2', value: '30'),
    DataModel(key: '3', value: '70'),
    DataModel(key: '4', value: '80'),
    DataModel(key: '5', value: '130'),
    DataModel(key: '6', value: '40'),
  ];
  final List<DataModel> _listDaily = [
    DataModel(key: '1', value: '40'),
    DataModel(key: '2', value: '0'),
    DataModel(key: '3', value: '0'),
    DataModel(key: '4', value: '0'),
    DataModel(key: '5', value: '0'),
    DataModel(key: '6', value: '0'),
    DataModel(key: '7', value: '40'),
    DataModel(key: '8', value: '10'),
    DataModel(key: '9', value: '20'),
    DataModel(key: '10', value: '10'),
    DataModel(key: '11', value: '100'),
    DataModel(key: '12', value: '70'),
    DataModel(key: '13', value: '30'),
    DataModel(key: '14', value: '40'),
    DataModel(key: '15', value: '20'),
    DataModel(key: '16', value: '10'),
    DataModel(key: '17', value: '70'),
    DataModel(key: '18', value: '120'),
    DataModel(key: '19', value: '60'),
    DataModel(key: '20', value: '30'),
    DataModel(key: '21', value: '20'),
    DataModel(key: '22', value: '10'),
    DataModel(key: '23', value: '0'),
    DataModel(key: '24', value: '0'),
  ];
  List<BarChartGroupData> _chartGroups() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _listDaily.length; i++) {
      list.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: double.parse(_listDaily[i].value!),
              color: Colors.white,
            ),
          ],
        ),
      );
    }
    return list;
  }

  List<BarChartGroupData> _chartGroupsWeekly() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _listWeekly.length; i++) {
      list.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: double.parse(_listWeekly[i].value!),
              color: Colors.white,
            ),
          ],
        ),
      );
    }
    return list;
  }

  List<BarChartGroupData> _chartGroupsMonthly() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _listMonthly.length; i++) {
      list.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: double.parse(_listMonthly[i].value!),
              color: Colors.white,
            ),
          ],
        ),
      );
    }
    return list;
  }
  List<BarChartGroupData> _chartGroupsYearly() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _listYearly.length; i++) {
      list.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: double.parse(_listYearly[i].value!),
              color: Colors.white,
            ),
          ],
        ),
      );
    }
    return list;
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    var Day = DateFormat('d').format(_selectedDate);
    var Month = DateFormat('MMM').format(_selectedDate);
    var prevMonth = DateTime.now().subtract(Duration(days: 30));
    var yesterdayDate = DateTime.now().subtract(Duration(days: 1));
    var DayYesterday = DateFormat('d').format(yesterdayDate);

    var daybeforeyesterday = DateTime.now().subtract(Duration(days: 2));
    var daybeforeyest = DateFormat('d').format(daybeforeyesterday);
    DateTime startDate = now.subtract(Duration(days: 14));
    DateTime endDate = now.add(Duration(days: 7));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        //titleSpacing: 10,
        elevation: 0.0,
        title: Text(
          data['title'],
          style: const TextStyle(
            color: Color(0xFF262e5b),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          color: Color(0xFF262e5b),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xFF262e5b),
                    offset: new Offset(3, 2),
                    blurRadius: 3.0,
                  ),
                ],
                color: Color(0xFF262e5b),
              ),
              indicatorColor: Color(0xFF262e5b),
              indicatorWeight: 2.0,
              //indicatorPadding: EdgeInsets.zero,
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      color: Color(0xFFe898989),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      color: Color(0xFFe898989),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Monthly',
                    style: TextStyle(
                      color: Color(0xFFe898989),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: const Text(
                    'Yearly',
                    style: TextStyle(
                      color: Color(0xFFe898989),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                //daily data
                Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        DailyDate(daybeforeyest, Month),
                        SizedBox(
                          width: 20,
                        ),
                        DailyDate(DayYesterday, Month),
                        SizedBox(
                          width: 20,
                        ),
                        DailyDate(Day, Month),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${data['value']}\n',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data['subtext'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ignore: sort_child_properties_last
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFF262e5b),
                            ),
                            height: 200,
                            width: 100,
                            child: Container(
                              margin: EdgeInsets.all(
                                10,
                              ),
                              padding: EdgeInsets.all(
                                12,
                              ),
                              child: BarChart(
                                BarChartData(
                                  backgroundColor: Color(0xFF262e5b),
                                  barGroups: _chartGroups(),
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    bottomTitles:
                                        AxisTitles(sideTitles: _bottomTitles),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    topTitles:
                                        AxisTitles(sideTitles: _topTitles),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //Weekly data
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${data['weeklyvalue']}\n',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data['subtext'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ignore: sort_child_properties_last
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFF262e5b),
                            ),
                            height: 200,
                            width: 100,
                            child: Container(
                              margin: EdgeInsets.all(
                                10,
                              ),
                              padding: EdgeInsets.all(
                                12,
                              ),
                              child: BarChart(
                                BarChartData(
                                  backgroundColor: Color(0xFF262e5b),
                                  barGroups: _chartGroupsWeekly(),
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                        sideTitles: _bottomTitlesWeekly),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //monthly data
                Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    // Row(
                    //   children: [
                    //     Monthly(Month),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Monthly(prevMonth),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Monthly(Month),
                    //   ],
                    // ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${data['monthlyvalue']}\n',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data['subtext'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ignore: sort_child_properties_last
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFF262e5b),
                            ),
                            height: 200,
                            width: 100,
                            child: Container(
                              margin: EdgeInsets.all(
                                10,
                              ),
                              padding: EdgeInsets.all(
                                12,
                              ),
                              child: BarChart(
                                BarChartData(
                                  backgroundColor: Color(0xFF262e5b),
                                  barGroups: _chartGroupsMonthly(),
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                        sideTitles: _bottomTitlesMonthly),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //yearly data
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${data['yearlyvalue']}\n',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data['subtext'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ignore: sort_child_properties_last
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFF262e5b),
                            ),
                            height: 200,
                            width: 100,
                            child: Container(
                              margin: EdgeInsets.all(
                                10,
                              ),
                              padding: EdgeInsets.all(
                                12,
                              ),
                              child: BarChart(
                                BarChartData(
                                  backgroundColor: Color(0xFF262e5b),
                                  barGroups: _chartGroupsYearly(),
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                        sideTitles: _bottomTitlesYearly),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget DailyDate(day, month) {
  Widget indicator;
  return indicator = CircularPercentIndicator(
    radius: 38.0,
    lineWidth: 5.0,
    percent: 0.7,
    animation: true,
    center: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${day} \n',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: month,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Monthly(month) {
  Widget indicator;
  return indicator = CircularPercentIndicator(
    radius: 38.0,
    lineWidth: 5.0,
    percent: 0.7,
    animation: true,
    center: Text(
      month,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
  );
}

SideTitles get _bottomTitles {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 6:
          text = '6:00 am';
          break;
        case 18:
          text = '6:00 pm';
          break;
      }

      return Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    },
  );
}

SideTitles get _topTitles {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 1:
          text = '0:00 am';
          break;
        case 12:
          text = '12:00 am';
          break;
        case 23:
          text = '12:00 pm';
          break;
      }

      return Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    },
  );
}

SideTitles get _bottomTitlesWeekly {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Mon';
          break;
        case 1:
          text = 'Tue';
          break;
        case 2:
          text = 'Wed';
          break;
        case 3:
          text = 'Thu';
          break;
        case 4:
          text = 'Fri';
          break;
        case 5:
          text = 'Sat';
          break;
        case 6:
          text = 'Sun';
          break;
      }

      return Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    },
  );
}

SideTitles get _bottomTitlesMonthly {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Jan';
          break;
        case 1:
          text = 'Feb';
          break;
      }

      return Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    },
  );
}
SideTitles get _bottomTitlesYearly {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = '2019';
          break;
        case 1:
          text = '2020';
          break;
        case 2:
          text = '2021';
          break;
        case 3:
          text = '2022';
          break;
        case 4:
          text = '2023';
          break;
      }

      return Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    },
  );
}