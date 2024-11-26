import 'package:catatan/screen/Login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 3)).then((value) {
  Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(
    builder: (context) => LoginPage(),), (Route) => false);
    });


    return Scaffold(
      backgroundColor: const Color(0xff6E62E5),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white, 
                BlendMode.srcIn, 
              ),
              child: Image.network(
                "https://cdn4.iconfinder.com/data/icons/info-education-pack-1/24/line_Notes-512.png",
                height: 95,
                width: 95,
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                "CATATAN",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
