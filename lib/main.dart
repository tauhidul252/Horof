import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horof',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HorofHomePage(),
    );
  }
}

class HorofHomePage extends StatefulWidget {
  const HorofHomePage({super.key});

  @override
  State<HorofHomePage> createState() => _HorofHomePageState();
}

class _HorofHomePageState extends State<HorofHomePage> {
  final FlutterTts _flutterTts = FlutterTts();

  final List<Map<String, String>> horofLanguages = [
    {'language': 'Arabic', 'script': 'حروف', 'langCode': 'ar-SA'},
    {'language': 'Bengali', 'script': 'হরফ', 'langCode': 'bn-BD'},
    {'language': 'Korean', 'script': '호로프', 'langCode': 'ko-KR'},
    {'language': 'Chinese', 'script': '霍罗夫', 'langCode': 'zh-CN'},
  ];

  void _speakHorof(String script, String langCode) async {
    await _flutterTts.setLanguage(langCode);
    await _flutterTts.speak(script);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horof - Learn Pronunciations'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: horofLanguages.length,
          itemBuilder: (context, index) {
            final lang = horofLanguages[index];
            return Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: InkWell(
                onTap: () => _speakHorof(lang['script']!, lang['langCode']!),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lang['script']!,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textDirection: lang['language'] == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        lang['language']!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }
}
