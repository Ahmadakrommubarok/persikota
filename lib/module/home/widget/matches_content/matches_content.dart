import 'package:flutter/material.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  MatchesPageState createState() => MatchesPageState();
}

class MatchesPageState extends State<MatchesPage> {
  bool isUpcomingSelected = true;

  final List<MatchItem> upcomingMatches = [
    const MatchItem(
      tanggal: "29 April 2024",
      waktu: "13:15 WIB",
      tim1: "PERSAB BREBES",
      tim2: "PERSIKOTA TANGERANG",
      stadion: "Stadion Benteng Reborn Kota Tangerang",
      logoTim1: "assets/images/persab.png",
      logoTim2: "assets/images/logo.png",
    ),
    const MatchItem(
      tanggal: "20 Mei 2024",
      waktu: "15:30 WIB",
      tim1: "PERSIKOTA TANGERANG",
      tim2: "KARTANEGARA",
      stadion: "Stadion Benteng Reborn Kota Tangerang",
      logoTim1: "assets/images/logo.png",
      logoTim2: "assets/images/mesra.png",
    ),
    // Add more upcoming matches here...
  ];

  final List<MatchItem> previousMatches = [
    const MatchItem(
      tanggal: "21 Mei 2023",
      waktu: "13:15 WIB",
      tim1: "PERSIKOTA TANGERANG",
      tim2: "PERSIDAGO GORONTALO",
      stadion: "Stadion Benteng Reborn Kota Tangerang",
      logoTim1: "assets/images/logo.png",
      logoTim2: "assets/images/persidago.png",
    ),
    const MatchItem(
      tanggal: "21 Mei 2023",
      waktu: "15:30 WIB",
      tim1: "MBS UNITED BATAM",
      tim2: "PERSIKOTA TANGERANG",
      stadion: "Stadion Benteng Reborn Kota Tangerang",
      logoTim1: "assets/images/mbs.png",
      logoTim2: "assets/images/logo.png",
    ),
    // Add more previous matches here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Jadwal Pertandingan'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 32), // Add some spacing above the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isUpcomingSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isUpcomingSelected ? Colors.indigo : Colors.white,
                  side: BorderSide(
                    color: isUpcomingSelected ? Colors.indigo : Colors.indigo,
                  ),
                  elevation: isUpcomingSelected ? 10 : 0,
                ),
                child: Text(
                  'Mendatang',
                  style: TextStyle(
                    color: isUpcomingSelected ? Colors.white : Colors.indigo,
                    fontWeight: isUpcomingSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isUpcomingSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      !isUpcomingSelected ? Colors.indigo : Colors.white,
                  side: BorderSide(
                    color: !isUpcomingSelected ? Colors.indigo : Colors.indigo,
                  ),
                  elevation: !isUpcomingSelected ? 10 : 0,
                ),
                child: Text(
                  'Sebelumnya',
                  style: TextStyle(
                    color: !isUpcomingSelected ? Colors.white : Colors.indigo,
                    fontWeight: !isUpcomingSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 16), // Add some spacing between buttons and ListView
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: isUpcomingSelected ? upcomingMatches : previousMatches,
            ),
          ),
        ],
      ),
    );
  }
}

class MatchItem extends StatelessWidget {
  final String tanggal;
  final String waktu;
  final String tim1;
  final String tim2;
  final String stadion;
  final String logoTim1;
  final String logoTim2;

  const MatchItem({
    super.key,
    required this.tanggal,
    required this.waktu,
    required this.tim1,
    required this.tim2,
    required this.stadion,
    required this.logoTim1,
    required this.logoTim2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Text(
            "$tanggal - $waktu",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    logoTim1,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tim1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "VS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Column(
                children: [
                  Image.asset(
                    logoTim2,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tim2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            stadion,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.indigo, // Ubah warna teks stadion menjadi indigo
            ),
          ),
        ],
      ),
    );
  }
}
