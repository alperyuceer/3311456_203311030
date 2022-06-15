import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HakkimdaPage extends StatefulWidget {
  const HakkimdaPage({Key? key}) : super(key: key);

  @override
  State<HakkimdaPage> createState() => _HakkimdaPageState();
}

class _HakkimdaPageState extends State<HakkimdaPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Merhaba'),
                TypewriterAnimatedText('Ben ALPER YÜCEER'),
                TypewriterAnimatedText(
                    'Selçuk Üniversitesi\'nde bilgisayar mühendisliği öğrencisiyim'),
                TypewriterAnimatedText(
                    'Ahmet Cevahir Çınar hocama sevgilerle...'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ),
    );
  }
}
