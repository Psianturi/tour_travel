import 'package:flutter/material.dart';

class DetailTourTravel extends StatelessWidget {
  const DetailTourTravel({super.key});

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
          Column(
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
              width: double.infinity, // Lebar kontainer mengikuti layar
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(top: 12),
               child: const Card(
                elevation: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Detail Info',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white, // Divider antara teks
                      thickness: 1,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Paket',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white, // Divider antara teks
                      thickness: 1,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Gambar',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

              Align(
                alignment: Alignment.centerLeft, // Meletakkan teks di sebelah kiri
                child: Container(
                  margin: const EdgeInsets.only(top: 16, left: 30), // Sesuaikan margin sesuai kebutuhan
                  child: const Text(
                    'Tour Hajj Indo',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft, // Meletakkan teks di sebelah kiri
                child: Container(
                  margin: const EdgeInsets.only(top: 4, left: 30), // Sesuaikan margin sesuai kebutuhan
                  child: const Text(
                    '4.0',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft, // Meletakkan teks di sebelah kiri
                child: Container(
                  margin: const EdgeInsets.only(top: 8, left: 30), // Sesuaikan margin sesuai kebutuhan
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
              ),
              Align(
                alignment: Alignment.centerLeft, // Meletakkan teks di sebelah kiri
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 30), // Sesuaikan margin sesuai kebutuhan
                  child: const Text(
                    'Fasilitas',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
