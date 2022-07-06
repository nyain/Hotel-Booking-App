import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/theme.dart';
import 'package:hotel_booking_app/screens/location.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text(
          "IndoScape",
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),),
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                  width: 300,
                ),
              ),
              Text(
                "\n           Indonesia masih memiliki tempat-tempat yang belum terjamah. Tempat-tempat seperti ini bisa dijadikan sebagai objek wisata. Karena banyaknya tempat-tempat yang masih belum diketahui ini, kami membuat aplikasi yang melihat semua tempat yang bisa dijadikan objek wisata. Aplikasi yang kami buat ini, melihat tempat objek wisata dengan beragam tempat yang dapat dikunjungi wisatawan lokal. Serta IndoScape ini menjadi platform untuk penduduk lokal agar mereka dapat mempromosikan penginapan yang mereka punya disekitar tempat wisata yang kami sediakan.",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              Text(
                "\nCreated By Kelompok 2: \n",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Hassan Rizky Putra Sailellah(1301190328)",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Muhammad Jundi Aminullah (1301193298)",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Farid Krida Mukti (1301194052)",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Vincent William Jonathan (1301190381)",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Location()
                      )
                      );
                    },
                    child: const Text(
                      "Our Office",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff59CAFF),
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}