import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:in_app_review/in_app_review.dart';
import 'about_page.dart';
import 'privacy_policy_page.dart';
import 'app_language.dart';

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
  final List<Map<String, dynamic>> arabicAlphabets = [
    {'ar': 'ا', 'bn': 'আলিফ', 'en': 'Alif'},
    {'ar': 'ب', 'bn': 'বা', 'en': 'Ba'},
    {'ar': 'ت', 'bn': 'তা', 'en': 'Ta'},
    {'ar': 'ث', 'bn': 'ছা', 'en': 'Tha'},
    {'ar': 'ج', 'bn': 'জীম', 'en': 'Jeem'},
    {'ar': 'ح', 'bn': 'হা', 'en': 'Ha', 'audioName': 'ha'},
    {'ar': 'خ', 'bn': 'খা', 'en': 'Kha'},
    {'ar': 'د', 'bn': 'দাল', 'en': 'Dal'},
    {'ar': 'ذ', 'bn': 'যাল', 'en': 'Thal'},
    {'ar': 'ر', 'bn': 'র', 'en': 'Ra'},
    {'ar': 'ز', 'bn': 'যা', 'en': 'Za'},
    {'ar': 'س', 'bn': 'সীন', 'en': 'Seen'},
    {'ar': 'ش', 'bn': 'শীন', 'en': 'Sheen'},
    {'ar': 'ص', 'bn': 'সোয়াদ', 'en': 'Sad'},
    {'ar': 'ض', 'bn': 'দোয়াদ', 'en': 'Dad'},
    {'ar': 'ط', 'bn': 'তোয়া', 'en': 'Taa'},
    {'ar': 'ظ', 'bn': 'যোয়া', 'en': 'Zaa'},
    {'ar': 'ع', 'bn': 'আইন', 'en': 'Ain'},
    {'ar': 'غ', 'bn': 'গাইন', 'en': 'Ghain'},
    {'ar': 'ف', 'bn': 'ফা', 'en': 'Fa'},
    {'ar': 'ق', 'bn': 'ক্বাফ', 'en': 'Qaf'},
    {'ar': 'ك', 'bn': 'কাফ', 'en': 'Kaf'},
    {'ar': 'ل', 'bn': 'লাম', 'en': 'Lam'},
    {'ar': 'م', 'bn': 'মীম', 'en': 'Meem'},
    {'ar': 'ن', 'bn': 'নুন', 'en': 'Noon'},
    {'ar': 'و', 'bn': 'ওয়াও', 'en': 'Waw'},
    {'ar': 'ه', 'bn': 'হা', 'en': 'Ha', 'audioName': 'haa'},
    {'ar': 'لا', 'bn': 'লাম আলিফ', 'en': 'Lam Alif'},
    {'ar': 'ء', 'bn': 'হামজা', 'en': 'Hamza'},
    {'ar': 'ي', 'bn': 'ইয়া', 'en': 'Ya'},
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _rateApp() async {
    final isBangla = appLanguageBangla.value;
    int selectedStars = 5;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: Colors.white,
            title: Text(
              isBangla ? 'আপনার মতামত দিন' : 'Rate Horof',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFF5A189A),
                fontSize: 22,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isBangla
                      ? 'অ্যাপটি আপনার কেমন লেগেছে? স্টার দিয়ে আমাদের জানান!'
                      : 'How much do you like the app? Give us some stars!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < selectedStars
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: const Color(0xFFFFD166),
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStars = index + 1;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  isBangla ? 'পরে' : 'Later',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A189A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  Navigator.pop(context);
                  try {
                    final inAppReview = InAppReview.instance;
                    await inAppReview.openStoreListing();
                  } catch (e) {
                    if (!mounted) return;
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          isBangla
                              ? 'প্লে-স্টোর ওপেন করা যাচ্ছে না।'
                              : 'Could not open Play Store.',
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  isBangla ? 'রেট দিন' : 'Rate Now',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appLanguageBangla,
      builder: (context, isBangla, _) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: _buildDrawer(context, isBangla),
          bottomNavigationBar: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFE0F7FA),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'A Product of Bangladesh 🇧🇩',
                style: TextStyle(
                  color: Color(0xFF5A189A),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        // Menu Button
                        GestureDetector(
                          onTap: () => _scaffoldKey.currentState?.openDrawer(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.menu_rounded,
                              color: Color(0xFF5A189A),
                              size: 26,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Title
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFD166),
                                    size: 24,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    isBangla
                                        ? 'Horof - আরবি হরফ'
                                        : 'Horof - Arabic',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF5A189A),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFD166),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Language Switch Button
                        GestureDetector(
                          onTap: () {
                            appLanguageBangla.value = !appLanguageBangla.value;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF5A189A), Color(0xFF9D4EDD)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.translate_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  isBangla ? 'EN' : 'BN',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Grid View
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 32.0,
                        ),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 130,
                                crossAxisSpacing: 16,
                                mainAxisSpacing:
                                    20, // Extra main axis spacing for the 3D pop
                                childAspectRatio: 0.85,
                              ),
                          itemCount: arabicAlphabets.length,
                          itemBuilder: (context, index) {
                            final alphabet = arabicAlphabets[index];
                            final colorSet =
                                cardColors[index % cardColors.length];
                            return AlphabetCard(
                              index: index,
                              alphabet: alphabet['ar']!,
                              pronunciation: isBangla
                                  ? alphabet['bn']!
                                  : alphabet['en']!,
                              audioName:
                                  alphabet['audioName'] ??
                                  alphabet['en']
                                      .toString()
                                      .toLowerCase()
                                      .replaceAll(' ', '_'),
                              color: colorSet.base,
                              shadowColor: colorSet.shadow,
                            );
                          },
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer(BuildContext context, bool isBangla) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF5A189A), Color(0xFF9D4EDD)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/Horof.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) return child;
                          return frame != null
                              ? child
                              : const Center(
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              'Error',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Horof',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      isBangla
                          ? 'আরবি হরফ শেখার অ্যাপ'
                          : 'Arabic Alphabet Learning App',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _buildDrawerItem(
                icon: Icons.star_rounded,
                iconColor: const Color(0xFFFFD166),
                label: isBangla ? 'অ্যাপ রেটিং দিন ⭐' : 'Rate App ⭐',
                onTap: () {
                  Navigator.pop(context);
                  _rateApp();
                },
              ),
              _buildDrawerItem(
                icon: Icons.info_rounded,
                iconColor: const Color(0xFF118AB2),
                label: isBangla ? 'অ্যাপ সম্পর্কে' : 'About App',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutPage()),
                  );
                },
              ),
              _buildDrawerItem(
                icon: Icons.shield_rounded,
                iconColor: const Color(0xFF06D6A0),
                label: isBangla ? 'প্রাইভেসি পলিসি' : 'Privacy Policy',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  isBangla
                      ? '© ${DateTime.now().year} Horof. সর্বস্বত্ব সংরক্ষিত।'
                      : '© ${DateTime.now().year} Horof. All Rights Reserved.',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey,
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
  final String audioName;
  final Color color;
  final Color shadowColor;

  const AlphabetCard({
    super.key,
    required this.index,
    required this.alphabet,
    required this.pronunciation,
    required this.audioName,
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
      debugPrint("Playing asset: audio/${widget.audioName}.mp3");
      await _audioPlayer.play(AssetSource('audio/${widget.audioName}.mp3'));
    } catch (e) {
      debugPrint("Audio Error: $e");
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
                fontSize: 48,
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
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.pronunciation,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: widget
                        .shadowColor, // Harmonize text with the card's 3D shadow
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
