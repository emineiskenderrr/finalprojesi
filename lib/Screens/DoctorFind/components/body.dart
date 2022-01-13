import 'package:flutter/material.dart';
import 'package:proje/Screens/DoctorProfile/doktor_profile.dart';
import 'package:proje/models/doktor.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Doktor> doktorlar = [
    Doktor(
        'Kardiyoloji',
        'Umut Demirel',
        'https://media.istockphoto.com/photos/closeup-portrait-of-confident-young-male-doctor-therapist-in-white-picture-id1326987315?k=20&m=1326987315&s=612x612&w=0&h=e_tNpN5D4J5tNny6EeusuUZ6FZMEKP0y9eoUaZDgykM=',
        ),
    Doktor(
        'Kardiyoloji',
        'Yelda Soy',
        'https://media.istockphoto.com/photos/female-doctor-waving-and-talking-with-colleagues-through-a-video-call-picture-id1249601252',
        ),
    Doktor(
        'Nöroloji',
        'Zeynep Sare Pınar',
        'https://media.istockphoto.com/photos/doctor-holding-digital-tablet-at-meeting-room-picture-id1189304032?k=20&m=1189304032&s=612x612&w=0&h=ovTNnR0JX2cRZkzMBed9exRO_PamZLlysLDFkXesr4Q=',
        ),
    Doktor(
        'Psikiyatrist',
        'Dilara Köşeli',
        'https://media.istockphoto.com/photos/portrait-of-smiling-female-doctor-wearing-white-coat-with-stethoscope-picture-id1147973967?k=20&m=1147973967&s=612x612&w=0&h=kwtZFTh1fSWr72qLNFiJd1Bh1MhTQ3eQpbEkAn4Ad8A=',
       ),
    Doktor(
        'Dahiliye',
        'Emine İskenderoğlu',
        'https://media.istockphoto.com/photos/portrait-of-glad-smiling-doctor-in-white-uniform-standing-with-hands-picture-id1187615335?k=20&m=1187615335&s=612x612&w=0&h=h9sDoNlzNCJ0mND-HDrbrlDsNffLINPw7sm6sZi9ue8=',
        ),
    Doktor(
        'Kulak Burun Boğaz',
        'Ayça Köşeli',
        'https://media.istockphoto.com/photos/healthcare-and-medicine-concept-picture-id1147579064?k=20&m=1147579064&s=612x612&w=0&h=TSnSYF6Jpo-6Jij4ugeaDQLtkZXbhjG2hlO5Bun6JSk=',
        ),
    Doktor(
        'Ortopedi',
        'Murat Sağlam',
        'https://media.istockphoto.com/photos/headshot-portrait-smiling-doctor-wearing-uniform-with-stethoscope-on-picture-id1233105515?k=20&m=1233105515&s=612x612&w=0&h=5M58xSgdEH4JtumYfTw73l1G7pFIZCxrNB-IYP7r-Bk='),
    Doktor(
        'Psikiyatrist',
        'Emin Atış',
        'https://media.istockphoto.com/photos/professional-plastic-surgeon-wearing-stethoscope-on-neck-picture-id1158131569?k=20&m=1158131569&s=612x612&w=0&h=nnRgWkA9igMkedUuNS2inT7Wmg_Hooii68sIid_Fuao=',
        ),
  ];

  List<Doktor> bulunandoktorlar = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      bulunandoktorlar = doktorlar;
    });
  }

  onSearch(String search) {
    setState(() {
      bulunandoktorlar = doktorlar
          .where((doktor) => doktor.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Aramak istediğiniz bölüm"),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: bulunandoktorlar.length > 0
            ? ListView.builder(
                itemCount: bulunandoktorlar.length,
                itemBuilder: (context, index) {
                  return doktorComponent(doktor: bulunandoktorlar[index]);
                })
            : Center(
                child: Text(
                "Bu bölümle ilgili bir uzman yok",
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }

  doktorComponent({required Doktor doktor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(children: [
              Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(doktor.image),
                  )),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(doktor.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text(doktor.username,
                    style: TextStyle(color: Colors.grey[500])),
              ]),
            ]),
          ),
          IconButton(
              icon: Icon(Icons.arrow_forward),color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoktorProfile()));
              }),
        ],
      ),
    );
  }
}
