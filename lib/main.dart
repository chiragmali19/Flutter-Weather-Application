import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _weatherData;
  List<Map<String, dynamic>>? _dailyWeatherData;

  Future<void> _search() async {
    final destination = _controller.text;
    try {
      final weatherData = await ApiService.getWeather(destination);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
      // Handle the error (e.g., show a message to the user)
    }
  }

  Future<void> _fetchDailyWeather() async {
    final destination = _controller.text;
    try {
      final dailyWeatherData = await ApiService.getDailyWeather(destination);
      setState(() {
        _dailyWeatherData = dailyWeatherData['daily'];
      });
    } catch (e) {
      print(e);
      // Handle the error (e.g., show a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient:
                _getGradientBackground(), // Apply the same gradient or a different one
          ),
          child: AppBar(
            title: Text('Weather App'),
            elevation: 0,
            backgroundColor:
                Colors.transparent, // Set to transparent for gradient effect
            foregroundColor:
                Colors.white, // Change icon and text color if needed
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Handle settings action
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: _getGradientBackground(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              // SizedBox(height: 20),
              _buildCloudImage(),
              // SizedBox(height: 20),
              _weatherData != null
                  ? Expanded(
                      child: Column(
                        children: [
                          _buildWeatherDetails(),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _fetchDailyWeather,
                            child: Text('Show Full Day Weather'),
                          ),
                          _dailyWeatherData != null
                              ? Expanded(child: _buildDailyWeatherDetails())
                              : Container(),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          'Enter a location to see the weather',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          hintText: 'Enter location',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: _search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintStyle: TextStyle(color: Colors.blue),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
    );
  }

  Widget _buildWeatherDetails() {
    final temperature = _weatherData!['temperature']?.toString() ?? 'N/A';
    final condition = _weatherData!['condition'] ?? 'N/A';
    final windSpeed = _weatherData!['wind_speed']?.toString() ?? 'N/A';

    final rain = _weatherData!['rain']?.toString() ?? '0';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Details:',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWeatherCard('Temp', '$temperature°C'),
                _buildWeatherCard('status', condition),
                _buildWeatherCard('Wind Speed', '$windSpeed m/s'),
                _buildWeatherCard('Rain', '$rain mm'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyWeatherDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200, // Adjust height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _dailyWeatherData!.length,
          itemBuilder: (context, index) {
            final data = _dailyWeatherData![index];
            final condition = data['condition'].toLowerCase();
            return Container(
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildWeatherIcon(condition),
                      SizedBox(height: 8),
                      Text('${data['time']}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('Temp: ${data['temperature']}°C',
                          style: TextStyle(fontSize: 12)),
                      Text('status: ${data['condition']}',
                          style: TextStyle(fontSize: 12)),
                      Text('Wind Speed: ${data['wind_speed']} m/s',
                          style: TextStyle(fontSize: 12)),
                      Text('Rain: ${data['rain']} mm',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWeatherIcon(String condition) {
    if (condition.contains('rain')) {
      return Icon(
        FontAwesomeIcons.cloudShowersHeavy,
        size: 40,
        color: Colors.blueGrey,
      );
    } else {
      return Icon(
        FontAwesomeIcons.sun,
        size: 40,
        color: Colors.orange,
      );
    }
  }

  Widget _buildWeatherCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCloudImage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 150,
        height: 150,
        child: Center(
          child: Image.asset(
            'assets/cloud.png',
            height: 150,
            width: 150,
            color: Colors.white.withOpacity(0.8), // Adjust opacity here
            colorBlendMode:
                BlendMode.modulate, // Ensures color is applied correctly
          ),
        ),
      ),
    );
  }

  Gradient _getGradientBackground() {
    final condition = _weatherData?['condition']?.toLowerCase() ?? '';

    if (condition.contains('rain')) {
      return LinearGradient(
        colors: [Colors.grey, Colors.blueGrey],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (condition.contains('clear')) {
      return LinearGradient(
        colors: [Colors.yellow, Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (condition.contains('cloud')) {
      return LinearGradient(
        colors: [Colors.lightGreen, Colors.grey],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      return LinearGradient(
        colors: [Colors.cyan, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
  }
}
