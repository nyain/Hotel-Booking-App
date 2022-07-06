import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/about_us.dart';
import 'travelcard.dart';
import 'package:hotel_booking_app/screens/home_screen.dart';
import 'package:hotel_booking_app/screens/data_home.dart';
import 'package:hotel_booking_app/screens/details_screen.dart';
import 'package:hotel_booking_app/screens/menu_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotel_booking_app/model/city.dart';

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

Future<List<City>> fetchCity() async {
  var response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/getCity'));
  return (json.decode(response.body)['data'] as List)
      .map((e) => City.fromJson(e))
      .toList();
}

class _TravelAppState extends State<TravelApp> {

  
  void initState() {
    // _startApp();
    super.initState();
  }

  DataHome object = DataHome();
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list
  List<String> urls = [
    "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/26/70/2670784_v5.jpeg",
    "https://lh3.googleusercontent.com/proxy/wTkD1USQGpbVXzZFNLCZBDCL1OQS1bFzSgPa44cHwiheaY9DpoqMdNjBgEJcCIZSQeSkCO-2q5gfuhtnuz4cDhtpansOcWos093YsGvogdQqWnpWlA",
    "https://dolanyok.com/wp-content/uploads/2019/12/Hotel-Tentrem.jpg",
    "https://lh3.googleusercontent.com/proxy/ovCSxeucYYoir_rZdSYq8FfCHPeot49lbYqlk7nXs7sXjqAfbZ2uw_1E9iivLT85LwIZiGSnXuqkdbQ_xKFhd91M7Y05G94d",
    "https://q-xx.bstatic.com/xdata/images/hotel/max500/216968639.jpg?k=a65c7ca7141416ffec244cbc1175bf3bae188d1b4919d5fb294fab5ec8ee2fd2&o=",
    "https://cdn.popbela.com/content-images/post/20200814/18e6c089ed10ab999aa292ed78549b48_750x500.jpg",
    "https://i.ytimg.com/vi/CGnizWLL8dU/maxresdefault.jpg",
    "https://www.shieldsgazette.com/images-i.jpimedia.uk/imagefetch/https://jpgreatcontent.co.uk/wp-content/uploads/2020/04/spain.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/8b/de/52/aerial-view.jpg?w=900&h=-1&s=1",
    "https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg",
    "http://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revisi-2020/destinations-thumbnail/Bali-Thumbnail.jpg",
    "https://digitalnomads.world/wp-content/uploads/2021/01/bali-for-digital-nomads-1024x683.jpg"
  ];
  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 202, 252),
      
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            Text(
              "Welcome Indoscape",
              style: TextStyle(
                color: Color.fromARGB(255, 30, 0, 197),
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Let's Go to Holiday",
              style: TextStyle(
                color: Color.fromARGB(255, 30, 0, 197),
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Color.fromARGB(84, 109, 109, 109),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search Destination",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color.fromARGB(255, 17, 2, 158),
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Color.fromARGB(255, 17, 2, 158),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Popular",
                        ),
                        Tab(
                          text: "Hidden Gems",
                        ),
                        Tab(
                          text: "Favorit",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Container(
                            child: FutureBuilder(future: fetchCity(),
                            builder:(context, snapshot) {
                            if (snapshot.hasData) {
                              List<City> _city = snapshot.data as List<City>;
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  //Now let's add and test our first card
                                  travelCard(
                                      imgUrl: "images/bali.jpg",
                                      hotelName: "",
                                      location: _city[0].namecity,
                                      rating: 5),
                                  travelCard(
                                      imgUrl: "images/jakarta.jfif",
                                      hotelName: "",
                                      location: _city[1].namecity,
                                      rating: 4),
                                  travelCard(
                                      imgUrl: "images/surabaya.jpg",
                                      hotelName: "",
                                      location: _city[2].namecity,
                                      rating: 4)
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              ),
                            );
                            }
                               
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Here you can add what ever you want
                                travelCard(
                                    imgUrl: "images/sulawesiselatan.jpg",
                                    hotelName: "",
                                    location: "Sulawesi Selatan",
                                    rating: 5),
                                travelCard(
                                    imgUrl: "images/sumateraselatan.jpg",
                                    hotelName: "",
                                    location: "Sumatera Selatan",
                                    rating: 5)
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Here you can add what ever you want
                                travelCard(
                                    imgUrl: "images/papuabarat.jpg",
                                    hotelName: "",
                                    location: "Papua Barat",
                                    rating: 5),
                                travelCard(
                                    imgUrl: "images/kalimantantengah.jpg",
                                    hotelName: "",
                                    location: "Kalimantan Tengah",
                                    rating: 5)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "",
              style: TextStyle(
                color: Color.fromARGB(255, 30, 0, 197),
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "Destination Place",
              style: TextStyle(
                color: Color.fromARGB(255, 30, 0, 197),
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              height: 1100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: object.getData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              object.getData[index].imageUrl,
                              object.getData[index].name,
                              object.getData[index].location),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken),
                            image: AssetImage(
                              object.getData[index].imageUrl,
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(children: [
                        Positioned(
                          right: 20,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                size: 40,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                object.getData[index].name,
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    object.getData[index].location,
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
