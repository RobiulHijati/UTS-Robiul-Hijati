import 'package:flutter/material.dart';
import 'package:shoping_cart/models/item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Items? _item;
  int _counter = -1;

  void plusState() {
    setState(() {
      _counter++;
    });
  }

  void minState() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    if (args.containsKey('item')) {
      var item = args['item'];
      if (item is Items) {
        _item = item;
        if (_counter < 0) {
          _counter = _item?.quantity ?? -1;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                '${_item?.image}',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(_item?.nama ?? 'EROR',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Rp ${_item?.harga ?? 'XXXXX'}/Barang',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text(_item?.deks ?? 'EROR DEKS',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: minState,
                  icon: const Icon(Icons.remove_circle_rounded)),
              Text('$_counter',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
              IconButton(
                  onPressed: plusState,
                  icon: const Icon(Icons.add_circle_rounded)),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: const Size(100, 30)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('SUBMIT')),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
