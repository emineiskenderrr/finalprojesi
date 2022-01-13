import 'package:flutter/material.dart';
import 'package:proje/Screens/DoctorFind/doctor_find.dart';
import 'package:proje/Screens/Kay%C4%B1tOlma/kayit_olma.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        //Ekranın tamamını kullanmayı sağlar
        child: Card(
          child: Center(
            child: ListView(
              //Listview vererek scroll özelliği vermiş olduk
              children: [
                buildContainer(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("Kullanıcı Adı"),
                      icon: Icon(Icons.mail, color: Colors.lightBlueAccent[400],),
                    ),
                    controller: t1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ("Şifre"),
                        icon: Icon(Icons.vpn_key,color: Colors.lightBlueAccent[400],)),
                    controller: t2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 130, left: 130),
                  child: RaisedButton(
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoktorArama()),
                    );},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff188cc2), Color(0xff49eae5)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: 130, left: 130),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KayitOl()),
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

Widget buildContainer () {
  return Container(
    width: double.infinity,
    height: 250,
    decoration: BoxDecoration(
        color: Colors.lightBlueAccent[700],
        borderRadius:
        BorderRadius.vertical(bottom: Radius.circular(70))),
    child: Center(
      child: Text(
        "Doctor Find",
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 50.0, color: Colors.white),
      ),
    ),
  );
}

