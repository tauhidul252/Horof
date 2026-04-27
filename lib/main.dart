import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horof',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9C27B0), // Vibrant purple
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default fallback
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
  // 28 Arabic Alphabets
  final List<Map<String, String>> arabicAlphabets = [
    {'ar': 'ا', 'bn': 'আলিফ'},
    {'ar': 'ب', 'bn': 'বা'},
    {'ar': 'ت', 'bn': 'তা'},
    {'ar': 'ث', 'bn': 'ছা'},
    {'ar': 'ج', 'bn': 'জীম'},
    {'ar': 'ح', 'bn': 'হা'},
    {'ar': 'خ', 'bn': 'খা'},
    {'ar': 'د', 'bn': 'দাল'},
    {'ar': 'ذ', 'bn': 'যাল'},
    {'ar': 'ر', 'bn': 'র'},
    {'ar': 'ز', 'bn': 'যা'},
    {'ar': 'س', 'bn': 'সীন'},
    {'ar': 'ش', 'bn': 'শীন'},
    {'ar': 'ص', 'bn': 'সোয়াদ'},
    {'ar': 'ض', 'bn': 'দোয়াদ'},
    {'ar': 'ط', 'bn': 'তোয়া'},
    {'ar': 'ظ', 'bn': 'যোয়া'},
    {'ar': 'ع', 'bn': 'আইন'},
    {'ar': 'غ', 'bn': 'গাইন'},
    {'ar': 'ف', 'bn': 'ফা'},
    {'ar': 'ق', 'bn': 'ক্বাফ'},
    {'ar': 'ك', 'bn': 'কাফ'},
    {'ar': 'ل', 'bn': 'লাম'},
    {'ar': 'م', 'bn': 'মীম'},
    {'ar': 'ن', 'bn': 'নুন'},
    {'ar': 'و', 'bn': 'ওয়াও'},
    {'ar': 'ه', 'bn': 'হা'},
    {'ar': 'لا', 'bn': 'লাম আলিফ'},
    {'ar': 'ء', 'bn': 'হামজা'},
    {'ar': 'ي', 'bn': 'ইয়া'},
  ];

  // A playful color palette for the cards
  final List<Color> cardColors = [
    Colors.red.shade400,
    Colors.green.shade400,
    Colors.blue.shade400,
    Colors.orange.shade400,
    Colors.purple.shade400,
    Colors.teal.shade400,
    Colors.pink.shade400,
    Colors.amber.shade500,
    Colors.cyan.shade400,
    Colors.indigo.shade400,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Horof - আরবি হরফ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
          itemCount: arabicAlphabets.length,
          itemBuilder: (context, index) {
            final alphabet = arabicAlphabets[index];
            final color = cardColors[index % cardColors.length];
            return AlphabetCard(
              index: index,
              alphabet: alphabet['ar']!,
              pronunciation: alphabet['bn']!,
              color: color,
            );
          },
        ),
      ),
      ), // Close Directionality
    );
  }
}

class AlphabetCard extends StatefulWidget {
  final int index;
  final String alphabet;
  final String pronunciation;
  final Color color;

  const AlphabetCard({
    super.key,
    required this.index,
    required this.alphabet,
    required this.pronunciation,
    required this.color,
  });

  @override
  State<AlphabetCard> createState() => _AlphabetCardState();
}

class _AlphabetCardState extends State<AlphabetCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _handleTap() async {
    // Play bounce animation
    await _controller.forward();
    _controller.reverse();

    try {
      // Play audio from local asset for offline use
      await _audioPlayer.play(AssetSource('audio/letter_${widget.index}.mp3'));
    } catch (e) {
      print("Audio Error: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
              const BoxShadow(
                color: Colors.white24,
                blurRadius: 4,
                offset: Offset(-2, -2),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.color.withValues(alpha: 0.8),
                widget.color,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.alphabet,
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.pronunciation,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
