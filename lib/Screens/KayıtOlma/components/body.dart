import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Screens/GirisEkrani/giris_ekrani.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController sifre_tekrar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        color: Colors.lightBlueAccent,
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Flexible(
                      child: buildFlexible(icon: Icons.person, text: "Ad", txtController: ad),),
                    Flexible(
                      child: buildFlexible(icon: Icons.person, text: "Soyad", txtController: soyad),
                    )
                  ],
                ),
                SizedBox(height: 20),
                buildInput(icon: Icons.email, text: "email@gmail.com", txtController: email),
                buildInput(icon: Icons.vpn_key, text: "Şifre", txtController: sifre),
                buildInput(icon: Icons.vpn_key, text: "Şifre Tekrar", txtController: sifre),
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.only(right: 130, left: 130),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnaEkran()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff49eae5), Color(0xff188cc2)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFlexible({required IconData icon, required String text, required TextEditingController txtController})
{
  return Padding(
    padding: const EdgeInsets.only(top:20,left: 20),
    child: Row(
      children: <Widget>[

        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                hintText: text,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10)
            ),
            controller: txtController,
          ),
        ),
        SizedBox(width: 20),
      ],
    ),
  );
}

Widget buildInput({required IconData icon, required String text, required TextEditingController txtController}) {
  return Padding
    (
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: (Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: text,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10)),
          controller: txtController,
        ),
        SizedBox(height: 20),
      ],
    )),
  );
}
