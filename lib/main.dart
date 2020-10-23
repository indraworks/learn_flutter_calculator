import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Calculator(title: 'Simple Calculator'));
  }
}

class Calculator extends StatefulWidget {
  //constructor
  Calculator({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayString = '0';
  String numberString = '0';
  Widget createRow(String title1, String title2, String title3, String title4) {
    return Expanded(
      child: Row(
        children: [
          createButton(title1),
          createButton(title2),
          createButton(title3),
          createButton(title4)
        ],
      ),
    );
  }

  Widget createButton(String title) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity, //pilihan double infinity adlaah utk tiggi
        //harus ada container kalau gak ada diatas atau bawahnya maka error
        child: OutlineButton(
          onPressed: () => pressButton(title),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          borderSide: BorderSide(color: Colors.grey[300], width: 2),
        ),
        highlightColor: Colors.black,
      ),
    );
  }

  pressButton(String title) {
    // -+/*=CE tiak ditampilkan
    //mengubah tampilan dgn setState(){}
    setState(() {
      if (title == '-' ||
          title == '+' ||
          title == '*' ||
          title == '/' ||
          title == '=') {
        numberString = '';
      } else if (title == 'CE') {
        numberString = '';
        displayString = '0';
      } else {
        //check angka 0 pling kri
        if (numberString == '0' || numberString == '0.0') {
          numberString = '';
        }
        numberString += title;
        displayString = numberString;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      color: Color.fromARGB(10, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Text(
                              displayString,
                              style: TextStyle(
                                fontSize: 65,
                              ), //argument dulu ,baru sifat argument
                            )),
                      ))),
              Expanded(
                child: Column(children: [
                  createRow('+', '-', '*', '/'),
                  createRow('7', '8', '9', '0'),
                  createRow('4', '5', '6', 'CE'),
                  createRow('1', '2', '3', '='),
                ]),
              )
            ],
          )),
    );
  }
}

/*
catatan jika suatu widget berulang2 dibuat propertiesnya dngn angka berbeda
 dan sama maka kita akan buat sbyah function nah function itu akan return berupa widget
kita hanay pasing arugment lewat parameter func widget tadi sbb

Widget createButton(String value) {
  return ButtonTheme(
    ...value
  )
}
tentang epanded ,
jika ada dalam container anak2 /child mis 3 ada pemisah ruang 
maka bisa isi ful masing2 dgn dikasih expanded
https://medium.com/flutter-community/flutter-expanded-widget-e203590f00cf
expandednya commandya  di didepan child 
caranya sorot Container kmudian kklik  kanan pada bola lampu kuning, ada menu pilihan wrap with new idget
ini maksudnya kita kurng smua didalam widget yg baru <--kmudian ganti namanya
dgn Expanded(child ..)


kita rapikan agar pnggirnya smua body /outlinenya dekat garis pling luar layar hp
dgn dilakuakn body :center ganti padding,
padding:edge.insets.all(10.0) ->nilai 10 ini tpis

//utk text 0 ditengah pertama lakukan alignment pilihan alignment: FractionalOffset.bottomRight
setlahnya baru kuta rap dgn padding  edge isnetAll 20.0


lakukan hal yg sama utk rapihkan /expandedpada  row
kalau mau ubah style sbuah widget pastinya harus di dalah krung  dari widget tsb
conth Text(
  textStyle
)
*/
