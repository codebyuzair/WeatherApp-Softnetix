import 'package:flutter/material.dart';
import 'package:myapp/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Karachi"; //city name
    int currTemp = 29; // current temperature
    int maxTemp = 32; // today max temperature
    int minTemp = 23; // today min temperature
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                'Weather App', //TODO: change app name
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchCity(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.search,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today', //day
                            style: TextStyle(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            '$currTemp˚C', //curent temperature
                            style: TextStyle(
                              color: currTemp <= 0
                                  ? Colors.blue
                                  : currTemp > 0 && currTemp <= 15
                                      ? Colors.indigo
                                      : currTemp > 15 && currTemp < 30
                                          ? Colors.deepPurple
                                          : Colors.pink,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Sunny', // weather
                            style: TextStyle(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$minTemp˚C', // min temperature
                              style: TextStyle(
                                color: minTemp <= 0
                                    ? Colors.blue
                                    : minTemp > 0 && minTemp <= 15
                                        ? Colors.indigo
                                        : minTemp > 15 && minTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '$maxTemp˚C', //max temperature
                              style: TextStyle(
                                color: maxTemp <= 0
                                    ? Colors.blue
                                    : maxTemp > 0 && maxTemp <= 15
                                        ? Colors.indigo
                                        : maxTemp > 15 && maxTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      //TODO: change weather forecast from local to api get
                                      buildForecastToday(
                                        "Now", //hour
                                        currTemp, //temperature
                                        29, //wind (km/h)
                                        0, //rain chance (%)
                                        Icons.snowing, //weather icon
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "8:00",
                                        31,
                                        25,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "9:00",
                                        32,
                                        28,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "10:00",
                                        30,
                                        13,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "11:00",
                                        31,
                                        9,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "12:00",
                                        32,
                                        25,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "13:00",
                                        31,
                                        12,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "14:00",
                                        29,
                                        1,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "15:00",
                                        27,
                                        15,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                       buildForecastToday(
                                        "16:00",
                                        30,
                                        30,
                                        0,
                                        Icons.sunny,
                                        size,
                                        isDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: [
                                    //TODO: change weather forecast from local to api get
                                    buildSevenDayForecast(
                                      "Today", //day
                                      minTemp, //min temperature
                                      maxTemp, //max temperature
                                      Icons.cloud, //weather icon
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Wed",
                                      30,
                                      23,
                                      Icons.sunny,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Thu",
                                      30,
                                      23,
                                      Icons.cloud,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Fri",
                                      30,
                                      23,
                                      Icons.sunny,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "San",
                                      32,
                                      23,
                                      Icons.sunny,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Sun",
                                      32,
                                      23,
                                      Icons.cloud,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Mon",
                                      32,
                                      23,
                                      Icons.sunny,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Tues",
                                      32,
                                      24,
                                      Icons.cloud,
                                      size,
                                      isDarkMode,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: Icon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(
          //         vertical: size.height * 0.01,
          //       ),
          //       child: Icon(
          //         Icons.air,
          //         color: Colors.grey,
          //         size: size.height * 0.03,
          //       ),
          //     ),
          //   ],
          // ),
          // Text(
          //   '$wind km/h',
          //   style: TextStyle(
          //     color: Colors.grey,
          //     fontSize: size.height * 0.02,
          //   ),
          // ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: Icon(
                  Icons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: TextStyle(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25,
                ),
                child: Icon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white38 : Colors.black38,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
