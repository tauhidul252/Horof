import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'app_language.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '1.0.0';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    if (kIsWeb) return;
    try {
      final info = await PackageInfo.fromPlatform();
      if (mounted) setState(() => _version = info.version);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appLanguageBangla,
      builder: (context, isBangla, _) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
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
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
                            ),
                            child: const Icon(Icons.arrow_back_ios_rounded, color: Color(0xFF5A189A), size: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            isBangla ? 'অ্যাপ সম্পর্কে' : 'About App',
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF5A189A)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      child: isBangla ? _buildBanglaContent() : _buildEnglishContent(),
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

  Widget _buildBanglaContent() {
    return Column(
      children: [
        // Hero Section
        _buildHeroCard(),
        const SizedBox(height: 16),

        _buildInfoCard(
          icon: Icons.auto_awesome_rounded, iconColor: const Color(0xFFFFD166),
          title: 'অ্যাপ সম্পর্কে',
          content: 'Horof হলো শিশুদের জন্য তৈরি একটি বিশেষ আরবি বর্ণমালা শিক্ষার অ্যাপ। এই অ্যাপটির মাধ্যমে শিশুরা মজাদার রঙিন কার্ড এবং অডিও উচ্চারণের সাহায্যে সহজেই আরবি হরফগুলো শিখতে পারে। প্রতিটি হরফের সাথে বাংলায় উচ্চারণ দেওয়া আছে, যা বাংলাভাষী শিশুদের শেখাকে আরো সহজ করে তোলে।',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.stars_rounded, iconColor: const Color(0xFFFF9F1C),
          title: 'মূল বৈশিষ্ট্যসমূহ',
          content: '✅ সম্পূর্ণ ৩০টি আরবি হরফ একসাথে\n'
              '✅ প্রতিটি হরফের বাংলায় উচ্চারণ\n'
              '✅ স্পষ্ট ও শুদ্ধ অডিও উচ্চারণ\n'
              '✅ রঙিন ও আকর্ষণীয় 3D কার্ড ডিজাইন\n'
              '✅ কার্ড চাপলে অডিও বাজে\n'
              '✅ সম্পূর্ণ ইন্টারনেট ছাড়াই কাজ করে\n'
              '✅ কোনো বিজ্ঞাপন নেই, সম্পূর্ণ বিনামূল্যে\n'
              '✅ শিশুবান্ধব সহজ ইন্টারফেস\n'
              '✅ ডান থেকে বামে আরবি বিন্যাস (RTL)',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.school_rounded, iconColor: const Color(0xFF118AB2),
          title: 'কেন Horof ব্যবহার করবেন?',
          content: '📌 সঠিক আরবি উচ্চারণ: প্রতিটি হরফের জন্য আলাদা অডিও রেকর্ডিং রয়েছে যা শিশুদের সঠিক উচ্চারণ শিখতে সাহায্য করে।\n\n'
              '📌 আকর্ষণীয় ডিজাইন: রঙিন 3D কার্ড শিশুদের মনোযোগ ধরে রাখে এবং শেখাকে আনন্দময় করে তোলে।\n\n'
              '📌 অফলাইন ব্যবহার: একবার ডাউনলোড করলেই সবসময় ব্যবহার করা যাবে, ইন্টারনেটের প্রয়োজন নেই।\n\n'
              '📌 নিরাপদ ও পরিষ্কার: কোনো বিজ্ঞাপন, বাহ্যিক লিঙ্ক বা বিরক্তিকর পপ-আপ নেই।',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.menu_book_rounded, iconColor: const Color(0xFF9D4EDD),
          title: 'আরবি হরফের তালিকা',
          content: 'এই অ্যাপে মোট ৩০টি আরবি হরফ রয়েছে:\n\n'
              'ا (আলিফ) • ب (বা) • ت (তা) • ث (ছা) • ج (জীম) • ح (হা) • خ (খা) • د (দাল) • ذ (যাল) • ر (রা) • ز (যা) • س (সীন) • ش (শীন) • ص (সোয়াদ) • ض (দোয়াদ) • ط (তোয়া) • ظ (যোয়া) • ع (আইন) • غ (গাইন) • ف (ফা) • ق (ক্বাফ) • ك (কাফ) • ل (লাম) • م (মীম) • ن (নুন) • و (ওয়াও) • ه (হা) • لا (লাম আলিফ) • ء (হামজা) • ي (ইয়া)',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.person_rounded, iconColor: const Color(0xFF06D6A0),
          title: 'ডেভলপার তথ্য',
          content: '👨‍💻 ডেভলপার: তাউহিদুল ইসলাম\n'
              '🌍 দেশ: বাংলাদেশ\n'
              '📱 অ্যাপের ধরন: শিশু শিক্ষামূলক\n'
              '📦 প্যাকেজ নাম: com.tauhidul.horof\n'
              '🗓️ প্রকাশের বছর: ২০২৫\n\n'
              'এই অ্যাপটি মুসলিম শিশুদের কুরআন পড়ার প্রস্তুতি হিসেবে আরবি বর্ণমালা শেখার সুযোগ দেওয়ার লক্ষ্যে তৈরি করা হয়েছে।',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.child_care_rounded, iconColor: const Color(0xFFEF476F),
          title: 'বয়সসীমা ও রেটিং',
          content: '👶 উপযুক্ত বয়স: ৩ বছর ও তার উপরে\n'
              '🔞 কন্টেন্ট রেটিং: সকলের জন্য (Everyone)\n'
              '🛡️ শিশু নিরাপত্তা: COPPA সম্মত\n'
              '📵 ডেটা সংগ্রহ: কোনো ব্যক্তিগত তথ্য সংগ্রহ হয় না\n'
              '🚫 বিজ্ঞাপন: কোনো বিজ্ঞাপন নেই\n'
              '💰 মূল্য: সম্পূর্ণ বিনামূল্যে',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.update_rounded, iconColor: const Color(0xFF4ECDC4),
          title: 'ভার্সন তথ্য',
          content: '📱 বর্তমান ভার্সন: $_version\n'
              '🛠️ ন্যূনতম অ্যান্ড্রয়েড: Android 5.0 (API 21)\n'
              '🎯 লক্ষ্য অ্যান্ড্রয়েড: Android 14+\n'
              '📐 আর্কিটেকচার: ARM64, ARMv7, x86_64\n'
              '🔧 প্রযুক্তি: Flutter (Dart)\n'
              '📦 ফাইল সাইজ: প্রায় ৪০ MB',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.favorite_rounded, iconColor: const Color(0xFFFF6B6B),
          title: 'আমাদের অনুপ্রেরণা',
          content: 'প্রতিটি মুসলিম শিশুর স্বপ্ন হলো কুরআন পড়তে শেখা। কিন্তু আরবি হরফ না জানলে সেই স্বপ্ন পূরণ করা কঠিন। Horof অ্যাপটি তৈরি হয়েছে সেই প্রথম পদক্ষেপটা সহজ করে দেওয়ার জন্য — যাতে শিশুরা খেলার ছলে আরবি হরফ শিখতে পারে এবং কুরআন পড়ার পথে এগিয়ে যেতে পারে।',
        ),

        const SizedBox(height: 20),
        _buildVersionBadge(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEnglishContent() {
    return Column(
      children: [
        _buildHeroCard(),
        const SizedBox(height: 16),

        _buildInfoCard(
          icon: Icons.auto_awesome_rounded, iconColor: const Color(0xFFFFD166),
          title: 'About the App',
          content: 'Horof is a special Arabic alphabet learning app designed for children. Through this app, children can easily learn Arabic letters using fun, colorful cards and audio pronunciation. Each letter includes its pronunciation in Bengali, making learning even easier for Bengali-speaking children.',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.stars_rounded, iconColor: const Color(0xFFFF9F1C),
          title: 'Key Features',
          content: '✅ All 30 Arabic letters in one place\n'
              '✅ Bengali pronunciation for each letter\n'
              '✅ Clear and accurate audio pronunciation\n'
              '✅ Colorful and attractive 3D card design\n'
              '✅ Tap a card to hear the audio\n'
              '✅ Works completely without internet\n'
              '✅ No ads, completely free\n'
              '✅ Child-friendly simple interface\n'
              '✅ Right-to-left Arabic layout (RTL)',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.school_rounded, iconColor: const Color(0xFF118AB2),
          title: 'Why Use Horof?',
          content: '📌 Correct Arabic Pronunciation: Each letter has its own audio recording that helps children learn proper pronunciation.\n\n'
              '📌 Engaging Design: Colorful 3D cards keep children\'s attention and make learning enjoyable.\n\n'
              '📌 Offline Use: Once downloaded, it can be used anytime — no internet needed.\n\n'
              '📌 Safe & Clean: No advertisements, external links, or annoying pop-ups.',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.menu_book_rounded, iconColor: const Color(0xFF9D4EDD),
          title: 'Arabic Letters Included',
          content: 'This app includes all 30 Arabic letters:\n\n'
              'ا (Alif) • ب (Ba) • ت (Ta) • ث (Tha) • ج (Jeem) • ح (Ha) • خ (Kha) • د (Dal) • ذ (Zal) • ر (Ra) • ز (Za) • س (Seen) • ش (Sheen) • ص (Sad) • ض (Dad) • ط (Ta) • ظ (Za) • ع (Ain) • غ (Ghain) • ف (Fa) • ق (Qaf) • ك (Kaf) • ل (Lam) • م (Meem) • ن (Noon) • و (Waw) • ه (Ha) • لا (Lam Alif) • ء (Hamza) • ي (Ya)',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.person_rounded, iconColor: const Color(0xFF06D6A0),
          title: 'Developer Info',
          content: '👨‍💻 Developer: Tauhidul Islam\n'
              '🌍 Country: Bangladesh\n'
              '📱 App Type: Children\'s Educational\n'
              '📦 Package Name: com.tauhidul.horof\n'
              '🗓️ Release Year: 2025\n\n'
              'This app was created to give Muslim children the opportunity to learn the Arabic alphabet as a foundation for reading the Quran.',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.child_care_rounded, iconColor: const Color(0xFFEF476F),
          title: 'Age Rating & Content',
          content: '👶 Suitable Age: 3 years and above\n'
              '🔞 Content Rating: Everyone\n'
              '🛡️ Child Safety: COPPA Compliant\n'
              '📵 Data Collection: No personal data collected\n'
              '🚫 Advertisements: No ads\n'
              '💰 Price: Completely Free',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.update_rounded, iconColor: const Color(0xFF4ECDC4),
          title: 'Version Information',
          content: '📱 Current Version: $_version\n'
              '🛠️ Minimum Android: Android 5.0 (API 21)\n'
              '🎯 Target Android: Android 14+\n'
              '📐 Architecture: ARM64, ARMv7, x86_64\n'
              '🔧 Technology: Flutter (Dart)\n'
              '📦 File Size: Approximately 40 MB',
        ),
        const SizedBox(height: 12),

        _buildInfoCard(
          icon: Icons.favorite_rounded, iconColor: const Color(0xFFFF6B6B),
          title: 'Our Inspiration',
          content: 'Every Muslim child dreams of learning to read the Quran. But without knowing the Arabic alphabet, that dream is hard to fulfill. Horof was created to make that first step easier — so children can learn the Arabic alphabet in a playful way and move forward on the path to reading the Quran.',
        ),

        const SizedBox(height: 20),
        _buildVersionBadge(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5A189A), Color(0xFF9D4EDD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 16, offset: Offset(0, 8))],
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white.withValues(alpha: 0.15),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/Horof.png',
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
          ),
          const SizedBox(height: 16),
          const Text('Horof', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text(
            appLanguageBangla.value ? 'আরবি হরফ শেখার অ্যাপ' : 'Arabic Alphabet Learning App',
            style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.verified_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  appLanguageBangla.value ? 'ভার্সন $_version  •  বিনামূল্যে  •  বিজ্ঞাপনমুক্ত' : 'Version $_version  •  Free  •  Ad-Free',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatChip(icon: Icons.menu_book_rounded, label: appLanguageBangla.value ? '৩০ হরফ' : '30 Letters'),
              _buildStatChip(icon: Icons.volume_up_rounded, label: appLanguageBangla.value ? 'অডিও' : 'Audio'),
              _buildStatChip(icon: Icons.wifi_off_rounded, label: appLanguageBangla.value ? 'অফলাইন' : 'Offline'),
              _buildStatChip(icon: Icons.child_care_rounded, label: appLanguageBangla.value ? 'বয়স ৩+' : 'Age 3+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222))),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 13.5, color: Color(0xFF444444), height: 1.75)),
        ],
      ),
    );
  }

  Widget _buildVersionBadge() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD166).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFFD166).withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: Color(0xFFE67700), size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              appLanguageBangla.value
                  ? 'Horof ভালো লাগলে একটি রেটিং দিন! এটি আমাদের আরো ভালো করতে অনুপ্রাণিত করে।'
                  : 'If you enjoy Horof, please leave a rating! It motivates us to keep improving.',
              style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFE67700), fontSize: 13, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
