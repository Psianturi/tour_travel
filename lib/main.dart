import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tour_travel/api/tour_travel_api.dart';
import 'package:tour_travel/detail_tour_travel.dart';
import 'package:tour_travel/models/tour_travel_model.dart';
import 'package:http/http.dart' as http;

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
  late TourTravelModel tourTravelModel = TourTravelModel();
  late List<Package> packages = [];

  Future<void> fetchData() async {
    var url = Uri.parse(TourTravelApi.baseUrl + TourTravelApi.getList);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $bearerToken'
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('data')) {
        tourTravelModel = TourTravelModel.fromJson(responseData);
        setState(() {});
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Package>> fetchPackages() async {
    var url = Uri.parse(TourTravelApi.baseUrl + TourTravelApi.getList);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $bearerToken'
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('data')) {
        final List<dynamic> packageDataList = responseData['data'];
        final List<Package> packages = packageDataList.map((data) {
          return Package.fromJson(data);
        }).toList();
        return packages;
      }
    }

    throw Exception('Failed to load packages');
  }


  @override
  void initState() {
    super.initState();
    fetchData();
    fetchPackages().then((packageList) {
      setState(() {
        packages = packageList;
      });
    });
  }

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
            itemCount: tourTravelModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final Data? tourTravelData = tourTravelModel.data?[index];
              if (tourTravelData == null) {
                // return const SizedBox.shrink();
                return const Center(
                  child: CircularProgressIndicator(),
                );
               // return const SizedBox(
               //    height: 20,
               //  );
              }
              final String? title = tourTravelData.title;
              final int? rating = tourTravelData.rating;
              final String? description = tourTravelData.description;
              final String? image = tourTravelData.image;

              final int maxDescriptionLength = 100;
              String truncatedDescription = description ?? '';

              if (description != null && description.length > maxDescriptionLength) {
                truncatedDescription = description.substring(0, maxDescriptionLength) + '...';
              }

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
                        // avatar: Image.network( '$image',
                        //   width: 30,
                        //   height: 30,
                        //   fit: BoxFit.cover,
                        // ),
                        avatar: Image.asset(
                          'assets/avatar.png',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        titleText: '$title',
                        subTitle:  Text('$rating',
                          style: TextStyle(color: Colors.lightBlueAccent),),

                        // description: Text('$description'),
                        description: Text(truncatedDescription),
                          icon: Image.asset(
                            'assets/map_ic.png',
                            width: 75,
                            height: 80,
                            fit: BoxFit.cover,
                          ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailTourTravel(
                                tourTravelData: tourTravelData,
                                packages: packages,
                              ),
                            ),
                          );
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
