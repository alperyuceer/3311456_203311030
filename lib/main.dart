// ignore_for_file: prefer_const_constructors, unnecessary_new, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/giris_yada_kayit.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("vkiveriler");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vücudunu Tanı",
      home: GirisYaDaKayitPage(),
    );
  }
}

double vkihesapla(int vkiboy, int vkikilo) {
  double vki = vkikilo / (vkiboy / 100 * vkiboy / 100);
  return vki;
}

String sismanlikOlcer(double vki) {
  if (0 < vki && vki < 18.4) {
    return "Zayıfsınız";
  } else if (18.5 < vki && vki < 24.9) {
    return "Normal Kilodasınız";
  } else if (25 < vki && vki < 29.9) {
    return "Fazla Kilolusunuz";
  } else if (30 < vki && vki < 34.9) {
    return "1.Derece Obezsiniz";
  } else if (35 < vki && vki < 44.9) {
    return "2.Derece Obezsiniz";
  } else if (vki > 45) {
    return "Aşırı Şişmansınız";
  } else
    () {
      return "Hatalı Kilo Ya Da Boy";
    };
  return "";
}
