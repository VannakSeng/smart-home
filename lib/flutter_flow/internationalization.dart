import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // room
  {
    '6f40tybo': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // rooms
  {
    'lx4n0a2s': {
      'en': 'Smart Home',
      'th': 'สมาร์ทโฮม',
    },
    'zenfdkn8': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // Details14Destination
  {
    '8cv43mt5': {
      'en': 'Firenze - Giardino Bardini',
      'th': 'ฟิเรนเซ - จาร์ดิโน บาร์ดินี่',
    },
    'mu7d4f50': {
      'en': '4 Night Stay',
      'th': 'พัก 4 คืน',
    },
    'ypun6wmu': {
      'en': '4.7',
      'th': '4.7',
    },
    '14m85xes': {
      'en': '\$220 USD',
      'th': '\$220 ดอลลาร์สหรัฐ',
    },
    'yvdt9g0c': {
      'en': 'Description',
      'th': 'คำอธิบาย',
    },
    'fq2wacer': {
      'en':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'th':
          'ไม่ใช่โซเซลาเบลล์ซาซัลเวราอิลมอนโดมาซิคูราเมนเตไออูตา นั่งเฉยๆ, ชักชวนให้อ้วน, ทำชั่วขณะหนึ่งโดยไม่ตั้งใจ, ทำงานหนักและโดโลเรแม็กนาอลิควา. เริ่มต้นด้วยการใช้ขั้นต่ำ veniam, การออกกำลังกายแบบ nostrud, ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'z50tb22y': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // authentication
  {
    '47be4bmj': {
      'en': 'Smart Home',
      'th': 'สมาร์ทโฮม',
    },
    'ir0ga2wl': {
      'en': 'Join with Google',
      'th': 'เข้าร่วมกับ Google',
    },
    'yulivqp9': {
      'en': 'Join with Apple',
      'th': 'เข้าร่วมกับแอปเปิ้ล',
    },
    'hnfh7p6n': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // profile
  {
    'y0gs8cvu': {
      'en': 'Andrew D.',
      'th': 'แอนดรูว์ ดี.',
    },
    'pbqnjmog': {
      'en': 'andrew@domainname.com',
      'th': 'แอนดรูว์@domainname.com',
    },
    'gkxkwelh': {
      'en': 'Your Account',
      'th': 'บัญชีของคุณ',
    },
    '72cprfin': {
      'en': 'Edit Profile',
      'th': 'แก้ไขโปรไฟล์',
    },
    '0yzjt0t0': {
      'en': 'Notification Settings',
      'th': 'การตั้งค่าการแจ้งเตือน',
    },
    'rv1791m2': {
      'en': 'App Settings',
      'th': 'การตั้งค่าแอพ',
    },
    'e3tjyvz3': {
      'en': 'Support',
      'th': 'สนับสนุน',
    },
    '50hdk5e6': {
      'en': 'Terms of Service',
      'th': 'เงื่อนไขการให้บริการ',
    },
    '2guyzhkk': {
      'en': 'Log Out',
      'th': 'ออกจากระบบ',
    },
    'f3c5nnzy': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // device
  {
    'h0fcygrl': {
      'en': 'Device Name',
      'th': 'ชื่ออุปกรณ์',
    },
    '7ny5hukl': {
      'en': 'Device Name',
      'th': 'ชื่ออุปกรณ์',
    },
    'gzfg6e6c': {
      'en': 'Acive',
      'th': 'มีชีวิตชีวา',
    },
    'bxvfkxoe': {
      'en': 'Status (Open/Close)',
      'th': 'สถานะ (เปิด/ปิด)',
    },
    'qlgsx61x': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // List03UserSelect
  {
    'qiq9q07c': {
      'en': 'Invite Friends',
      'th': '',
    },
    '8ejjv4m3': {
      'en': '#',
      'th': '',
    },
    'x5zcis3e': {
      'en': 'Selected',
      'th': '',
    },
    'e4fgq877': {
      'en': 'See Selected',
      'th': '',
    },
    'uzq3252e': {
      'en': 'New Item',
      'th': '',
    },
    'xuxgii61': {
      'en': 'Invite Friends',
      'th': '',
    },
    'b15k6yaa': {
      'en': 'Invite your friends to join you!',
      'th': '',
    },
    'gvqwsxy9': {
      'en': 'Home',
      'th': '',
    },
  },
  // InsertItem
  {
    'p56gpsby': {
      'en': 'Label here...',
      'th': '',
    },
    'aknzvsow': {
      'en': 'Label here...',
      'th': '',
    },
    'bqhbq2db': {
      'en': 'Button',
      'th': '',
    },
    '0iacnt5n': {
      'en': 'Page Title',
      'th': '',
    },
    'a0af82wv': {
      'en': 'Home',
      'th': '',
    },
  },
  // SelectedItem
  {
    'ij8eh268': {
      'en': 'Page Title',
      'th': '',
    },
    '885mpja2': {
      'en': 'Home',
      'th': '',
    },
  },
  // room_item_widget
  {
    '9jqf3z2p': {
      'en': 'more',
      'th': 'มากกว่า',
    },
  },
  // form_form_widget
  {
    'b3jt8ill': {
      'en': 'Name',
      'th': 'ชื่อ',
    },
    'uqxlccmy': {
      'en': 'Enter room name',
      'th': 'กรอกชื่อห้อง',
    },
    'pb325c5r': {
      'en': 'Cancel',
      'th': 'ยกเลิก',
    },
    '1t6hwcuk': {
      'en': 'Save',
      'th': 'บันทึก',
    },
  },
  // Miscellaneous
  {
    'vhcjkbuo': {
      'en': '',
      'th': '',
    },
    '2vsxlujw': {
      'en': '',
      'th': '',
    },
    'jw0r5yd8': {
      'en': '',
      'th': '',
    },
    'suyj2514': {
      'en': '',
      'th': '',
    },
    'hyzk4wkt': {
      'en': '',
      'th': '',
    },
    'mep6406e': {
      'en': '',
      'th': '',
    },
    '5ymm4gqx': {
      'en': '',
      'th': '',
    },
    'spif2tkb': {
      'en': '',
      'th': '',
    },
    'gx22a2sj': {
      'en': '',
      'th': '',
    },
    '6j94wvnj': {
      'en': '',
      'th': '',
    },
    'dax59gch': {
      'en': '',
      'th': '',
    },
    'fhxn36i8': {
      'en': '',
      'th': '',
    },
    'poj3scix': {
      'en': '',
      'th': '',
    },
    'y8ddxpge': {
      'en': '',
      'th': '',
    },
    'hfmfgsbx': {
      'en': '',
      'th': '',
    },
    'gceeviti': {
      'en': '',
      'th': '',
    },
    'nbto76rs': {
      'en': '',
      'th': '',
    },
    'hiqqe10i': {
      'en': '',
      'th': '',
    },
    'wd1mdy4o': {
      'en': '',
      'th': '',
    },
    'jraze2ny': {
      'en': '',
      'th': '',
    },
    'pw9zlnnw': {
      'en': '',
      'th': '',
    },
    '7g14z34n': {
      'en': '',
      'th': '',
    },
    'jng5mx8m': {
      'en': '',
      'th': '',
    },
    'i7e9771v': {
      'en': '',
      'th': '',
    },
    'cmby9t5z': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
