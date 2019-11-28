import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

List<String> _imageList=[
  'images/aprilia.png',
  'images/bambang.png',
  'images/deni.png',
  'images/devia.png',
  'images/eko.png',
  'images/lindswell.png',
  'images/rika.png',
  'images/tya.png',
  'images/zohri.png',
  'images/ginting.png'];
List<String> _titleList=[
  'Aprilia Santini Manganang',
  'Bambang Pamungkas',
  'Deni Sumargo',
  'Devia Rosmaniar',
  'Eko Yuli Irawan',
  'Lindswell Kwok',
  'Rika Wijayanti',
  'Tya Ariestya',
  'Lalu Muhammad Zohri',
  'Anthony Sinisuka Ginting'];
List<String> _descriptionList=[
  'Ada satu hal yang menarik dari salah satu anggota tim voli putri Indonesia pada Asian Games 2018 beberapa waktu lalu. Adalah Aprilia Santini Manganang, wanita tomboy yang mencuri perhatian masyarakat karena kemampuannya bermain voli begitu menakjubkan.',
  'Bambang Pamungkas (lahir di Semarang, Jawa Tengah, 10 Juni 1980; umur 39 tahun), juga dikenal sebagai Bepe, adalah pemain sepak bola Indonesia yang bermain untuk Persija Jakarta di Liga Super Indonesia dan Tim nasional sepak bola Indonesia. Posisi alami nya adalah striker.',
  'Denny Sumargo adalah seorang pemain basket Indonesia. Ia pernah bermain untuk tim Satria Muda. Penggemar Michael Jordan dan Kobe Bryant yang memang bercita-cita menjadi pemain basket profesional ini sebelumnya lebih dulu bergabung bersama tim Astac. Kini, Denny mendedikasikan dirinya dengan tim Garuda Speedy Bandung.',
  'Defia Rosmaniar adalah seorang atlet berkebangsaan Indonesia. Namanya begitu dikenal seketika ia menyumbangkan medali emas untuk Indonesia pada Asian Games 2018.',
  'Eko Yuli Irawan adalah atlet angkat besi Indonesia. Di Olimpiade Beijing 2008 Eko meraih medali perunggu. Sebelumnya di kejuaraan angkat besi dunia yunior di Praha, Republik Ceko tahun 2007, Eko meraih emas dan mendapatkan penghargaan sebagai the best lifter pada turnamen tersebut.',
  'Lindswell adalah seorang atlet wushu Indonesia yang berasal dari Sumatra Utara. Lindswell telah mencatat berbagai prestasi saat mewakili Sumatra Utara dan Indonesia sebagai atlet muda wushu di berbagai kejuaraan nasional maupun internasional.',
  'Atlet putri paralayang, Rika Wijayanti, menjadi satu-satunya atlet Indonesia yang berhasil meraih tiga medali pada gelaran Asian Games 2018.',
  'Tya Ariestya (lahir 30 Maret 1986; umur 33 tahun) yang bernama lengkap Ariestya Noormita Azhar adalah aktris sinetron dan film Indonesia. Lahir dari ayah berdarah Melayu Tanjung Balai Sumut dan ibu berdarah Batak boru Hasibuan.',
  'Lalu Muhammad Zohri (lahir 1 Juli 2000) adalah seorang pelari muda 100 meter Indonesia yang berhasil meraih medali emas dan menjadi juara dunia pada Kejuaraan Dunia Atletik Junior 2018 yang berlangsung di Tampere, Finlandia.',
  'Anthony Sinisuka Ginting adalah pebulutangkis Indonesia yang berasal dari klub SGS PLN Bandung. Ia memulai karier sebagai pebulutangkis prestasi semenjak duduk di bangku SD dan pernah memenangi kompetisi MILO School Competition kategori tunggal putra SD pada tahun 2008.'];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas3 AbbasAdamAzZuhri',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atlet Republik Indonesia'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: _getTiles(_imageList,context),
      ),
    );
  }
}

class Detail extends StatelessWidget{
  Detail(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[index]),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              _imageList[index],
              height: 250.0,
              width: 412.0,
              fit: BoxFit.fill,
            ),
            Container(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _titleList[index],
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                _descriptionList[index],
                style: TextStyle(
                    fontSize: 18.0
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Get grid tiles
List<Widget> _getTiles(List<String> iconList,BuildContext context) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < iconList.length; i++) {
    tiles.add(new GridTile(
        child: new InkResponse(
          enableFeedback: true,
          child: new Image.asset(iconList[i], fit: BoxFit.cover,),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context){
                return Detail(i);
              })),
        )));
  }
  return tiles;
}