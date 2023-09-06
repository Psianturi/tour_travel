import 'package:flutter/material.dart';

class DetailTourTravel extends StatefulWidget {
  const DetailTourTravel({super.key});

  @override
  _DetailTourTravelState createState() => _DetailTourTravelState();
}

class _DetailTourTravelState extends State<DetailTourTravel> {
  String currentView = 'Detail Info';

  void changeView(String view) {
    setState(() {
      currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text(
          'Tour Hajj Indonesia',
        ),
        centerTitle: true,
        shadowColor: Colors.black54,
        titleTextStyle: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // actions: [
        //
        // ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      //insert image
      body: Stack(
        // Menggunakan Stack untuk latar belakang dan konten
        children: [
          // Latar belakang gambar
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter, // Menengahkan elemen-elemen ke atas tengah
                child: Container(
                  margin: const EdgeInsets.only(top: 14),
                  // padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/hajjumrah.png',
                    width: 390,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(top: 12),
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => changeView('Detail Info'),
                          child: Center(
                            child: Text(
                              'Detail Info',
                              style: TextStyle(
                                fontSize: 15,
                                color: currentView == 'Detail Info'
                                    ? Colors.blueAccent
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => changeView('Paket'),
                          child: Center(
                            child: Text(
                              'Paket',
                              style: TextStyle(
                                fontSize: 15,
                                color: currentView == 'Paket'
                                    ? Colors.blueAccent
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => changeView('Gambar'),
                          child: Center(
                            child: Text(
                              'Gambar',
                              style: TextStyle(
                                fontSize: 15,
                                color: currentView == 'Gambar'
                                    ? Colors.blueAccent
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (currentView == 'Detail Info')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 30),
                      child: const Text(
                        'Tour Hajj Indo',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, left: 30),
                      child: const Text(
                        '4.0',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, left: 30),
                      child: const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                            ' Lorem Ipsum has been the industry standard dummy text ever since the 1500s,'
                            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 30),
                      child: const Text(
                        'Fasilitas',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

              if (currentView == 'Paket')
                Column(
                  children: [
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/umroh_iklan.png',
                      width: 380, // Sesuaikan dengan ukuran yang Anda inginkan
                      height: 220, // Sesuaikan dengan ukuran yang Anda inginkan,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5), // Ubah jarak antara gambar pertama dan kedua sesuai kebutuhan
                      child: Image.asset(
                        'assets/umroh_iklan.png',
                        width: 380, // Sesuaikan dengan ukuran yang Anda inginkan
                        height: 220, // Sesuaikan dengan ukuran yang Anda inginkan
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),


              if (currentView == 'Gambar')
                Text(
                  'Tampilkan Gambar di sini',
                  style: TextStyle(fontSize: 16),
                ),

            ],
          ),
    ),
        ],
      ),
    );
  }
}
