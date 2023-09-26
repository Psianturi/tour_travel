import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tour_travel/api/tour_travel_api.dart';
import 'models/tour_travel_model.dart';

class DetailTourTravel extends StatefulWidget {
  final Data? tourTravelData;
  final List<Package>? packages;
  final List<Media>? media;

  const DetailTourTravel(
      {Key? key,
      required this.tourTravelData,
      required this.packages,
      required this.media})
      : super(key: key);

  @override
  _DetailTourTravelState createState() => _DetailTourTravelState();
}

class _DetailTourTravelState extends State<DetailTourTravel> {
  String currentView = 'Detail Info';
  bool isBottomBarVisible = false;
  IconData bottomBarIcon = Icons.keyboard_arrow_up;

  @override
  void initState() {
    super.initState();
  }

  void changeView(String view) {
    setState(() {
      currentView = view;
    });
    print('Current View: $currentView');
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
                          color: Colors.black,
                          thickness: 5,
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
                        child: Text(
                          widget.tourTravelData?.title ?? '',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4, left: 20),
                        child: Text(
                          '${widget.tourTravelData?.rating ?? 0.0}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 8, left: 20, right: 20),
                        child: Text(
                          widget.tourTravelData?.description ?? '',
                          style: const TextStyle(
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
                      const SizedBox(height: 40),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.blue,
                              elevation: 10,
                              margin:
                                  const EdgeInsets.only(left: 20, bottom: 0),
                              child: InkWell(
                                onTap: () {
                                  print('Card ke-$index diklik');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Buka Map $index',
                                        style: const TextStyle(
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
                      const SizedBox(height: 2),
                    ],
                  ),

                if (currentView == 'Paket')
                  Column(
                    children: widget.packages?.map((package) {
                          return Card(
                            elevation: 3.5,
                            // Tingkat elevasi bayangan card
                            margin: const EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14.0), // Bentuk card
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // Menyusun elemen dalam kolom
                              children: [
                                SizedBox(height: 8,),
                                Center(
                                child: Image.network(
                                  TourTravelApi.imageUrl +
                                      (package.image ?? ''),
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  // Padding dalam card
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // Menyusun teks ke kiri
                                    children: [
                                      Text(
                                        package.title ?? '',
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Spasi antara judul dan deskripsi
                                      Text(
                                        package.description ?? '',
                                        // Deskripsi paket
                                        style: TextStyle(
                                            fontSize:
                                                16.0), // Ukuran teks deskripsi
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Spasi antara deskripsi dan harga
                                      Text(
                                        'Harga: ${package.harga ?? 0}',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.blue, // Warna teks harga
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList() ??
                        [], // Handle null or empty list
                  ),

                if (currentView == 'Gambar')
                  Column(
                    children: [
                      SizedBox(
                        height: 200, // Sesuaikan tinggi dengan kebutuhan Anda
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.media?.length ?? 0,
                          itemBuilder: (context, index) {
                            final media = widget.media?[index];
                            return Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.network(
                                '${TourTravelApi.imageUrl}${media?.image ?? ''}',
                                width: 210,
                                height: 190,

                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 18),
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
                    Icons.place,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Buka Map',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Tempatkan konten bottom bar Anda di sini
            // Contoh: ListView.builder, Column, Row, dll.
          ],
        ),
      ),
    );
  }
}

//       bottomNavigationBar: isBottomBarVisible
//           ? Container(
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 18), // Tinggi dari bottom bar
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Info lebih lanjut, silahkan',
//                         style:
//                             TextStyle(fontSize: 14, color: Colors.blueAccent),
//                       ),
//                       const SizedBox(width: 35), // Spasi antara teks dan ikon
//                       TextButton.icon(
//                         onPressed: () {
//                           // Tindakan yang ingin Anda lakukan saat tombol ditekan
//                         },
//                         icon: const Icon(
//                           Icons.place, // Ganti dengan ikon yang Anda inginkan
//                           color: Colors.white, // Warna ikon tetap putih
//                         ),
//                         label: const Text(
//                           'Buka Map',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors
//                                 .white, // Mengatur warna teks menjadi putih
//                           ),
//                         ),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(Colors
//                               .blueAccent), // Mengatur warna latar belakang tombol menjadi biru
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   // Tempatkan konten bottom bar Anda di sini
//                   // Contoh: ListView.builder, Column, Row, dll.
//                 ],
//               ),
//             )
//           : null,
//       floatingActionButton: FloatingActionButton(
//         mini: true,
//         backgroundColor:
//             isBottomBarVisible ? Colors.transparent : Colors.blue[50],
//         onPressed: () {
//           _toggleBottomBar();
//         },
//         child: Icon(bottomBarIcon,
//             color: isBottomBarVisible ? Colors.white : Colors.black),
//       ),
//     );
//   }
//
//   void _toggleBottomBar() {
//     setState(() {
//       isBottomBarVisible = !isBottomBarVisible;
//       bottomBarIcon = isBottomBarVisible
//           ? Icons.keyboard_arrow_down
//           : Icons.keyboard_arrow_up;
//     });
//   }
// }
