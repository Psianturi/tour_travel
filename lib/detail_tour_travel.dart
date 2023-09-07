import 'package:flutter/material.dart';
// import 'package:multi_image_layout/multi_image_layout.dart';

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
                  alignment: Alignment.topCenter,
                  // Menengahkan elemen-elemen ke atas tengah
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
                  // Ubah ukuran
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
                        margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
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
                        height: 50, // Sesuaikan dengan tinggi yang Anda inginkan
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, // Jumlah card yang ingin ditampilkan
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
                                      Icon(Icons.location_on_outlined), // Icon map
                                      const SizedBox(width: 5), // Spasi antara ikon dan teks
                                      Text(
                                        'Buka Map $index',
                                        style: TextStyle(
                                          color: Colors.white, // Warna teks putih
                                        ),
                                      ), // Teks map
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/gambar/haji_photo1.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/gambar/haji_photo2.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/gambar/haji_photo3.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/gambar/haji_photo4.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/gambar/haji_photo5.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          // Image.asset(
                          //   'assets/gambar_5.png',
                          //   width: 100,
                          //   height: 100,
                          //   fit: BoxFit.cover,
                          // ),
                        ],
                      ),
                    ],
                  ),


                // if (currentView == 'Gambar')
                //   MultiImageLayout(
                //     images: List.generate(
                //       6, // Number of images you want to display
                //           (index) => MultiImageLayoutItem.asset(
                //         'assets/gambar_$index.png', // Replace with your image paths
                //       ),
                //     ),
                //     itemExtent: 200, // Adjust the item extent as needed
                //     spacing: 8.0, // Adjust the spacing between items
                //   ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
