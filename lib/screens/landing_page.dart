import 'package:a1_1_20/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:a1_1_20/widgets/navigator.dart';

// enum StatusPesan { sewa, beli }

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Book Store"),
        // textTheme: TextTheme(),
      ),
      body: Stack(
        // berfungsi agar widget bisa tumpang tindih
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/background2.jpg',
            width: lebar,
            height: tinggi,
            fit: BoxFit.fill,
          ),
          //

          Container(
            // membuat kotak berwarna putih untuk di isikan konten seperti gambar
            padding: EdgeInsets.only(top: 40, bottom: 40),
            width: lebar - 100,
            height: tinggi - 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    // membuat bayangan
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 6),
                  )
                ]),
            child: Column(
              //dibuat column agar gambar ber susun secara vertical
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "Buku1",
                  child: Image.asset(
                    'assets/images/buku1.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                Hero(
                  tag: "Buku2",
                  child: Image.asset(
                    'assets/images/buku2.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                ElevatedButton(
                  // tombol
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 2),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    RegisterPage())
                        // MaterialPageRoute(
                        //     builder: (_) => const NavigatorWidget())
                        );
                  },
                  child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
