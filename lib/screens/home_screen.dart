import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/data_home.dart';
import 'package:hotel_booking_app/screens/details_screen.dart';
import 'package:hotel_booking_app/screens/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum MenuSelection {
  menu1,
  menu2,
  menu3,
  menu4,
}

class _HomeScreenState extends State<HomeScreen> {
  DataHome object = DataHome();

  MenuSelection? selectedOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: const Image(
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/0714/1079/products/merrell-twins-merch-merrell-twins-gamer-girl-yellow-shirt-shirt-28291175612525_1000x1000.jpg?v=1627999468"),
                      ),
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              //   child: Text(
              //     "",
              //     style: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.w800,
              //         color: Color(0xff3C4657)),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              // Container(
              //   width: 320,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: "Memilih Hotel",
              //       prefixIcon: const Icon(
              //         Icons.search,
              //         size: 35,
              //         color: Color(0xff3C4657),
              //       ),
              //       border: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             width: 2.4, color: Color(0xff3C4657)),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             width: 2.4, color: Color(0xff3C4657)),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: const Color(0xff3C4657),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   height: 50,
              //   width: 50,
              //   child: const Icon(Icons.filter_alt,
              //       size: 35, color: Colors.white),
              // ),
              //     ],
              //   ),
              // ),
              Container(
                height: 200,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedOne = MenuSelection.menu1;
                        });
                      },
                      child: MenuScreen(
                        "Hotel",
                        selectedOne == MenuSelection.menu1
                            ? Color(0xff3C4657)
                            : Color(0xffF0F1F3),
                        selectedOne == MenuSelection.menu1
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                height: 270,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(
                                object.getData[index].imageUrl,
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Stack(children: [
                          Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border, size: 40)),
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
              const Padding(
                padding: EdgeInsets.only(left: 12.0, top: 12),
                child: Text(
                  "Popular Hotels",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff3C4657),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                height: 220,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: object.getAnotherData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                object.getAnotherData[index].imageUrl,
                                object.getAnotherData[index].name,
                                object.getAnotherData[index].location),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 220,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  object.getAnotherData[index].imageUrl),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    object.getAnotherData[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
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
                                        object.getAnotherData[index].location,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
