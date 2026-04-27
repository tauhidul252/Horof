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
        useMaterial3: true,
        fontFamily: 'Roboto', // Fallback, but we use heavy weights
      ),
      home: const HorofHomePage(),
    );
  }
}

class CardColorSet {
  final Color base;
  final Color shadow;
  CardColorSet(this.base, this.shadow);
}

class HorofHomePage extends StatefulWidget {
  const HorofHomePage({super.key});

  @override
  State<HorofHomePage> createState() => _HorofHomePageState();
}

class _HorofHomePageState extends State<HorofHomePage> {
  // 30 Arabic Alphabets
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

  // Super vibrant color palette with dark shadows for 3D effect
  final List<CardColorSet> cardColors = [
    CardColorSet(const Color(0xFFFF6B6B), const Color(0xFFC92A2A)), // Red
    CardColorSet(const Color(0xFF4ECDC4), const Color(0xFF0B7285)), // Teal
    CardColorSet(const Color(0xFFFFD166), const Color(0xFFE67700)), // Yellow
    CardColorSet(const Color(0xFF118AB2), const Color(0xFF073B4C)), // Blue
    CardColorSet(const Color(0xFF9D4EDD), const Color(0xFF5A189A)), // Purple
    CardColorSet(const Color(0xFF06D6A0), const Color(0xFF028090)), // Green
    CardColorSet(const Color(0xFFFF9F1C), const Color(0xFFD62828)), // Orange
    CardColorSet(const Color(0xFFEF476F), const Color(0xFF9E0059)), // Pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFF3E5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Playful Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star_rounded, color: Color(0xFFFFD166), size: 36),
                      SizedBox(width: 12),
                      Text(
                        'Horof - আরবি হরফ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF5A189A),
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.star_rounded, color: Color(0xFFFFD166), size: 36),
                    ],
                  ),
                ),
              ),
              
              // Grid View
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 24, // Extra main axis spacing for the 3D pop
                        childAspectRatio: 0.8,
                      ),
                      itemCount: arabicAlphabets.length,
                      itemBuilder: (context, index) {
                        final alphabet = arabicAlphabets[index];
                        final colorSet = cardColors[index % cardColors.length];
                        return AlphabetCard(
                          index: index,
                          alphabet: alphabet['ar']!,
                          pronunciation: alphabet['bn']!,
                          color: colorSet.base,
                          shadowColor: colorSet.shadow,
                        );
                      },
                    ),
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

class AlphabetCard extends StatefulWidget {
  final int index;
  final String alphabet;
  final String pronunciation;
  final Color color;
  final Color shadowColor;

  const AlphabetCard({
    super.key,
    required this.index,
    required this.alphabet,
    required this.pronunciation,
    required this.color,
    required this.shadowColor,
  });

  @override
  State<AlphabetCard> createState() => _AlphabetCardState();
}

class _AlphabetCardState extends State<AlphabetCard> {
  bool _isPressed = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) async {
    setState(() => _isPressed = false);
    _playSound();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  void _playSound() async {
    try {
      // Create a new instance for rapid tapping, or reuse existing one
      await _audioPlayer.play(AssetSource('audio/letter_${widget.index}.mp3'));
    } catch (e) {
      print("Audio Error: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        margin: EdgeInsets.only(top: _isPressed ? 8.0 : 0.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 3,
          ),
          boxShadow: _isPressed
              ? [] // Shadow disappears when pressed
              : [
                  BoxShadow(
                    color: widget.shadowColor,
                    offset: const Offset(0, 8),
                    blurRadius: 0, // Solid shadow for 3D effect
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.alphabet,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.1,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Text(
                widget.pronunciation,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: widget.shadowColor, // Harmonize text with the card's 3D shadow
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
