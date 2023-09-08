import 'package:flutter/material.dart';

class DetailTourTravel extends StatefulWidget {
  const DetailTourTravel({super.key});

  @override
  _DetailTourTravelState createState() => _DetailTourTravelState();
}

class _DetailTourTravelState extends State<DetailTourTravel> {
  String currentView = 'Detail Info';
  bool isBottomBarVisible = false;
  IconData bottomBarIcon = Icons.keyboard_arrow_up;

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      body: Stack(
        children: [
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
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 14),
                    padding: const EdgeInsets.all(4.4),
                    child: Image.asset(
                      'assets/hajjumrah.png',
                      width: 360,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 13.5),
                  margin: const EdgeInsets.only(top: 12),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.white70,
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
                        const VerticalDivider(
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
                        const VerticalDivider(
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
                        margin: const EdgeInsets.only(top: 15, left: 20),
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
                        margin: const EdgeInsets.only(top: 4, left: 20),
                        child: const Text(
                          '4.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.only(top: 8, left: 20, right: 20),
                        child: const Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                              ' Lorem Ipsum has been the industry standard dummy text ever since the 1500s,'
                              'when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        child: const Text(
                          'Fasilitas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.blue,
                              elevation: 15,
                              margin: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  print('Card ke-$index diklik');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Buka Map $index',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                if (currentView == 'Paket')
                  Column(
                    children: [
                      const SizedBox(height: 15.5),
                      Image.asset(
                        'assets/umroh_iklan.png',
                        width: 345,
                        height: 205,
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        'assets/umroh_iklan.png',
                        width: 345,
                        height: 205,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 35),
                    ],
                  ),
                if (currentView == 'Gambar')
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10.0, top: 10.0),
                            child: Image.asset(
                              'assets/gambar/haji_photo1.png',
                              width: 124,
                              height: 124,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/gambar/haji_photo2.png',
                              width: 124,
                              height: 124,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/gambar/haji_photo3.png',
                              width: 124,
                              height: 124,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10.0, top: 5.0),
                            child: Image.asset(
                              'assets/gambar/haji_photo4.png',
                              width: 124,
                              height: 124,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Image.asset(
                              'assets/gambar/haji_photo5.png',
                              width: 124,
                              height: 124,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isBottomBarVisible
          ? Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 18), // Tinggi dari bottom bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Info lebih lanjut, silahkan',
                  style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                ),
                const SizedBox(width: 35), // Spasi antara teks dan ikon
                TextButton.icon(
                  onPressed: () {
                    // Tindakan yang ingin Anda lakukan saat tombol ditekan
                  },
                  icon: const Icon(
                    Icons.place, // Ganti dengan ikon yang Anda inginkan
                    color: Colors.white, // Warna ikon tetap putih
                  ),
                  label: const Text(
                    'Buka Map',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white, // Mengatur warna teks menjadi putih
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Mengatur warna latar belakang tombol menjadi biru
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Tempatkan konten bottom bar Anda di sini
            // Contoh: ListView.builder, Column, Row, dll.
          ],
        ),
      )
          : null,

      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: isBottomBarVisible ? Colors.transparent : Colors.blue[50],
        onPressed: () {
          _toggleBottomBar();
        },
        child: Icon(
          bottomBarIcon,
            color: isBottomBarVisible ? Colors.white : Colors.black),
      ),
    );
  }

  void _toggleBottomBar() {
    setState(() {
      isBottomBarVisible = !isBottomBarVisible;
      bottomBarIcon = isBottomBarVisible ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up;
    });
  }
}
