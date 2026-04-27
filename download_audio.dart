import 'dart:io';

void main() async {
  List<String> alphabets = [
    'ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'و', 'ه', 'لا', 'ء', 'ي'
  ];

  var dir = Directory('assets/audio');
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  for (int i = 0; i < alphabets.length; i++) {
    var char = alphabets[i];
    var url = 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=ar&q=${Uri.encodeComponent(char)}';
    
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    
    if (response.statusCode == 200) {
      var file = File('assets/audio/letter_$i.mp3');
      await response.pipe(file.openWrite());
      print('Downloaded $char to letter_$i.mp3');
    } else {
      print('Failed to download $char: ${response.statusCode}');
    }
  }
}
