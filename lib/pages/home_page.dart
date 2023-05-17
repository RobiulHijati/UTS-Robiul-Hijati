import 'package:flutter/material.dart';
import 'package:shoping_cart/models/item.dart';
import 'package:shoping_cart/widgets/card_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _listItem = [
    Items(
        id: 1,
        nama: 'Warior Biru',
        harga: 250000,
        quantity: 2,
        deks: 'asljfnasfa afljasnfasf asfasljfnasf asfljan',
        image: 'sepatuwarior_biru.jpg'),
    Items(
        id: 1,
        nama: 'Converse Cokelat',
        harga: 300000,
        quantity: 1,
        deks: 'asljfnasfa afljasnfasf asfasljfnasf asfljan',
        image: 'Converse_Cokelat.jpg'),
    Items(
        id: 1,
        nama: 'Convers Hitam',
        harga: 350000,
        quantity: 3,
        deks: 'asljfnasfa afljasnfasf asfasljfnasf asfljan',
        image: 'Converse_Hitam.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('TOTAL',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('RP XXXXXX',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
        children: _listItem
            .map((item) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/detail', arguments: {
                      'item': item,
                    });
                  },
                  child: CardItem(Items(
                      id: item.id,
                      nama: item.nama,
                      harga: item.harga,
                      quantity: item.quantity,
                      deks: item.deks,
                      image: item.image)),
                ))
            .toList(),
      ),
    );
  }
}
