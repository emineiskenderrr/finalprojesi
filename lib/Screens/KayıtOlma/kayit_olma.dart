import 'package:flutter/material.dart';
import 'package:proje/Screens/Kay%C4%B1tOlma/components/body.dart';


class KayitOl extends StatelessWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Ol" , ),
        backgroundColor: Colors.lightBlueAccent[700],
      ),
      body: Body(),
    );
  }
}