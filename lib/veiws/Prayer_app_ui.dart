import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_project/models/prayer_model.dart';
import 'package:prayer_project/widgets/prayer_container.dart';


class PrayAppUi extends StatefulWidget {
  const PrayAppUi({super.key});

  @override
  State<PrayAppUi> createState() => _PrayAppUiState();
}

class _PrayAppUiState extends State<PrayAppUi> {
  Day? todayPrayer;
  getPost() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        });

    await Future.delayed(Duration(seconds: 2));
    Uri url = Uri.parse("https://prayertime.info/api/pakistan/karachi.json");
    var response = await http.get(url);
    var prayer = prayerFromJson(response.body);
    todayPrayer = prayer.days?[0];
    setState(() {});
    Navigator.pop(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getPost();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Prayer Time",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/background.jpg.png",
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Karachi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tue, 03 Nov 2026",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                PrayerWidget(
                  prayerName: "Fajr",
                  prayerTime: todayPrayer?.fajr ?? "--",
                ),
                SizedBox(height: 20),
                PrayerWidget(
                  prayerName: "Sunrise",
                  prayerTime: todayPrayer?.sunrise ?? "--",
                ),
                SizedBox(height: 20),
                PrayerWidget(
                  prayerName: "Dhuhr",
                  prayerTime: todayPrayer?.dhuhr ?? "--",
                ),
                SizedBox(height: 20),
                PrayerWidget(
                  prayerName: "Asr",
                  prayerTime: todayPrayer?.asr ?? "--",
                ),
                SizedBox(height: 20),
                PrayerWidget(
                  prayerName: "Maghrib",
                  prayerTime: todayPrayer?.maghrib ?? "--",
                ),
                SizedBox(height: 20),
                PrayerWidget(
                  prayerName: "Isha'a",
                  prayerTime: todayPrayer?.isha ?? "--",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
