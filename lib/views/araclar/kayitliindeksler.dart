import 'package:flutter/material.dart';
import 'package:vucudunu_tani/service/hivservice.dart';

class KayitliIndekslerPage extends StatefulWidget {
  const KayitliIndekslerPage({Key? key}) : super(key: key);

  @override
  State<KayitliIndekslerPage> createState() => _KayitliIndekslerPageState();
}

class _KayitliIndekslerPageState extends State<KayitliIndekslerPage> {
  @override
  Widget build(BuildContext context) {
    late List<String> kayitlilar;
    kayitlilar = HiveService.getirIndeksler()!;
    return Scaffold(
        body: ListView.builder(
            itemCount: kayitlilar.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.save),
                  title: Text("${kayitlilar[index]}   BMI"),
                ),
              );
            }));
  }
}
