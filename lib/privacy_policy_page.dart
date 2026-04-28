import 'package:flutter/material.dart';
import 'app_language.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
                        isBangla ? 'প্রাইভেসি পলিসি' : 'Privacy Policy',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF5A189A)),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
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
        _buildBanner(
          title: 'আপনার গোপনীয়তা আমাদের\nকাছে সবচেয়ে গুরুত্বপূর্ণ',
          subtitle: 'সর্বশেষ আপডেট: ২৮ এপ্রিল ২০২৫',
        ),
        const SizedBox(height: 16),
        _buildSection(
          icon: Icons.info_outline_rounded, iconColor: const Color(0xFF118AB2),
          title: '১. ভূমিকা ও পরিচিতি',
          content: 'Horof ("আমরা", "আমাদের") বাংলাদেশ থেকে পরিচালিত একটি শিশু শিক্ষামূলক অ্যাপ। এই প্রাইভেসি পলিসি আপনাকে স্পষ্টভাবে জানাবে যে আমরা কীভাবে আপনার বা আপনার সন্তানের তথ্য পরিচালনা করি। এই অ্যাপটি ব্যবহার করার মাধ্যমে আপনি এই পলিসির সম্পূর্ণ শর্তাবলীতে সম্মত হচ্ছেন।\n\nআমাদের লক্ষ্য হলো শিশুদের আরবি হরফ শেখানোর একটি নিরাপদ, মজাদার এবং বিজ্ঞাপনমুক্ত পরিবেশ তৈরি করা।',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.storage_rounded, iconColor: const Color(0xFF06D6A0),
          title: '২. তথ্য সংগ্রহ ও ব্যবহার',
          content: 'Horof অ্যাপটি কোনো ব্যক্তিগত তথ্য সংগ্রহ করে না।\n\n❌ আমরা কখনো সংগ্রহ করি না:\n• আপনার নাম, বয়স বা পরিচয়\n• ইমেইল ঠিকানা বা ফোন নম্বর\n• GPS অবস্থান বা ঠিকানা\n• ছবি, ভিডিও বা মিডিয়া ফাইল\n• ডিভাইসের কোনো তথ্য\n• ব্যবহারের ধরন বা অভ্যাস (Analytics)\n• কুকিজ বা ট্র্যাকিং ডেটা\n\n✅ আমরা শুধু সংরক্ষণ করি:\n• অ্যাপের স্বাভাবিক কার্যক্ষমতার জন্য অপরিহার্য ডেটা (সব লোকাল ডিভাইসে)',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.wifi_off_rounded, iconColor: const Color(0xFFFF9F1C),
          title: '৩. সম্পূর্ণ অফলাইন অ্যাপ',
          content: 'Horof একটি ১০০% অফলাইন অ্যাপ।\n\n• সমস্ত আরবি হরফের অডিও অ্যাপের ভেতরেই সংরক্ষিত\n• কোনো ডেটা ইন্টারনেটে পাঠানো হয় না\n• কোনো বাহ্যিক সার্ভারের সাথে সংযোগ নেই\n• ইন্টারনেট ছাড়াই সম্পূর্ণ ব্যবহারযোগ্য\n• কোনো ক্লাউড সিঙ্ক্রোনাইজেশন নেই',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.child_friendly_rounded, iconColor: const Color(0xFFEF476F),
          title: '৪. শিশুদের গোপনীয়তা (COPPA সম্মত)',
          content: 'আমরা মার্কিন COPPA (Children\'s Online Privacy Protection Act) আইন এবং আন্তর্জাতিক শিশু গোপনীয়তা নির্দেশিকা মেনে চলি।\n\n• ১৩ বছরের কম বয়সী শিশুদের কাছ থেকে কোনো ডেটা সংগ্রহ করা হয় না\n• অ্যাকাউন্ট বা লগইনের কোনো প্রয়োজন নেই\n• কোনো সোশ্যাল মিডিয়া ইন্টিগ্রেশন নেই\n• কোনো চ্যাট বা মেসেজিং ফিচার নেই\n• শিশুদের জন্য সম্পূর্ণ নিরাপদ কন্টেন্ট\n• কোনো বহিরাগত লিঙ্ক নেই (রেট আস পেজ ছাড়া)',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.block_rounded, iconColor: const Color(0xFFFF6B6B),
          title: '৫. বিজ্ঞাপন ও ইন-অ্যাপ কেনাকাটা',
          content: 'Horof সম্পূর্ণ বিজ্ঞাপনমুক্ত এবং বিনামূল্যে।\n\n❌ এই অ্যাপে নেই:\n• কোনো ধরনের বিজ্ঞাপন (Banner, Interstitial, Video)\n• তৃতীয় পক্ষের বিজ্ঞাপন নেটওয়ার্ক\n• ইন-অ্যাপ কেনাকাটা বা সাবস্ক্রিপশন\n• লুকানো চার্জ বা পেমেন্ট গেটওয়ে\n• পুরস্কারের বিনিময়ে ডেটা শেয়ার',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.security_rounded, iconColor: const Color(0xFF9D4EDD),
          title: '৬. ডেটা নিরাপত্তা',
          content: 'যেহেতু আমরা কোনো ব্যক্তিগত তথ্য সংগ্রহ করি না, তাই ডেটা ফাঁস বা হ্যাকিংয়ের কোনো ঝুঁকি নেই।\n\n• অ্যাপের সকল কন্টেন্ট এনক্রিপ্টেড অ্যান্ড্রয়েড প্যাকেজে সুরক্ষিত\n• কোনো থার্ড-পার্টি SDK বা অ্যানালিটিক্স টুল ব্যবহার করা হয় না\n• Google Play Protect দ্বারা যাচাইকৃত\n• নিয়মিত নিরাপত্তা আপডেট প্রদান করা হয়',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.share_rounded, iconColor: const Color(0xFF4ECDC4),
          title: '৭. তথ্য শেয়ার ও তৃতীয় পক্ষ',
          content: 'আমরা কোনো তথ্য তৃতীয় পক্ষের সাথে শেয়ার করি না।\n\n• কোনো ডেটা বিক্রি করা হয় না\n• কোনো পার্টনার বা অ্যাফিলিয়েটের সাথে শেয়ার নেই\n• সরকারি অনুরোধ ছাড়া কাউকে তথ্য দেওয়া হয় না (যদিও সংগ্রহ করা তথ্য নেই)\n\nব্যতিক্রম:\n• Google Play Store রেটিং সিস্টেম — শুধুমাত্র আপনি রেটিং দিতে চাইলে Google-এর সাথে সংযোগ হয়',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.gavel_rounded, iconColor: const Color(0xFFFFD166),
          title: '৮. আপনার অধিকার',
          content: 'ব্যবহারকারী হিসেবে আপনার নিম্নলিখিত অধিকার রয়েছে:\n\n• তথ্য দেখার অধিকার — (কোনো তথ্য সংগ্রহ হয় না)\n• তথ্য মুছে দেওয়ার অধিকার — অ্যাপ আনইনস্টল করলেই সব ডেটা মুছে যায়\n• তথ্য পোর্টেবিলিটি — প্রযোজ্য নয়\n• সম্মতি প্রত্যাহার — অ্যাপ ব্যবহার বন্ধ করলেই কার্যকর\n\nEU GDPR এবং বাংলাদেশের ডিজিটাল নিরাপত্তা আইন অনুযায়ী আপনার সকল অধিকার সংরক্ষিত।',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.update_rounded, iconColor: const Color(0xFF06D6A0),
          title: '৯. পলিসি পরিবর্তন',
          content: 'আমরা সময়ে সময়ে এই প্রাইভেসি পলিসি আপডেট করতে পারি।\n\n• যেকোনো গুরুত্বপূর্ণ পরিবর্তনের আগে অ্যাপের মধ্যে নোটিশ দেওয়া হবে\n• এই পেজে সর্বশেষ আপডেটের তারিখ পরিবর্তন হবে\n• বড় পরিবর্তনের ক্ষেত্রে আলাদা নোটিফিকেশন পাঠানো হতে পারে\n• আপডেটের পরেও অ্যাপ ব্যবহার অব্যাহত রাখলে নতুন পলিসিতে সম্মতি বলে ধরা হবে',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.contact_mail_rounded, iconColor: const Color(0xFFEF476F),
          title: '১০. যোগাযোগ করুন',
          content: 'এই প্রাইভেসি পলিসি সম্পর্কে কোনো প্রশ্ন, অভিযোগ বা পরামর্শ থাকলে নিচের মাধ্যমে আমাদের সাথে যোগাযোগ করুন:\n\n📱 অ্যাপ: Horof — আরবি হরফ শেখার অ্যাপ\n🌍 দেশ: বাংলাদেশ\n📦 প্যাকেজ: com.tauhidul.horof\n⏰ সাড়া দেওয়ার সময়: ৩-৭ কার্যদিবস',
        ),
        const SizedBox(height: 16),
        _buildSafetyBadge(isBangla: true),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEnglishContent() {
    return Column(
      children: [
        _buildBanner(
          title: 'Your Privacy Matters\nMost to Us',
          subtitle: 'Last Updated: April 28, 2025',
        ),
        const SizedBox(height: 16),
        _buildSection(
          icon: Icons.info_outline_rounded, iconColor: const Color(0xFF118AB2),
          title: '1. Introduction',
          content: 'Horof ("we", "our", "us") is a children\'s educational app operated from Bangladesh. This Privacy Policy clearly explains how we handle your or your child\'s information. By using this application, you agree to the complete terms and conditions of this policy.\n\nOur goal is to create a safe, fun, and ad-free environment to help children learn Arabic alphabets.',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.storage_rounded, iconColor: const Color(0xFF06D6A0),
          title: '2. Data Collection & Usage',
          content: 'The Horof app does NOT collect any personal information.\n\n❌ We NEVER collect:\n• Your name, age, or identity\n• Email address or phone number\n• GPS location or physical address\n• Photos, videos, or media files\n• Device information\n• Usage patterns or habits (Analytics)\n• Cookies or tracking data\n\n✅ We only store:\n• Data essential for the app\'s normal functionality (all local on the device)',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.wifi_off_rounded, iconColor: const Color(0xFFFF9F1C),
          title: '3. Fully Offline Application',
          content: 'Horof is a 100% offline app.\n\n• All Arabic letter audio files are stored inside the app\n• No data is sent to the internet\n• No connection to any external servers\n• Fully functional without internet connection\n• No cloud synchronization',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.child_friendly_rounded, iconColor: const Color(0xFFEF476F),
          title: '4. Children\'s Privacy (COPPA Compliant)',
          content: 'We comply with the US COPPA (Children\'s Online Privacy Protection Act) and international children\'s privacy guidelines.\n\n• No data is collected from children under 13 years old\n• No account or login required\n• No social media integration\n• No chat or messaging features\n• Completely safe content for children\n• No external links (except the Rate Us feature)',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.block_rounded, iconColor: const Color(0xFFFF6B6B),
          title: '5. Advertisements & In-App Purchases',
          content: 'Horof is completely ad-free and free to use.\n\n❌ This app does NOT have:\n• Any type of advertisements (Banner, Interstitial, Video)\n• Third-party advertising networks\n• In-app purchases or subscriptions\n• Hidden charges or payment gateways\n• Data sharing in exchange for rewards',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.security_rounded, iconColor: const Color(0xFF9D4EDD),
          title: '6. Data Security',
          content: 'Since we do not collect any personal information, there is no risk of data breaches or hacking.\n\n• All app content is secured within an encrypted Android package\n• No third-party SDK or analytics tools are used\n• Verified by Google Play Protect\n• Regular security updates are provided',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.share_rounded, iconColor: const Color(0xFF4ECDC4),
          title: '7. Data Sharing & Third Parties',
          content: 'We do not share any information with third parties.\n\n• No data is sold\n• No sharing with partners or affiliates\n• No information given to anyone without legal request (and there is no data to share anyway)\n\nException:\n• Google Play Store rating system — only connects to Google if you choose to rate the app',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.gavel_rounded, iconColor: const Color(0xFFFFD166),
          title: '8. Your Rights',
          content: 'As a user, you have the following rights:\n\n• Right to access — (no information is collected)\n• Right to erasure — uninstalling the app deletes all data\n• Data portability — not applicable\n• Right to withdraw consent — simply stop using the app\n\nAll your rights are preserved under EU GDPR and applicable laws.',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.update_rounded, iconColor: const Color(0xFF06D6A0),
          title: '9. Policy Changes',
          content: 'We may update this Privacy Policy from time to time.\n\n• We will notify you inside the app before any major changes\n• The last updated date on this page will change\n• A separate notification may be sent for significant changes\n• Continued use of the app after an update constitutes your agreement to the new policy',
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.contact_mail_rounded, iconColor: const Color(0xFFEF476F),
          title: '10. Contact Us',
          content: 'If you have any questions, complaints, or suggestions regarding this Privacy Policy, please contact us through the following:\n\n📱 App: Horof — Arabic Alphabet Learning App\n🌍 Country: Bangladesh\n📦 Package: com.tauhidul.horof\n⏰ Response Time: 3-7 business days',
        ),
        const SizedBox(height: 16),
        _buildSafetyBadge(isBangla: false),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildBanner({required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5A189A), Color(0xFF9D4EDD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
      ),
      child: Column(
        children: [
          const Icon(Icons.shield_rounded, color: Colors.white, size: 52),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white, height: 1.5),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSection({
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF222222)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(fontSize: 13.5, color: Color(0xFF444444), height: 1.75),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyBadge({required bool isBangla}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF06D6A0).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF06D6A0).withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_rounded, color: Color(0xFF028090), size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isBangla
                  ? 'Horof সম্পূর্ণ নিরাপদ, বিজ্ঞাপনমুক্ত এবং শিশুবান্ধব অ্যাপ! কোনো ব্যক্তিগত তথ্য সংগ্রহ করা হয় না।'
                  : 'Horof is a completely safe, ad-free, and child-friendly app! No personal data is collected.',
              style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF028090), fontSize: 13, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
