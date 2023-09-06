import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tour_travel/detail_tour_travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text(
          'Tour & Travel',
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
          ),
        ),
        child: AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            // itemCount: historyResponse.data?.length ?? 0,
            itemBuilder: (context, index) {
              // final Data? historyData = historyResponse.data?[index];
              //
              // if (historyData == null) return const SizedBox.shrink();
              //
              // final String? trNumber = historyData.trNumber;
              // final String? status = historyData.transaction?.status;
              // final String? sendAt = historyData.transaction?.sendAt;
              // final String? receiveAt = historyData.transaction?.receiveAt;
              // final String? productName = historyData.transaction?.product?.name;
              // final int? quantity = historyData.transaction?.quantity;

              const SizedBox(
                height: 10,
              );
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 370),
                child: SlideAnimation(
                  verticalOffset: 65.0,
                  child: FadeInAnimation(
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(9.0),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      shadowColor: Colors.greenAccent,
                      child: GFListTile(
                        //input implementasi api disini ----------------
                        avatar: Image.asset(
                          'assets/avatar.png',
                          width: 82,
                          height: 85,
                        ),
                        titleText: 'Tour Hajj Indo',
                        subTitle: const Text('Haji', style: TextStyle(color: Colors.lightBlueAccent),),
                        // subTitle: Row(
                        //   children: [
                        //     Text('${index + 1}'),
                        //     Row(
                        //       children: List.generate(5, (i) {
                        //         return Icon(
                        //           i < (index + 1)
                        //               ? Icons.star
                        //               : Icons.star_border,
                        //           color: Colors.orangeAccent,
                        //         );
                        //       }),
                        //     ),
                        //   ],
                        // ),
                        description: const Text('Lorem Ipsum bla bla . .'),
                        icon: Image.asset(
                          'assets/map_ic.png', // Ganti dengan path ke gambar ikon favorit di asset Anda
                          width: 80,
                          height: 85,
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailTourTravel()));
                        },
                      ),
                    ),
                  ),
                ),
              );

            },
          ),
        ),
      ),
    );
  }
}
