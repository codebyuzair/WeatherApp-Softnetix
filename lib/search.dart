import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
// import 'package:myapp/repo.dart';
// import 'package:myapp/weather_model.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController();
    // WeatherModel? weatherModel;
    return Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(
        //   title: const Text("weather app"),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sunny,
                size: 100,
                color: Colors.yellow,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter City Name',
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0), // Adjust padding as needed
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust border radius for desired circularity
                    borderSide: const BorderSide(
                        color: Colors.white, width: 1.0), // White border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust border radius
                    borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0), // Blue border on focus
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: const Border(),
                ),
                 child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.blue,),
                ),
              ),
              // Container(
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const HomePage(),
              //           ),
              //         );
              //     },
              //     icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70,),
              //   ),
              // ),

              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const HomePage(),
              //         ),
              //       );

              //       // weatherModel = await Repo().getWeather(controller.text);
              //       // // ignore: avoid_print
              //       // print(weatherModel?.main?.temp ?? "error");
              //       // setState(() {});
              //     },
              //     child: const Text("search")),
              // Text("temp ${weatherModel?.main?.temp}"),
              // Text("min temp${weatherModel?.main?.tempMin}"),
              // Text("max temp${weatherModel?.main?.tempMax}"),
            ],
          ),
        ));
  }
}
