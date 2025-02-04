import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'km', 'zh_Hant'];

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
    String? kmText = '',
    String? zh_HantText = '',
  }) =>
      [enText, kmText, zh_HantText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // DevicesPage
  {
    'ac1l4cvh': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // ResourcesPage
  {
    'bx1g3j1o': {
      'en': 'MDMS Resources',
      'km': 'ធនធាន MDMS',
      'zh_Hant': 'MDMS 資源',
    },
    'zihbt1w4': {
      'en': 'Access training materials and documentation',
      'km': 'ចូលប្រើឯកសារបណ្តុះបណ្តាល និងឯកសារ',
      'zh_Hant': '存取培訓材料和文檔',
    },
    '687tm539': {
      'en': 'Training Videos',
      'km': 'វីដេអូបណ្តុះបណ្តាល',
      'zh_Hant': '培訓影片',
    },
    'wypbj23y': {
      'en': 'MDMS System Overview',
      'km': 'ទិដ្ឋភាពទូទៅនៃប្រព័ន្ធ MDMS',
      'zh_Hant': 'MDMS系統概述',
    },
    'xgul6ylo': {
      'en': 'Duration: 15:30',
      'km': 'Duration: 15:30',
      'zh_Hant': '持續時間：15:30',
    },
    'oawgkzvo': {
      'en': 'Data Collection & Analysis',
      'km': 'ការប្រមូលទិន្នន័យ និងការវិភាគ',
      'zh_Hant': '資料收集與分析',
    },
    'lmmbu3g8': {
      'en': 'Duration: 12:45',
      'km': 'Duration: 12:45',
      'zh_Hant': '持續時間：12:45',
    },
    'ghoxzzua': {
      'en': 'Documentation',
      'km': 'ឯកសារ',
      'zh_Hant': '文件',
    },
    '7y646293': {
      'en': 'User Manual v2.1',
      'km': 'សៀវភៅណែនាំអ្នកប្រើប្រាស់ v2.1',
      'zh_Hant': '使用者手冊 v2.1',
    },
    '7hqfz8mn': {
      'en': 'PDF • 2.5 MB',
      'km': 'PDF • 2.5 MB',
      'zh_Hant': 'PDF • 2.5 MB',
    },
    'd31y37ga': {
      'en': 'Technical Specifications',
      'km': 'លក្ខណៈបច្ចេកទេស',
      'zh_Hant': '技術規格',
    },
    'cryja52s': {
      'en': 'PDF • 1.8 MB',
      'km': 'PDF • 1.8 MB',
      'zh_Hant': 'PDF • 1.8 MB',
    },
    'fdqvsu4z': {
      'en': 'Installation Guide',
      'km': 'ការណែនាំអំពីការដំឡើង',
      'zh_Hant': '安裝指南',
    },
    'svlnwj8x': {
      'en': 'PDF • 3.2 MB',
      'km': 'PDF • 3.2 MB',
      'zh_Hant': 'PDF • 3.2 MB',
    },
    'weux9ucm': {
      'en': 'Recent Updates',
      'km': 'បច្ចុប្បន្នភាពថ្មីៗ',
      'zh_Hant': '最近更新',
    },
    'cyuvr3ya': {
      'en': 'Version 2.1.0 Release Notes',
      'km': 'កំណែ 2.1.0 កំណត់ចំណាំការចេញផ្សាយ',
      'zh_Hant': '版本 2.1.0 發行說明',
    },
    '26nthzf8': {
      'en':
          '• Improved data visualization\n• Enhanced reporting capabilities\n• Bug fixes and performance improvements',
      'km':
          '• ការមើលឃើញទិន្នន័យប្រសើរឡើង\n• បង្កើនសមត្ថភាពរាយការណ៍\n• ការកែកំហុស និងការកែលម្អការអនុវត្ត',
      'zh_Hant': '• 改進的數據視覺化\n• 增強的報告功能\n• 錯誤修復和效能改進',
    },
    '7isamkb3': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // AddDevicePage
  {
    'ugjxn4vo': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // DeviceSettingPage
  {
    'c5pymrcd': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // DashboardPage
  {
    's18ieapq': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // ResourcePage
  {
    'ik5pxi6l': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
      'zh_Hant': '家',
    },
  },
  // TouDetails
  {
    'ftxtgsnv': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // TouPage
  {
    '04sbl95w': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // TimeBandDetails
  {
    'm5i6pa2n': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // TimeBandPage
  {
    'pu4oed8x': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // seasonmaintest
  {
    'xxnn3sue': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // EventPage
  {
    'lt4bpvpn': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // EventDetailPage
  {
    '0glapjid': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // VideoPlayPage
  {
    'ku9ujikp': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DeviceDetailsPage
  {
    'mka820n2': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // sandbox1
  {
    'jgc14b5x': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // sandbox3
  {
    'cuyrzrot': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pSeason
  {
    'hl75qtsf': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pSeasonDetail
  {
    'o8xl55um': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pSpecailDayList
  {
    '4qix4upb': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pSpecialDayDetail
  {
    '14dilt5e': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pSpecialDayAdd
  {
    'visnyqf4': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
      'zh_Hant': '家',
    },
  },
  // pSpecialDayView
  {
    'vys5ya6o': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
      'zh_Hant': '家',
    },
  },
  // ProductSettingPage
  {
    '6wii0sbr': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // fffff
  {
    'a2gmm9km': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // MenuWeb
  {
    'paozobi4': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
      'zh_Hant': '儀表板',
    },
    'aaukvbx2': {
      'en': 'Devices',
      'km': 'ឧបករណ៍',
      'zh_Hant': '裝置',
    },
    'ia8u7myb': {
      'en': 'Alert & Notification',
      'km': 'ការជូនដំណឹង និងការជូនដំណឹង',
      'zh_Hant': '警報和通知',
    },
    '8dvo06lr': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    '273klvvk': {
      'en': 'Alert & Notification',
      'km': 'ការជូនដំណឹង និងការជូនដំណឹង',
      'zh_Hant': '警報和通知',
    },
    '4s0xexzw': {
      'en': 'Reports',
      'km': 'របាយការណ៍',
      'zh_Hant': '報告',
    },
    'xb9nkziv': {
      'en': 'Resources',
      'km': 'ធនធាន',
      'zh_Hant': '資源',
    },
    '56gbkgm9': {
      'en': 'Settings',
      'km': 'ការកំណត់',
      'zh_Hant': '設定',
    },
    'agpyp1ct': {
      'en': 'Log Out',
      'km': 'ចេញ',
      'zh_Hant': '退出',
    },
  },
  // MobileNav
  {
    'fbzwfr5f': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
    'ktet0neg': {
      'en': 'Documents',
      'km': 'ឯកសារ',
      'zh_Hant': '文件',
    },
    '5b8oknaf': {
      'en': 'Flow',
      'km': 'លំហូរ',
      'zh_Hant': '流動',
    },
    '4z1tanpx': {
      'en': 'Reports',
      'km': 'របាយការណ៍',
      'zh_Hant': '報告',
    },
    'd11wkhh8': {
      'en': 'Setting',
      'km': 'ការកំណត់',
      'zh_Hant': '環境',
    },
  },
  // cCustomColumns
  {
    'eoit8wwx': {
      'en': 'Reset',
      'km': 'កំណត់ឡើងវិញ',
      'zh_Hant': '重置',
    },
  },
  // filterdatecomponent
  {
    'y83zfqkj': {
      'en': 'Filter Date Range',
      'km': 'ជួរកាលបរិច្ឆេទតម្រង',
      'zh_Hant': '過濾日期範圍',
    },
    'yq048mqq': {
      'en': 'MM/DD/YYYY',
      'km': 'MM/DD/YYYY',
      'zh_Hant': '月/日/年',
    },
    'anvg1wq2': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    '6y0jt9mp': {
      'en': 'MM/DD/YYYY',
      'km': 'MM/DD/YYYY',
      'zh_Hant': '月/日/年',
    },
    'y8gusvd1': {
      'en': 'MM/DD/YYYY',
      'km': 'MM/DD/YYYY',
      'zh_Hant': '月/日/年',
    },
    'qhvpjtp8': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'n4f1thgd': {
      'en': 'MM/DD/YYYY',
      'km': 'MM/DD/YYYY',
      'zh_Hant': '月/日/年',
    },
    '772wfwqp': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    '5f7j51vt': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'b71ir0kv': {
      'en': 'Yesterday',
      'km': 'ម្សិលមិញ',
      'zh_Hant': '昨天',
    },
    'u7xqzlma': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    '0jrq0pgl': {
      'en': 'This Week',
      'km': 'សប្តាហ៍នេះ។',
      'zh_Hant': '本星期',
    },
    '6z90ct9u': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'bw64vs91': {
      'en': 'Previous Week',
      'km': 'សប្តាហ៍មុន។',
      'zh_Hant': '上週',
    },
    '7x7v582x': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    '1dtdra6i': {
      'en': 'This Month',
      'km': 'ខែនេះ។',
      'zh_Hant': '本月',
    },
    'ajdxwt15': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    '1e2qa87s': {
      'en': 'Previous Month',
      'km': 'ខែមុន។',
      'zh_Hant': '上個月',
    },
    'k4kk702t': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'fgsg43l8': {
      'en': 'This Quater',
      'km': 'ត្រីមាសនេះ។',
      'zh_Hant': '本季',
    },
    'twfpwjm2': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'lnxwtclo': {
      'en': 'Previous Quater',
      'km': 'ត្រីមាសមុន។',
      'zh_Hant': '上季',
    },
    'veawbawk': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'tmnse3ru': {
      'en': 'Last 6 Months',
      'km': '6 ខែចុងក្រោយ',
      'zh_Hant': '過去 6 個月',
    },
    'rl0wppz5': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'col3iszj': {
      'en': 'This Year',
      'km': 'ឆ្នាំនេះ',
      'zh_Hant': '今年',
    },
    'wpyjtyon': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    'jjqiq3nq': {
      'en': 'Previous Year',
      'km': 'ឆ្នាំមុន',
      'zh_Hant': '前一年',
    },
    'fxyqeej4': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
  },
  // daterange
  {
    '84llqgv6': {
      'en': 'dd/MM/YYYY - dd/MM/YYYY',
      'km': 'dd/MM/YYYY - dd/MM/YYYY',
      'zh_Hant': '日/月/年 - 日/月/年',
    },
  },
  // exportoption
  {
    'vi4dl7go': {
      'en': 'Export',
      'km': 'នាំចេញ',
      'zh_Hant': '出口',
    },
    'zkd9x3xh': {
      'en': 'CSV File',
      'km': 'ឯកសារ CSV',
      'zh_Hant': 'CSV 檔案',
    },
    'ww4zf0mr': {
      'en': 'PDF File',
      'km': 'ឯកសារ PDF',
      'zh_Hant': 'PDF文件',
    },
    'v1tfqflg': {
      'en': 'Excel File',
      'km': 'ឯកសារ Excel',
      'zh_Hant': 'Excel文件',
    },
  },
  // MoreDetailAlert
  {
    'ie2k43tn': {
      'en': 'View Details',
      'km': 'មើលព័ត៌មានលម្អិត',
      'zh_Hant': '看詳情',
    },
    'q31vwxwv': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    'gx7th7yc': {
      'en': 'Archive',
      'km': 'បណ្ណសារ',
      'zh_Hant': '檔案',
    },
    '4ynsy2fk': {
      'en': 'Send Notification',
      'km': 'ផ្ញើការជូនដំណឹង',
      'zh_Hant': '發送通知',
    },
  },
  // MainLayoutV1
  {
    '53ij6uie': {
      'en': 'Testing Components',
      'km': '',
      'zh_Hant': '',
    },
    '2uxut9b2': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
      'zh_Hant': '儀表板',
    },
    '27b4rkuo': {
      'en': 'Device Mangement',
      'km': '',
      'zh_Hant': '',
    },
    'jqqmx9y9': {
      'en': 'Devices',
      'km': '',
      'zh_Hant': '',
    },
    'pdyhrhlf': {
      'en': 'Configuration',
      'km': '',
      'zh_Hant': '',
    },
    'xgi1apex': {
      'en': 'TOU Setting',
      'km': 'ការកំណត់ TOU',
      'zh_Hant': '分時設定',
    },
    'hddov8ve': {
      'en': 'TOU',
      'km': 'ទូ',
      'zh_Hant': '時令',
    },
    'zpklv06u': {
      'en': 'Time Bands',
      'km': 'ក្រុមតន្រ្តីពេលវេលា',
      'zh_Hant': '時間帶',
    },
    'cea1dm1k': {
      'en': 'Special Day',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'd2k5m9an': {
      'en': 'Season',
      'km': 'រដូវ',
      'zh_Hant': '季節',
    },
    '2kk4sb1v': {
      'en': 'Alerts & Events',
      'km': 'ការជូនដំណឹង និងព្រឹត្តិការណ៍',
      'zh_Hant': '警報和事件',
    },
    '658h8ft6': {
      'en': 'Notifications',
      'km': 'ការជូនដំណឹង',
      'zh_Hant': '通知',
    },
    '8v5xhxc7': {
      'en': 'Alarms',
      'km': 'សំឡេងរោទិ៍',
      'zh_Hant': '警報',
    },
    'gt2w86a2': {
      'en': 'Event Logs',
      'km': 'កំណត់ហេតុព្រឹត្តិការណ៍',
      'zh_Hant': '事件日誌',
    },
    '07z3dg2i': {
      'en': 'Settings',
      'km': 'ការកំណត់',
      'zh_Hant': '設定',
    },
    'r25bfssh': {
      'en': 'System Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធ',
      'zh_Hant': '系統配置',
    },
    'axkd09t5': {
      'en': 'API Integrations',
      'km': 'ការរួមបញ្ចូល API',
      'zh_Hant': 'API集成',
    },
    '54ll69yi': {
      'en': 'Security',
      'km': 'សន្តិសុខ',
      'zh_Hant': '安全',
    },
  },
  // DashboardView
  {
    'dg50imui': {
      'en': 'Overview',
      'km': '',
      'zh_Hant': '',
    },
    'utc53egw': {
      'en': 'Welcome!',
      'km': 'សូមស្វាគមន៍!',
      'zh_Hant': '歡迎！',
    },
    'ttksyr1g': {
      'en': 'Export',
      'km': 'នាំចេញ',
      'zh_Hant': '出口',
    },
    '0w0u5euy': {
      'en': 'Add Widgets',
      'km': 'បន្ថែមធាតុក្រាហ្វិក',
      'zh_Hant': '添加小部件',
    },
    'iuonylqi': {
      'en': 'Total Device',
      'km': 'ឧបករណ៍សរុប',
      'zh_Hant': '設備總數',
    },
    'zacb8sje': {
      'en': '3',
      'km': '៣',
      'zh_Hant': '3',
    },
    'imfzjaub': {
      'en': 'Active Device',
      'km': 'ឧបករណ៍សកម្ម',
      'zh_Hant': '有源設備',
    },
    'se6x56ge': {
      'en': '2',
      'km': '២',
      'zh_Hant': '2',
    },
    'lzijsvx6': {
      'en': 'Alert',
      'km': 'ដាស់តឿន',
      'zh_Hant': '警報',
    },
    'z3qjgi3x': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'o294624p': {
      'en': 'Device Performance',
      'km': 'ដំណើរការឧបករណ៍',
      'zh_Hant': '設備性能',
    },
    '6tm06ljk': {
      'en': 'Good',
      'km': 'ល្អ',
      'zh_Hant': '好的',
    },
    'kmhubnib': {
      'en': 'Low',
      'km': 'ទាប',
      'zh_Hant': '低的',
    },
    'oijdycb2': {
      'en': 'Reading Rate',
      'km': 'អត្រាការអាន',
      'zh_Hant': '閱讀率',
    },
    't1dya67r': {
      'en': 'Norlmal',
      'km': 'ធម្មតា។',
      'zh_Hant': '諾馬爾',
    },
    'g3wvb6zg': {
      'en': 'Abnorlmal',
      'km': 'មិនធម្មតា',
      'zh_Hant': '例外',
    },
    'yhrtjf6h': {
      'en': 'Module Status',
      'km': 'ស្ថានភាពម៉ូឌុល',
      'zh_Hant': '模組狀態',
    },
    '0p9i67he': {
      'en': 'Online',
      'km': 'អនឡាញ',
      'zh_Hant': '在線的',
    },
    '8z5p2lja': {
      'en': 'Ofline',
      'km': 'ក្រៅបណ្តាញ',
      'zh_Hant': '離線',
    },
    'gkj2m8k0': {
      'en': 'Energy Consumption',
      'km': 'ការប្រើប្រាស់ថាមពល',
      'zh_Hant': '能源消耗',
    },
    'bgm3zrzk': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    '6h5q9x9e': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '939pofc4': {
      'en': 'Weekly',
      'km': 'ប្រចាំសប្តាហ៍',
      'zh_Hant': '每週',
    },
    'i2gduzz6': {
      'en': 'Monthly',
      'km': 'ប្រចាំខែ',
      'zh_Hant': '每月',
    },
    'cqp7f9id': {
      'en': 'Yearly',
      'km': 'ប្រចាំឆ្នាំ',
      'zh_Hant': '每年',
    },
    'xils3tt8': {
      'en': 'Energy Usage',
      'km': '',
      'zh_Hant': '',
    },
    '20wwukvk': {
      'en': 'Total Consumsion',
      'km': '',
      'zh_Hant': '',
    },
    'dyuujhgp': {
      'en': 'Active Power',
      'km': 'ថាមពលសកម្ម',
      'zh_Hant': '有功功率',
    },
    'nhs8e5ov': {
      'en': 'Inactive Power',
      'km': 'ថាមពលអសកម្ម',
      'zh_Hant': '無功功率',
    },
    '27a76f3u': {
      'en': 'Recent Devices',
      'km': 'ឧបករណ៍ថ្មីៗ',
      'zh_Hant': '最近使用的設備',
    },
    '32ibsx7t': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5tvj4lqf': {
      'en': 'All',
      'km': 'ទាំងអស់។',
      'zh_Hant': '全部',
    },
    'wv25b49q': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'rk01kxtc': {
      'en': 'All',
      'km': 'ទាំងអស់។',
      'zh_Hant': '全部',
    },
    '9ccnz4l6': {
      'en': 'Favorite',
      'km': 'សំណព្វ',
      'zh_Hant': '最喜歡的',
    },
    'zl6s3n9s': {
      'en': 'Top 10',
      'km': 'កំពូល 10',
      'zh_Hant': '前10名',
    },
    't0eb4n5f': {
      'en': 'Favorite',
      'km': 'សំណព្វ',
      'zh_Hant': '最喜歡的',
    },
    '25obtyl2': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'hspf8ek2': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'r4wc2jqc': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'r6grxvnf': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'unvuwbu8': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'uzyj5sdi': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'p1gbqmtr': {
      'en': 'Top 10',
      'km': 'កំពូល 10',
      'zh_Hant': '前10名',
    },
    'cujgywov': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'rvybaorn': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'c9zndjxw': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'nnfnkyaa': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'cav6zuuf': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    '3xpy7c43': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'ow5f8qql': {
      'en': 'Recent Devices',
      'km': 'ឧបករណ៍ថ្មីៗ',
      'zh_Hant': '最近使用的設備',
    },
    '5jdnbyu3': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'eoizx1lw': {
      'en': 'All',
      'km': 'ទាំងអស់។',
      'zh_Hant': '全部',
    },
    '5yu2jy9h': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'vqle58xg': {
      'en': 'All',
      'km': 'ទាំងអស់។',
      'zh_Hant': '全部',
    },
    'ufm0zi2z': {
      'en': 'Favorite',
      'km': 'សំណព្វ',
      'zh_Hant': '最喜歡的',
    },
    '253hfa1n': {
      'en': 'Top 10',
      'km': 'កំពូល 10',
      'zh_Hant': '前10名',
    },
    'd3ntxj3r': {
      'en': 'Favorite',
      'km': 'សំណព្វ',
      'zh_Hant': '最喜歡的',
    },
    'hc4zf5dr': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'uogx7hxp': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    '622nk4nx': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'y9l2ut33': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'j83lrfix': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'dojuvjfz': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'l1uumbip': {
      'en': 'Top 10',
      'km': 'កំពូល 10',
      'zh_Hant': '前10名',
    },
    'lszfj3ak': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'ciqf2bb5': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    'vogskut5': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    '6ik2ry0t': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
    '1u4qy92b': {
      'en': 'Access Point-12',
      'km': 'ចំណុចចូលដំណើរការ-12',
      'zh_Hant': '接入點 12',
    },
    'vrfaafq5': {
      'en': '192.168.1.3',
      'km': '១៩២.១៦៨.១.៣',
      'zh_Hant': '192.168.1.3',
    },
  },
  // cDeviceSetting
  {
    '8s676b69': {
      'en': 'Device Information',
      'km': 'ព័ត៌មានឧបករណ៍',
      'zh_Hant': '設備資訊',
    },
    '1l4ysi7c': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'unk4mkcl': {
      'en': 'Device Type',
      'km': 'ប្រភេទឧបករណ៍',
      'zh_Hant': '設備類型',
    },
    'ms2txsb4': {
      'en': '\"Sensor\\\\Meter\\\\Gateway\"',
      'km': '\"ឧបករណ៍ចាប់សញ្ញា \\\\ ម៉ែត្រ \\\\ ច្រកចេញចូល\"',
      'zh_Hant': '“感測器\\儀表\\網關”',
    },
    'xp5fl6ah': {
      'en': 'Model Number',
      'km': 'លេខម៉ូដែល',
      'zh_Hant': '型號',
    },
    '2772c60l': {
      'en': 'Serial Number',
      'km': 'លេខស៊េរី',
      'zh_Hant': '序號',
    },
    'gr00m8y0': {
      'en': 'Commission Date',
      'km': 'កាលបរិច្ឆេទគណៈកម្មាការ',
      'zh_Hant': '佣金日期',
    },
    '5nzxxvix': {
      'en': 'Protocol/Interface',
      'km': 'ពិធីការ/ចំណុចប្រទាក់',
      'zh_Hant': '協定/介面',
    },
    'ma962i7q': {
      'en': 'IEC 62056',
      'km': 'IEC 62056',
      'zh_Hant': 'IEC 62056',
    },
    'jgm8n8sn': {
      'en': 'IEC 62057',
      'km': 'IEC 62057',
      'zh_Hant': 'IEC 62057',
    },
    '70868yf5': {
      'en': 'Meter Group',
      'km': 'ក្រុមម៉ែត្រ',
      'zh_Hant': '儀表組',
    },
    'yftyrxo3': {
      'en': 'Meter1',
      'km': 'ម៉ែត្រ 1',
      'zh_Hant': '儀表1',
    },
    'l9bqy279': {
      'en': 'Meter2',
      'km': 'ម៉ែត្រ 2',
      'zh_Hant': '米2',
    },
    '9yrauvy8': {
      'en': 'Installation Location',
      'km': 'ទីតាំងដំឡើង',
      'zh_Hant': '安裝位置',
    },
    'rpspi5go': {
      'en': 'MAPS',
      'km': 'ផែនទី',
      'zh_Hant': '地圖',
    },
    'adcryhvd': {
      'en': 'GPS ',
      'km': 'ជីភីអេស',
      'zh_Hant': '全球定位系統',
    },
    'qq5pwcoc': {
      'en': 'Installation Date',
      'km': 'កាលបរិច្ឆេទដំឡើង',
      'zh_Hant': '安裝日期',
    },
    'jb5mnbne': {
      'en': 'Communication Technology',
      'km': 'បច្ចេកវិទ្យាទំនាក់ទំនង',
      'zh_Hant': '通訊技術',
    },
    'gs3piufj': {
      'en': 'Firmware Version',
      'km': 'កំណែកម្មវិធីបង្កប់',
      'zh_Hant': '韌體版本',
    },
    '10trfdz9': {
      'en': 'Upload Image',
      'km': 'បង្ហោះរូបភាព',
      'zh_Hant': '上傳圖片',
    },
    '5xzh06j7': {
      'en': 'Tap to select or drag image here',
      'km': 'ប៉ះដើម្បីជ្រើសរើស ឬអូសរូបភាពនៅទីនេះ',
      'zh_Hant': '點擊此處選擇或拖曳圖像',
    },
    '18nbruwv': {
      'en': 'Network Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធបណ្តាញ',
      'zh_Hant': '網路設定',
    },
    '45p6vwcq': {
      'en': 'IP Address',
      'km': 'អាសយដ្ឋាន IP',
      'zh_Hant': 'IP位址',
    },
    'wzqqhodw': {
      'en': 'APN',
      'km': 'APN',
      'zh_Hant': '存取點網路',
    },
    'dpvpf19w': {
      'en': 'Gateway Info',
      'km': 'ព័ត៌មានច្រកផ្លូវ',
      'zh_Hant': '網關資訊',
    },
    '41ihe0nl': {
      'en': 'Network Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធបណ្តាញ',
      'zh_Hant': '網路設定',
    },
    '4ny89lis': {
      'en': 'MAC Address',
      'km': 'អាសយដ្ឋាន MAC',
      'zh_Hant': 'MAC位址',
    },
    'rhhroc8f': {
      'en': 'IP Address',
      'km': 'អាសយដ្ឋាន IP',
      'zh_Hant': 'IP位址',
    },
    'shppascc': {
      'en': 'Gateway Info',
      'km': 'ព័ត៌មានច្រកផ្លូវ',
      'zh_Hant': '網關資訊',
    },
    'z0tj7idt': {
      'en': 'Channel Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធឆានែល',
      'zh_Hant': '通道配置',
    },
    'yl9dhh94': {
      'en': 'Flow Direction',
      'km': 'ទិសដៅលំហូរ',
      'zh_Hant': '流動方向',
    },
    'lme1br78': {
      'en': '\"Forward\\\\Reverse\\\\Bidirectional\"',
      'km': '\"ទៅមុខ \\\\ បញ្ច្រាស \\\\ ទ្វេទិស\"',
      'zh_Hant': '“正向\\反向\\雙向”',
    },
    '8p1w31pd': {
      'en': 'Apportion Policy',
      'km': 'គោលការណ៍បែងចែក',
      'zh_Hant': '分配政策',
    },
    '3w9i7p98': {
      'en': '\"Equal\\\\Weighted\\\\Custom\"',
      'km': '\"ស្មើ \\\\ ទម្ងន់ \\\\ ផ្ទាល់ខ្លួន\"',
      'zh_Hant': '“等\\加權\\自訂”',
    },
    '9tx6whvp': {
      'en': 'Cancel',
      'km': 'បោះបង់',
      'zh_Hant': '取消',
    },
    'bb2wrkxz': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '節省',
    },
  },
  // cResource
  {
    'cmsxmgu2': {
      'en': 'Resources',
      'km': 'ធនធាន',
      'zh_Hant': '資源',
    },
    'wqo23e5e': {
      'en': 'Access training materials and documentation',
      'km': 'ចូលប្រើឯកសារបណ្តុះបណ្តាល និងឯកសារ',
      'zh_Hant': '存取培訓材料和文檔',
    },
    'qlax0cfk': {
      'en': 'Training Videos',
      'km': 'វីដេអូបណ្តុះបណ្តាល',
      'zh_Hant': '培訓影片',
    },
    'raeuvhcs': {
      'en': 'MDMS System Overview',
      'km': 'ទិដ្ឋភាពទូទៅនៃប្រព័ន្ធ MDMS',
      'zh_Hant': 'MDMS系統概述',
    },
    '24sop3o8': {
      'en': 'Duration: 15:30',
      'km': 'Duration: 15:30',
      'zh_Hant': '持續時間：15:30',
    },
    'nngxplsn': {
      'en': 'Data Collection & Analysis',
      'km': 'ការប្រមូលទិន្នន័យ និងការវិភាគ',
      'zh_Hant': '資料收集與分析',
    },
    'q7ntexmv': {
      'en': 'Duration: 12:45',
      'km': 'Duration: 12:45',
      'zh_Hant': '持續時間：12:45',
    },
    'xgsk0aff': {
      'en': 'Documentation',
      'km': 'ឯកសារ',
      'zh_Hant': '文件',
    },
    '1v85avv6': {
      'en': 'User Manual v2.1',
      'km': 'សៀវភៅណែនាំអ្នកប្រើប្រាស់ v2.1',
      'zh_Hant': '使用者手冊 v2.1',
    },
    'j510qok8': {
      'en': 'PDF • 2.5 MB',
      'km': 'PDF • 2.5 MB',
      'zh_Hant': 'PDF • 2.5 MB',
    },
    '7mnsnc9a': {
      'en': 'Technical Specifications',
      'km': 'លក្ខណៈបច្ចេកទេស',
      'zh_Hant': '技術規格',
    },
    'wj3pigjm': {
      'en': 'PDF • 1.8 MB',
      'km': 'PDF • 1.8 MB',
      'zh_Hant': 'PDF • 1.8 MB',
    },
    '8pp9duez': {
      'en': 'Installation Guide',
      'km': 'ការណែនាំអំពីការដំឡើង',
      'zh_Hant': '安裝指南',
    },
    '9hfmzb23': {
      'en': 'PDF • 3.2 MB',
      'km': 'PDF • 3.2 MB',
      'zh_Hant': 'PDF • 3.2 MB',
    },
    '0cattfnp': {
      'en': 'Recent Updates',
      'km': 'បច្ចុប្បន្នភាពថ្មីៗ',
      'zh_Hant': '最近更新',
    },
    'g4srqpid': {
      'en': 'Version 2.1.0 Release Notes',
      'km': 'កំណែ 2.1.0 កំណត់ចំណាំការចេញផ្សាយ',
      'zh_Hant': '版本 2.1.0 發行說明',
    },
    '2zpzytb7': {
      'en':
          '• Improved data visualization\n• Enhanced reporting capabilities\n• Bug fixes and performance improvements',
      'km':
          '• ការមើលឃើញទិន្នន័យប្រសើរឡើង\n• បង្កើនសមត្ថភាពរាយការណ៍\n• ការកែកំហុស និងការកែលម្អការអនុវត្ត',
      'zh_Hant': '• 改進的數據視覺化\n• 增強的報告功能\n• 錯誤修復和效能改進',
    },
  },
  // cAddDevice
  {
    '35k18icf': {
      'en': 'Mapping data',
      'km': 'ទិន្នន័យផែនទី',
      'zh_Hant': '測繪數據',
    },
    'y5hkxn25': {
      'en': 'Device Type',
      'km': 'ប្រភេទឧបករណ៍',
      'zh_Hant': '設備類型',
    },
    '1sqc8vci': {
      'en': '\"Sensor\\\\Meter\\\\Gateway\"',
      'km': '\"ឧបករណ៍ចាប់សញ្ញា \\\\ ម៉ែត្រ \\\\ ច្រកចេញចូល\"',
      'zh_Hant': '“感測器\\儀表\\網關”',
    },
    'fl6gogfu': {
      'en': 'Serial Number',
      'km': 'លេខស៊េរី',
      'zh_Hant': '序號',
    },
    'vva17kzk': {
      'en': 'Serial Number is required',
      'km': 'លេខស៊េរីត្រូវបានទាមទារ',
      'zh_Hant': '序號為必填項',
    },
    'iyb0nf33': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'h4m9e9n2': {
      'en': 'Map from Billing',
      'km': 'ផែនទីពីវិក្កយបត្រ',
      'zh_Hant': '比林地圖',
    },
    'mqgcrlio': {
      'en': 'Phase',
      'km': 'ដំណាក់កាល',
      'zh_Hant': '階段',
    },
    'jxrk6aks': {
      'en': 'Communication Type',
      'km': 'ប្រភេទទំនាក់ទំនង',
      'zh_Hant': '通訊類型',
    },
    'bd9g1lic': {
      'en': 'EDMI-RF',
      'km': 'EDMI-RF',
      'zh_Hant': 'EDMI射頻',
    },
    '9cmqs8ug': {
      'en': 'Basic Current',
      'km': 'ចរន្តមូលដ្ឋាន',
      'zh_Hant': '基本電流',
    },
    'b8ubf1i4': {
      'en': '90 A',
      'km': '90 ក',
      'zh_Hant': '90A',
    },
    'k88za00m': {
      'en': 'Maximum Current',
      'km': 'ចរន្តអតិបរមា',
      'zh_Hant': '最大電流',
    },
    'wdxoe4z0': {
      'en': '100 A',
      'km': '100 អេ',
      'zh_Hant': '100A',
    },
    'i5rxa4ht': {
      'en': 'Protocol/Interface',
      'km': 'ពិធីការ/ចំណុចប្រទាក់',
      'zh_Hant': '協定/介面',
    },
    '843v7nfz': {
      'en': 'IEC 62056',
      'km': 'IEC 62056',
      'zh_Hant': 'IEC 62056',
    },
    '7jpxolwn': {
      'en': 'IEC 62057',
      'km': 'IEC 62057',
      'zh_Hant': 'IEC 62057',
    },
    'ehi28p9a': {
      'en': 'Multiplier',
      'km': 'មេគុណ',
      'zh_Hant': '乘數',
    },
    'zhgh7xw5': {
      'en': 'Reading Digit',
      'km': 'ការអានលេខ',
      'zh_Hant': '讀取數字',
    },
    'euz3og33': {
      'en': 'Decimal Digit',
      'km': 'ខ្ទង់ទសភាគ',
      'zh_Hant': '小數位',
    },
    'gtvm7pud': {
      'en': 'Seal By',
      'km': 'ត្រាដោយ',
      'zh_Hant': '密封方式',
    },
    '6m9a6d7j': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
      'zh_Hant': '地位',
    },
    'q2b38tso': {
      'en': 'Available',
      'km': 'មាន',
      'zh_Hant': '可用的',
    },
    'vf81k1pb': {
      'en': 'Unavailable',
      'km': 'មិនអាចប្រើបាន',
      'zh_Hant': '不可用',
    },
    'dnhjqc6m': {
      'en': 'Empty',
      'km': 'ទទេ',
      'zh_Hant': '空的',
    },
    'x33l8w43': {
      'en': 'Broken',
      'km': 'ខូច',
      'zh_Hant': '破碎的',
    },
    '3xk24inj': {
      'en': 'Installation Location',
      'km': 'ទីតាំងដំឡើង',
      'zh_Hant': '安裝位置',
    },
    '3egwdtkt': {
      'en': 'Mapping from headend',
      'km': 'ការធ្វើផែនទីពីក្បាល',
      'zh_Hant': '從頭端映射',
    },
    'z7azjcbh': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'jh6h9f7a': {
      'en': 'Commission Date',
      'km': 'កាលបរិច្ឆេទគណៈកម្មាការ',
      'zh_Hant': '佣金日期',
    },
    'fusi65ho': {
      'en': 'Installation Date',
      'km': 'កាលបរិច្ឆេទដំឡើង',
      'zh_Hant': '安裝日期',
    },
    'wv7een0p': {
      'en': 'Communication Technology',
      'km': 'បច្ចេកវិទ្យាទំនាក់ទំនង',
      'zh_Hant': '通訊技術',
    },
    'h04bx2sl': {
      'en': 'Firmware Version',
      'km': 'កំណែកម្មវិធីបង្កប់',
      'zh_Hant': '韌體版本',
    },
    '5jx0ve41': {
      'en': 'MAPS',
      'km': 'ផែនទី',
      'zh_Hant': '地圖',
    },
    'l6n0q3yo': {
      'en': 'GPS ',
      'km': 'ជីភីអេស',
      'zh_Hant': '全球定位系統',
    },
    '9apn96c7': {
      'en': '\tOrganization',
      'km': 'អង្គការ',
      'zh_Hant': '組織',
    },
    '3i1nzhy6': {
      'en': 'Upload Device Image',
      'km': 'បង្ហោះរូបភាពឧបករណ៍',
      'zh_Hant': '上傳設備圖片',
    },
    'eoriydtj': {
      'en': 'Tap to select or drag image here',
      'km': 'ប៉ះដើម្បីជ្រើសរើស ឬអូសរូបភាពនៅទីនេះ',
      'zh_Hant': '點擊此處選擇或拖曳圖像',
    },
    '4gondmt9': {
      'en': 'Network Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធបណ្តាញ',
      'zh_Hant': '網路設定',
    },
    'm66zrcen': {
      'en': 'IP Address',
      'km': 'អាសយដ្ឋាន IP',
      'zh_Hant': 'IP位址',
    },
    '82spplk4': {
      'en': 'APN',
      'km': 'APN',
      'zh_Hant': '存取點網路',
    },
    'wkg4513b': {
      'en': 'Gateway Info',
      'km': 'ព័ត៌មានច្រកផ្លូវ',
      'zh_Hant': '網關資訊',
    },
    'u0beye2k': {
      'en': 'Channel Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធឆានែល',
      'zh_Hant': '通道配置',
    },
    '3yto5v5i': {
      'en': 'Flow Direction',
      'km': 'ទិសដៅលំហូរ',
      'zh_Hant': '流動方向',
    },
    'tm4y7fq6': {
      'en': '\"Forward\\\\Reverse\\\\Bidirectional\"',
      'km': '\"ទៅមុខ \\\\ បញ្ច្រាស \\\\ ទ្វេទិស\"',
      'zh_Hant': '“正向\\反向\\雙向”',
    },
    '40q0zihx': {
      'en': 'Apportion Policy',
      'km': 'គោលការណ៍បែងចែក',
      'zh_Hant': '分配政策',
    },
    'etbhkglh': {
      'en': '\"Equal\\\\Weighted\\\\Custom\"',
      'km': '\"ស្មើ \\\\ ទម្ងន់ \\\\ ផ្ទាល់ខ្លួន\"',
      'zh_Hant': '“等\\加權\\自訂”',
    },
    '2tic5vfl': {
      'en': 'Cancel',
      'km': 'បោះបង់',
      'zh_Hant': '取消',
    },
    'mwo1277y': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '節省',
    },
  },
  // ComFeatureMap
  {
    'hjr789mn': {
      'en': 'Share Location',
      'km': 'ចែករំលែកទីតាំង',
      'zh_Hant': '分享位置',
    },
    'z5n6vc6b': {
      'en': 'Share via Link',
      'km': 'ចែករំលែកតាមរយៈ Link',
      'zh_Hant': '透過連結分享',
    },
    'rhz18oob': {
      'en': 'Anyone with the link can view',
      'km': 'អ្នកដែលមានតំណអាចមើលបាន។',
      'zh_Hant': '知道連結的人都可以查看',
    },
    'ne0ty1an': {
      'en': 'Download Map',
      'km': 'ទាញយកផែនទី',
      'zh_Hant': '下載地圖',
    },
    'diho94e7': {
      'en': 'Save offline map to device',
      'km': 'រក្សាទុកផែនទីក្រៅបណ្តាញទៅឧបករណ៍',
      'zh_Hant': '將離線地圖儲存到設備',
    },
    'f7j42ryd': {
      'en': 'Copy Map Link',
      'km': 'ចម្លងតំណផែនទី',
      'zh_Hant': '複製地圖連結',
    },
    'y3admzpb': {
      'en': 'Copy shareable map URL',
      'km': 'ចម្លង URL ផែនទីដែលអាចចែករំលែកបាន។',
      'zh_Hant': '複製可共享地圖 URL',
    },
  },
  // BarchatComsumption
  {
    '5mha3aqa': {
      'en': 'Energy Consumption',
      'km': 'ការប្រើប្រាស់ថាមពល',
      'zh_Hant': '能源消耗',
    },
    'ib7e6qww': {
      'en': 'Energy',
      'km': 'ថាមពល',
      'zh_Hant': '活力',
    },
    'kbiom0ay': {
      'en': 'Energy Consumption (KWh)',
      'km': 'ការប្រើប្រាស់ថាមពល (KWh)',
      'zh_Hant': '能源消耗（千瓦時）',
    },
  },
  // LinechartVoltage
  {
    'fb1g7x7z': {
      'en': 'Voltage',
      'km': 'វ៉ុល',
      'zh_Hant': '電壓',
    },
    'vty9mnw5': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2gea6lw6': {
      'en': 'Voltage (Phase A, Phase B, Phase C)',
      'km': 'វ៉ុល (ដំណាក់កាល A, ដំណាក់កាល B, ដំណាក់កាល C)',
      'zh_Hant': '電壓（A相、B相、C相）',
    },
    'jy1hhwfp': {
      'en': 'Phase A',
      'km': 'ដំណាក់កាល A',
      'zh_Hant': 'A相',
    },
    '8m9wmyig': {
      'en': 'Phase B',
      'km': 'ដំណាក់កាលខ',
      'zh_Hant': 'B期',
    },
    'xnyh3mv4': {
      'en': 'Phase C',
      'km': 'ដំណាក់កាល C',
      'zh_Hant': 'C期',
    },
  },
  // ComMap
  {
    'a0xlsp4b': {
      'en': 'Address',
      'km': 'អាស័យដ្ឋាន',
      'zh_Hant': '地址',
    },
    '8dot4d8w': {
      'en': 'PHNOM PENH',
      'km': 'ភ្នំពេញ',
      'zh_Hant': '金邊',
    },
    'ftcvfi3y': {
      'en': 'Coordinates',
      'km': 'កូអរដោនេ',
      'zh_Hant': '座標',
    },
    'ehro00eq': {
      'en': '40.7128° N, 74.0060° W',
      'km': '40.7128° N, 74.0060° W',
      'zh_Hant': '北緯 40.7128°，西經 74.0060°',
    },
  },
  // TouDetailsView
  {
    'bj3ik086': {
      'en': 'TOU Setup',
      'km': 'ការដំឡើង TOU',
      'zh_Hant': '使用條款設定',
    },
    '103v4fyv': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'w1zv5a0q': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    's7jjlcbj': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'isfupb64': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'l2rrwr5f': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'poqwu6in': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'i222x3tc': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'ws15kmgc': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'u6y9us4q': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'siyu5nhd': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'lqf7lxho': {
      'en': 'Effective Date',
      'km': 'កាលបរិច្ឆេទមានប្រសិទ្ធភាព',
      'zh_Hant': '生效日期',
    },
    '62od3i6r': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    '2osu0kpb': {
      'en': 'Note',
      'km': 'ចំណាំ',
      'zh_Hant': '筆記',
    },
    'wq1e65p0': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'v4d7werj': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'gtov2jaw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '8arw5ue0': {
      'en': 'Input code is required!',
      'km': 'តម្រូវឱ្យបញ្ចូលលេខកូដ!',
      'zh_Hant': '需要輸入驗證碼！',
    },
    '9yrq2915': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'gtsaoxw0': {
      'en': 'Input name is required',
      'km': 'ឈ្មោះបញ្ចូលត្រូវបានទាមទារ',
      'zh_Hant': '需要輸入姓名',
    },
    '2otyzb60': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'c7verfsc': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '4v98r4bz': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'nfh2ay4e': {
      'en': 'Time Band',
      'km': 'ក្រុមតន្ត្រីពេលវេលា',
      'zh_Hant': '時間帶',
    },
    '2li8ew7c': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'lbem8tbr': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'owjpqkli': {
      'en': 'Time',
      'km': 'ពេលវេលា',
      'zh_Hant': '時間',
    },
    'kqxdrgt1': {
      'en': 'Channel',
      'km': 'ឆានែល',
      'zh_Hant': '頻道',
    },
    'af7i6qgt': {
      'en': 'Day',
      'km': 'ថ្ងៃ',
      'zh_Hant': '天',
    },
    'vlqnasln': {
      'en': 'TB01 DayTOU',
      'km': 'TB01 DayTOU',
      'zh_Hant': 'TB01 日透',
    },
    'oek2p265': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'b5ggepwe': {
      'en': 'TB01 DayTOU',
      'km': 'TB01 DayTOU',
      'zh_Hant': 'TB01 日透',
    },
    'x1nr8wki': {
      'en': 'TB02 NightTOU',
      'km': 'TB02 NightTOU',
      'zh_Hant': 'TB02 夜TOU',
    },
    'jnr179ih': {
      'en': 'Import',
      'km': 'នាំចូល',
      'zh_Hant': '進口',
    },
    'l281r5fg': {
      'en': 'Full',
      'km': 'ពេញ',
      'zh_Hant': '滿的',
    },
    '7oddamie': {
      'en': 'TB02 NightTOU',
      'km': 'TB02 NightTOU',
      'zh_Hant': 'TB02 夜TOU',
    },
    'dgf2mnus': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'en92joa8': {
      'en': 'TB01 DayTOU',
      'km': 'TB01 DayTOU',
      'zh_Hant': 'TB01 日透',
    },
    'y2eegtlc': {
      'en': 'TB02 NightTOU',
      'km': 'TB02 NightTOU',
      'zh_Hant': 'TB02 夜TOU',
    },
    'no2ifvlq': {
      'en': 'Import',
      'km': 'នាំចូល',
      'zh_Hant': '進口',
    },
    'ohasoaxh': {
      'en': 'Full',
      'km': 'ពេញ',
      'zh_Hant': '滿的',
    },
  },
  // TouView
  {
    '44dkgwev': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '6u8s2coe': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'l3hlp12x': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '73tap9zq': {
      'en': 'Effective Date',
      'km': 'កាលបរិច្ឆេទមានប្រសិទ្ធភាព',
      'zh_Hant': '生效日期',
    },
    'k7n1jodl': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    't9l1gz7y': {
      'en': 'Created Date',
      'km': 'កាលបរិច្ឆេទបង្កើត',
      'zh_Hant': '建立日期',
    },
    'hkxulk7u': {
      'en': 'Created By',
      'km': 'បង្កើតដោយ',
      'zh_Hant': '創建者',
    },
    'll2e23ue': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
      'zh_Hant': '地位',
    },
    'kzm4hvxy': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'vlraf5rx': {
      'en': 'TOU01',
      'km': 'ទូ ០១',
      'zh_Hant': '時01',
    },
    '3t3vg1eq': {
      'en': 'Commercial TOU',
      'km': 'TOU ពាណិជ្ជកម្ម',
      'zh_Hant': '商業分時電價',
    },
    'gzwpmh1e': {
      'en': '03/01/2025',
      'km': '០៣/០១/២០២៥',
      'zh_Hant': '2025年3月1日',
    },
    '58mff5dy': {
      'en': '03/02/2025',
      'km': '០៣/០២/២០២៥',
      'zh_Hant': '2025年3月2日',
    },
    'iynvvikw': {
      'en': '01/01/2025',
      'km': '០១/០១/២០២៥',
      'zh_Hant': '01/01/2025',
    },
    '4wyrc88h': {
      'en': 'kimthak',
      'km': 'គីមថាក់',
      'zh_Hant': '金塔克',
    },
    'lwlv73p0': {
      'en': '2',
      'km': '២',
      'zh_Hant': '2',
    },
    'o8odaxju': {
      'en': 'TOU02',
      'km': 'ទូ ០២',
      'zh_Hant': '途02',
    },
    '1ekl8gv7': {
      'en': 'Industrial TOU',
      'km': 'TOU ឧស្សាហកម្ម',
      'zh_Hant': '工業分時電價',
    },
    'y28kerou': {
      'en': '04/01/2025',
      'km': '០៤/០១/២០២៥',
      'zh_Hant': '2025年4月1日',
    },
    'bh1siuiv': {
      'en': '04/02/2025',
      'km': '០៤/០២/២០២៥',
      'zh_Hant': '2025年4月2日',
    },
    'cq0yt6fk': {
      'en': '01/01/2025',
      'km': '០១/០១/២០២៥',
      'zh_Hant': '01/01/2025',
    },
    '3ltox30b': {
      'en': 'kimthak',
      'km': 'គីមថាក់',
      'zh_Hant': '金塔克',
    },
    'yi19adxn': {
      'en': '3',
      'km': '៣',
      'zh_Hant': '3',
    },
    'imv8aej6': {
      'en': 'TOU03',
      'km': 'ទូ ០៣',
      'zh_Hant': 'TOU03',
    },
    'ekdd8xkp': {
      'en': 'Agricultural TOU',
      'km': 'TOU កសិកម្ម',
      'zh_Hant': '農業分時電價',
    },
    '3f3mbtrs': {
      'en': '02/12/2024',
      'km': '០២/១២/២០២៤',
      'zh_Hant': '2024年2月12日',
    },
    'xnrj8hz0': {
      'en': '02/01/2025',
      'km': '០២/០១/២០២៥',
      'zh_Hant': '2025年2月1日',
    },
    'fwj7pehe': {
      'en': '01/12/2024',
      'km': '០១/១២/២០២៤',
      'zh_Hant': '2024年1月12日',
    },
    'w995emm1': {
      'en': 'kimthak',
      'km': 'គីមថាក់',
      'zh_Hant': '金塔克',
    },
    '7ca7e5ku': {
      'en': '1-20',
      'km': '១-២០',
      'zh_Hant': '1-20',
    },
    'fcbovw8v': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
    '8awdgi4j': {
      'en': '145',
      'km': '១៤៥',
      'zh_Hant': '145',
    },
    '6ik5tehg': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
  },
  // cCosInfo
  {
    'w531k784': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '9lrtdqej': {
      'en': 'Value',
      'km': 'តម្លៃ',
      'zh_Hant': '價值',
    },
    '13qbcq0d': {
      'en': 'Meter Group',
      'km': 'ក្រុមម៉ែត្រ',
      'zh_Hant': '儀表組',
    },
    's056wstw': {
      'en': 'K10A/5A',
      'km': 'K10A/5A',
      'zh_Hant': 'K10A/5A',
    },
    'i829z5ds': {
      'en': 'Consumer Name',
      'km': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'zh_Hant': '消費者姓名',
    },
    'ueangi2f': {
      'en': 'HENG KIMHEANG',
      'km': 'ហេង គឹមហៀង',
      'zh_Hant': '興金興',
    },
    'wpredlc3': {
      'en': 'Consumer Code',
      'km': 'លេខកូដអ្នកប្រើប្រាស់',
      'zh_Hant': '消費者守則',
    },
    '4r24l8x7': {
      'en': '3857810',
      'km': '៣៨៥៧៨១០',
      'zh_Hant': '3857810',
    },
    'ity47o2m': {
      'en': 'Consumer Type',
      'km': 'ប្រភេទអ្នកប្រើប្រាស់',
      'zh_Hant': '消費者類型',
    },
    'sb9dugjj': {
      'en': 'R00 RIEL - DOMESTIC',
      'km': 'R00 រៀល - ក្នុងស្រុក',
      'zh_Hant': 'R00 瑞爾 - 國內',
    },
    'k8zpdlt7': {
      'en': 'Billing Cycie',
      'km': 'Billing Cycie',
      'zh_Hant': '比林西西',
    },
    'n5286pz9': {
      'en': 'CABIN 003A # 3',
      'km': 'CABIN 003A # 3',
      'zh_Hant': '003A#3 號小屋',
    },
    '9drna6bn': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    '1tlrbi0l': {
      'en': '01/01/2025',
      'km': '០១/០១/២០២៥',
      'zh_Hant': '01/01/2025',
    },
    'v8novkxc': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    '3a0f2k9m': {
      'en': '31/01/2025',
      'km': '៣១/០១/២០២៥',
      'zh_Hant': '31/01/2025',
    },
    'yfbagphy': {
      'en': ' Address',
      'km': 'អាស័យដ្ឋាន',
      'zh_Hant': '地址',
    },
    '09flgp4y': {
      'en': 'A 03 - RUSSY DANGKOR PHNOM PENH',
      'km': 'A 03 - រុស្សី ខណ្ឌដង្កោ រាជធានីភ្នំពេញ',
      'zh_Hant': 'A 03 - 俄羅斯 DANGKOR 金邊',
    },
    'hrydfs1b': {
      'en': 'Meter Code',
      'km': 'លេខកូដម៉ែត្រ',
      'zh_Hant': '儀表程式碼',
    },
    '1dnsq1lz': {
      'en': 'Tariff',
      'km': 'ពន្ធ',
      'zh_Hant': '關稅',
    },
    'ypl3hvxu': {
      'en': 'Last Bill Leading',
      'km': 'Bill Leading ចុងក្រោយ',
      'zh_Hant': '最後法案領先',
    },
    'vr21dm45': {
      'en': '800501200:1',
      'km': '800501200:1',
      'zh_Hant': '800501200:1',
    },
    'djjh3t25': {
      'en': 'UDI',
      'km': 'UDI',
      'zh_Hant': 'UDI',
    },
    '7d6pfbys': {
      'en': '800',
      'km': '៨០០',
      'zh_Hant': '800',
    },
    'h3vy1uzk': {
      'en': '800501200:1',
      'km': '800501200:1',
      'zh_Hant': '800501200:1',
    },
    '48uyq5ff': {
      'en': 'UNI',
      'km': 'UNI',
      'zh_Hant': '大學',
    },
    'y02i2h6m': {
      'en': '800',
      'km': '៨០០',
      'zh_Hant': '800',
    },
    'rqzjqeb6': {
      'en': '800501200:1',
      'km': '800501200:1',
      'zh_Hant': '800501200:1',
    },
    't0b9a5cc': {
      'en': 'UDI',
      'km': 'UDI',
      'zh_Hant': 'UDI',
    },
    '7l2he0eu': {
      'en': '800',
      'km': '៨០០',
      'zh_Hant': '800',
    },
  },
  // cSidebar
  {
    'gsgt9hf9': {
      'en': 'TOU Info',
      'km': 'ព័ត៌មាន TOU',
      'zh_Hant': '分時訊息',
    },
    'tgxfdhds': {
      'en': 'Customer Info',
      'km': 'ព័ត៌មានអតិថិជន',
      'zh_Hant': '客戶資訊',
    },
    'egfp469f': {
      'en': 'Load Profile',
      'km': 'ផ្ទុកប្រវត្តិរូប',
      'zh_Hant': '負載曲線',
    },
    'hme1dsou': {
      'en': 'Action Log',
      'km': 'កំណត់ហេតុសកម្មភាព',
      'zh_Hant': '行動日誌',
    },
  },
  // cTouInfo
  {
    'w8110f5r': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '8flwryw6': {
      'en': 'Last Reading',
      'km': 'ការអានចុងក្រោយ',
      'zh_Hant': '最後閱讀',
    },
    'co03wloa': {
      'en': 'Last Reading Date',
      'km': 'កាលបរិច្ឆេទអានចុងក្រោយ',
      'zh_Hant': '最後閱讀日期',
    },
    '6642mp5u': {
      'en': 'DayTOU',
      'km': 'DayTOU',
      'zh_Hant': '日投',
    },
    'obxl8lte': {
      'en': '360 kWh',
      'km': '360 kWh',
      'zh_Hant': '360度',
    },
    'fxjmi48f': {
      'en': '01/01/2025  07:15',
      'km': '01/01/2025 07:15',
      'zh_Hant': '2025年1月1日 07:15',
    },
    'adqjdcks': {
      'en': 'NightTOU',
      'km': 'រាត្រី',
      'zh_Hant': '夜TOU',
    },
    'jpqh18bi': {
      'en': '400 kWh',
      'km': '400 kWh',
      'zh_Hant': '400度',
    },
    '6u9ipiza': {
      'en': '01/01/2025  21:15 ',
      'km': '០១/០១/២០២៥ ២១:១៥',
      'zh_Hant': '2025年1月1日 21:15',
    },
  },
  // cloadprofile
  {
    'sk5v5fxo': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'qh6tvv4e': {
      'en': 'Value',
      'km': 'តម្លៃ',
      'zh_Hant': '價值',
    },
    'es5rahqd': {
      'en': 'Date Time ',
      'km': 'កាលបរិច្ឆេទ ពេលវេលា',
      'zh_Hant': '日期時間',
    },
    'poo9jv0t': {
      'en': '2024-12-30 14:45:00',
      'km': '2024-12-30T07:45:00Z',
      'zh_Hant': '2024-12-30T07:45:00Z',
    },
    '3mn6y1jq': {
      'en': 'Device Name ',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'h0bhv32g': {
      'en': 'Smart Meter A',
      'km': 'ឧបករណ៍វាស់ស្ទង់ឆ្លាតវៃ A',
      'zh_Hant': '智慧電錶A',
    },
    'nm7ooman': {
      'en': 'Device ID',
      'km': 'លេខសម្គាល់ឧបករណ៍',
      'zh_Hant': '設備ID',
    },
    'dhxzxp6i': {
      'en': 'DEV-12345',
      'km': 'DEV-12345',
      'zh_Hant': 'DEV-12345',
    },
    'w0b24o4d': {
      'en': 'Import kWh Total',
      'km': 'នាំចូល kWh សរុប',
      'zh_Hant': '輸入千瓦時總計',
    },
    '6pv41sij': {
      'en': '500.25 kWh',
      'km': '500.25 kWh',
      'zh_Hant': '500.25千瓦時',
    },
    'gnyyl9ym': {
      'en': 'Import kVar Total',
      'km': 'នាំចូល kVar សរុប',
      'zh_Hant': '輸入無功電壓總計',
    },
    'p6f6szpn': {
      'en': '102,475 kVar',
      'km': '102,475 kVar',
      'zh_Hant': '102,475 千伏爾',
    },
    'c9qcad49': {
      'en': 'Voltage Ph-A  Avg',
      'km': 'វ៉ុល Ph-A មធ្យម',
      'zh_Hant': '電壓 Ph-A 平均值',
    },
    'xlgch4j7': {
      'en': '231.2 V',
      'km': '231.2 វ',
      'zh_Hant': '231.2V',
    },
    '727imnk2': {
      'en': 'Voltage Ph-B  Avg',
      'km': 'វ៉ុល Ph-B ជាមធ្យម',
      'zh_Hant': '電壓 Ph-B 平均值',
    },
    '4nxhmd5u': {
      'en': '229.8 V',
      'km': '229.8 វ',
      'zh_Hant': '229.8V',
    },
    'rlz2a696': {
      'en': 'Voltage Ph-C  Avg',
      'km': 'វ៉ុល Ph-C ជាមធ្យម',
      'zh_Hant': '電壓 Ph-C 平均值',
    },
    'v12naaa5': {
      'en': ' 12.5 A',
      'km': '12.5 ក',
      'zh_Hant': '12.5安',
    },
    'yukgmahp': {
      'en': 'Current Ph-A  Avg',
      'km': 'មធ្យមភាគ Ph-A បច្ចុប្បន្ន',
      'zh_Hant': '目前 Ph-A 平均值',
    },
    'qgiczije': {
      'en': ' 12.8 A',
      'km': '12.8 ក',
      'zh_Hant': '12.8安',
    },
    'gk9s8i3l': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
      'zh_Hant': '地位',
    },
    '0dk05tg8': {
      'en': 'Active',
      'km': 'សកម្ម',
      'zh_Hant': '積極的',
    },
  },
  // TimebandDetailsView
  {
    '3zvo84rw': {
      'en': 'Time Band Setup',
      'km': 'ការកំណត់ក្រុមពេលវេលា',
      'zh_Hant': '時段設定',
    },
    'du8yny2o': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'cbgoeyqf': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '9isptyjx': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '1290yvkx': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'waxwmt9v': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '48junuid': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'ug73r3hw': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'mtnoma6i': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'nkrxxjfe': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '3j8vaec0': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '0duxdyj0': {
      'en': 'Time',
      'km': 'ពេលវេលា',
      'zh_Hant': '時間',
    },
    '915hxx3l': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '0d4wrbt1': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
    },
    '6swmtbhh': {
      'en': 'Day',
      'km': 'ថ្ងៃ',
      'zh_Hant': '天',
    },
    'qn4q1mk6': {
      'en': 'Full',
      'km': 'ពេញ',
      'zh_Hant': '滿的',
    },
    'vns2q183': {
      'en': 'M',
      'km': 'ម',
      'zh_Hant': '中號',
    },
    '4lj2ryms': {
      'en': 'T',
      'km': 'ធ',
      'zh_Hant': '時間',
    },
    'n7hq4lqm': {
      'en': 'W',
      'km': 'វ',
      'zh_Hant': '瓦',
    },
    'hz26zgec': {
      'en': 'T',
      'km': 'ធ',
      'zh_Hant': '時間',
    },
    'cnw56hju': {
      'en': 'F',
      'km': 'ច',
      'zh_Hant': 'F',
    },
    'h91m356w': {
      'en': 'S',
      'km': 'ស',
      'zh_Hant': 'S',
    },
    'kxgwmfo9': {
      'en': 'S',
      'km': 'ស',
      'zh_Hant': 'S',
    },
    '4krpjk57': {
      'en': 'Channel',
      'km': 'ឆានែល',
      'zh_Hant': '頻道',
    },
    'm24c5j95': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'ekml6czw': {
      'en': 'Select Channel',
      'km': 'ជ្រើសរើសឆានែល',
      'zh_Hant': '選擇頻道',
    },
    'zdwx0wbb': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'quy429o8': {
      'en': 'Import',
      'km': 'នាំចូល',
      'zh_Hant': '進口',
    },
    'alqv0rah': {
      'en': 'Export',
      'km': 'នាំចេញ',
      'zh_Hant': '出口',
    },
    'vzp2y5tw': {
      'en': 'Special Day',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'eia9257z': {
      'en': 'Include Special Day',
      'km': 'រួមបញ្ចូលថ្ងៃពិសេស',
      'zh_Hant': '包括特別的日子',
    },
    'emhern7k': {
      'en': 'Season',
      'km': 'រដូវ',
      'zh_Hant': '季節',
    },
    'q1av4u5w': {
      'en': 'Select Season',
      'km': 'ជ្រើសរើសរដូវកាល',
      'zh_Hant': '選擇季節',
    },
    '2aydd8rd': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '8tvc5m49': {
      'en': 'Spring',
      'km': 'និទាឃរដូវ',
      'zh_Hant': '春天',
    },
    'lpvvs1ii': {
      'en': 'Summer',
      'km': 'រដូវក្តៅ',
      'zh_Hant': '夏天',
    },
    'eivbxgqo': {
      'en': 'Autumn ',
      'km': 'សរទរដូវ',
      'zh_Hant': '秋天',
    },
    'e04qcikd': {
      'en': 'Winter',
      'km': 'រដូវរងា',
      'zh_Hant': '冬天',
    },
    '4mugyaso': {
      'en': 'Note',
      'km': 'ចំណាំ',
      'zh_Hant': '筆記',
    },
    '9akm5s2x': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ir04ecuo': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '3w5sig97': {
      'en': 'Input code is required!',
      'km': 'តម្រូវឱ្យបញ្ចូលលេខកូដ!',
      'zh_Hant': '需要輸入驗證碼！',
    },
    'ra5k1jtq': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'p6lh1mtv': {
      'en': 'Input name is required!',
      'km': 'តម្រូវឱ្យបញ្ចូលឈ្មោះ!',
      'zh_Hant': '需要輸入姓名！',
    },
    'ksfy21ga': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '1hx9n3hp': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '5akpl7u1': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
  },
  // TimeBandView
  {
    'k1nqmbfk': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '6deqmaf3': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    '6a29s0eo': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'ngs35na7': {
      'en': 'Time',
      'km': 'ពេលវេលា',
      'zh_Hant': '時間',
    },
    '7r7plp9y': {
      'en': 'Channel',
      'km': 'ឆានែល',
      'zh_Hant': '頻道',
    },
    'cmi1q0mr': {
      'en': 'Created Date',
      'km': 'កាលបរិច្ឆេទបង្កើត',
      'zh_Hant': '建立日期',
    },
    '4tlnh7of': {
      'en': 'Created By',
      'km': 'បង្កើតដោយ',
      'zh_Hant': '創建者',
    },
    '6g3plbi0': {
      'en': 'Day',
      'km': 'ថ្ងៃ',
      'zh_Hant': '天',
    },
    'l7aitu38': {
      'en': 'Note',
      'km': 'ចំណាំ',
      'zh_Hant': '筆記',
    },
    'odpvq4vv': {
      'en': '1   ',
      'km': '១',
      'zh_Hant': '1',
    },
    '6p8t3c3a': {
      'en': 'TB01',
      'km': 'TB01',
      'zh_Hant': 'TB01',
    },
    '6d77qx25': {
      'en': 'DayTOU',
      'km': 'DayTOU',
      'zh_Hant': '日投',
    },
    'm5tk9yv4': {
      'en': '07:00 - 21:00',
      'km': '07:00 - 21:00',
      'zh_Hant': '07:00 - 21:00',
    },
    'yv3hgh7n': {
      'en': 'Import',
      'km': 'នាំចូល',
      'zh_Hant': '進口',
    },
    'x9b4lkrd': {
      'en': '01/01/2025',
      'km': '០១/០១/២០២៥',
      'zh_Hant': '01/01/2025',
    },
    'croi5hxf': {
      'en': 'kimthak',
      'km': 'គីមថាក់',
      'zh_Hant': '金塔克',
    },
    '2g8jiv8u': {
      'en': 'Full',
      'km': 'ពេញ',
      'zh_Hant': '滿的',
    },
    'ubtvru29': {
      'en': 'Time band for day',
      'km': 'ក្រុមពេលវេលាសម្រាប់ថ្ងៃ',
      'zh_Hant': '一天的時間段',
    },
    'ilf3ylpc': {
      'en': '2  ',
      'km': '២',
      'zh_Hant': '2',
    },
    '5g3uzn6p': {
      'en': 'TB02',
      'km': 'TB02',
      'zh_Hant': 'TB02',
    },
    '0ym6mxyj': {
      'en': 'NightTOU',
      'km': 'រាត្រី',
      'zh_Hant': '夜TOU',
    },
    'dg66khz5': {
      'en': '21:00 - 07:00',
      'km': '21:00 - 07:00',
      'zh_Hant': '21:00 - 07:00',
    },
    'rvgyq1q2': {
      'en': 'Import',
      'km': 'នាំចូល',
      'zh_Hant': '進口',
    },
    'i8b4x1ln': {
      'en': '01/01/2025',
      'km': '០១/០១/២០២៥',
      'zh_Hant': '01/01/2025',
    },
    'vtvxjs8h': {
      'en': 'kimthak',
      'km': 'គីមថាក់',
      'zh_Hant': '金塔克',
    },
    'ptbdv256': {
      'en': 'Full',
      'km': 'ពេញ',
      'zh_Hant': '滿的',
    },
    '4766o5a0': {
      'en': 'Time band for night',
      'km': 'ក្រុមតន្ត្រីពេលវេលាសម្រាប់ពេលយប់',
      'zh_Hant': '夜間時間帶',
    },
  },
  // cActionLog
  {
    'pvty1vre': {
      'en': 'All Actions',
      'km': 'សកម្មភាពទាំងអស់។',
      'zh_Hant': '所有動作',
    },
    '0loovj5g': {
      'en': 'All Action',
      'km': 'សកម្មភាពទាំងអស់។',
      'zh_Hant': '所有行動',
    },
    'mb4yrr5i': {
      'en': 'All Action',
      'km': 'សកម្មភាពទាំងអស់។',
      'zh_Hant': '所有行動',
    },
    'njm9m84l': {
      'en': 'Data Push',
      'km': 'ការជំរុញទិន្នន័យ',
      'zh_Hant': '數據推播',
    },
    'plhv2e9y': {
      'en': 'Data Pull',
      'km': 'ទាញទិន្នន័យ',
      'zh_Hant': '資料拉取',
    },
    '69zsx5so': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    'aciwm66d': {
      'en': 'Data Push',
      'km': 'ការជំរុញទិន្នន័យ',
      'zh_Hant': '數據推播',
    },
    'xnfen7oy': {
      'en': 'By Admin',
      'km': 'ដោយ Admin',
      'zh_Hant': '由管理員',
    },
    '202idx4e': {
      'en': 'Now',
      'km': 'ឥឡូវនេះ',
      'zh_Hant': '現在',
    },
    'td06lfhi': {
      'en': 'Data Pull',
      'km': 'ទាញទិន្នន័យ',
      'zh_Hant': '資料拉取',
    },
    'kd1ktrar': {
      'en': 'By Kim Kim',
      'km': 'ដោយ គឹម គីម',
      'zh_Hant': '作者：金金',
    },
    '3pjdr0or': {
      'en': '10 mn ago',
      'km': '10 នាទីមុន។',
      'zh_Hant': '1000 萬前',
    },
    'djscpqja': {
      'en': 'Data Push',
      'km': 'ការជំរុញទិន្នន័យ',
      'zh_Hant': '數據推播',
    },
    'rlji6e29': {
      'en': 'By Sok',
      'km': 'ដោយ សុខ',
      'zh_Hant': '透過索克',
    },
    'wzmvv7fy': {
      'en': '1 h ago',
      'km': '1 ម៉ោងមុន។',
      'zh_Hant': '1 小時前',
    },
    'vopiji8p': {
      'en': 'Yesterday',
      'km': 'ម្សិលមិញ',
      'zh_Hant': '昨天',
    },
    'izac4qg2': {
      'en': 'Data Pull',
      'km': 'ទាញទិន្នន័យ',
      'zh_Hant': '資料拉取',
    },
    'b0w4t921': {
      'en': 'By Kimheang',
      'km': 'ដោយ គឹមហៀង',
      'zh_Hant': '作者：金興',
    },
    '681p4evq': {
      'en': '1 Day',
      'km': '1 ថ្ងៃ។',
      'zh_Hant': '1 天',
    },
    '99dzwbuj': {
      'en': 'Data Push',
      'km': 'ការជំរុញទិន្នន័យ',
      'zh_Hant': '數據推播',
    },
    'oe8psswr': {
      'en': 'By Kimheang',
      'km': 'ដោយ គឹមហៀង',
      'zh_Hant': '作者：金興',
    },
    'bodp4hob': {
      'en': '1 Day',
      'km': '1 ថ្ងៃ។',
      'zh_Hant': '1 天',
    },
  },
  // DeviceView
  {
    'g0v9nrgn': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'l13fspgl': {
      'en': 'Serial',
      'km': 'សៀរៀល',
      'zh_Hant': '序列',
    },
    'rak5vwi8': {
      'en': 'Device Type',
      'km': 'ប្រភេទឧបករណ៍',
      'zh_Hant': '設備類型',
    },
    '5rvuguvi': {
      'en': 'Device Group',
      'km': 'ក្រុមឧបករណ៍',
      'zh_Hant': '設備組',
    },
    'mrwil5q0': {
      'en': 'TOU',
      'km': 'ទូ',
      'zh_Hant': '時令',
    },
    'cy6lgt68': {
      'en': 'Application',
      'km': 'ការដាក់ពាក្យ',
      'zh_Hant': '應用',
    },
    'swy9ishl': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
      'zh_Hant': '地位',
    },
    '6yg9ke0m': {
      'en': 'Created By',
      'km': 'បង្កើតដោយ',
      'zh_Hant': '創建者',
    },
    '1kfuc0m3': {
      'en': 'Created On',
      'km': 'បានបង្កើតនៅលើ',
      'zh_Hant': '創建於',
    },
    'nbls07h8': {
      'en': 'Installation Date',
      'km': 'កាលបរិច្ឆេទដំឡើង',
      'zh_Hant': '安裝日期',
    },
    'eb2rg1jz': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'nko0t8lo': {
      'en': '800046773',
      'km': '800046773',
      'zh_Hant': '800046773',
    },
    '2vro52g8': {
      'en': 'K10A/5A',
      'km': 'K10A/5A',
      'zh_Hant': 'K10A/5A',
    },
    'tc05xxt5': {
      'en': 'COMMERCIAL',
      'km': 'ពាណិជ្ជកម្ម',
      'zh_Hant': '商業的',
    },
    'f1tnmeqp': {
      'en': 'TOU01',
      'km': 'ទូ ០១',
      'zh_Hant': '時01',
    },
    'jdo74r29': {
      'en': 'HES',
      'km': 'ហ.ស',
      'zh_Hant': 'HES',
    },
    '8vec6cjx': {
      'en': 'Active',
      'km': 'សកម្ម',
      'zh_Hant': '積極的',
    },
    'vzcfeiea': {
      'en': 'Kim Heang',
      'km': 'គីមហ៊ាង',
      'zh_Hant': '金香',
    },
    '5ob35xra': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'wg7wl4hw': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'gb3x9cob': {
      'en': '2',
      'km': '២',
      'zh_Hant': '2',
    },
    'wyhah5hk': {
      'en': '800046774',
      'km': '800046774',
      'zh_Hant': '800046774',
    },
    '0ee4fmbz': {
      'en': 'K10A/5A',
      'km': 'K10A/5A',
      'zh_Hant': 'K10A/5A',
    },
    'aujywwqb': {
      'en': 'COMMERCIAL',
      'km': 'ពាណិជ្ជកម្ម',
      'zh_Hant': '商業的',
    },
    '107al05b': {
      'en': 'TOU01',
      'km': 'ទូ ០១',
      'zh_Hant': '時01',
    },
    'z1tcfxr2': {
      'en': 'HES',
      'km': 'ហ.ស',
      'zh_Hant': 'HES',
    },
    'edj5mpr8': {
      'en': 'Active',
      'km': 'សកម្ម',
      'zh_Hant': '積極的',
    },
    'lg33idt3': {
      'en': 'Ti Fong',
      'km': 'ទីហ្វុង',
      'zh_Hant': '蒂芳',
    },
    '4wf3aozf': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'v3mxim0p': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'n1tuh9ex': {
      'en': '3',
      'km': '៣',
      'zh_Hant': '3',
    },
    'nqc55480': {
      'en': '800046775',
      'km': '800046775',
      'zh_Hant': '800046775',
    },
    'o1wcq7uw': {
      'en': 'K10A/5A',
      'km': 'K10A/5A',
      'zh_Hant': 'K10A/5A',
    },
    'xfit4nk9': {
      'en': 'INDUSTRIAL',
      'km': 'ឧស្សាហកម្ម',
      'zh_Hant': '工業的',
    },
    'wr91ybvy': {
      'en': 'TOU02',
      'km': 'ទូ ០២',
      'zh_Hant': '途02',
    },
    'trbhmfqc': {
      'en': 'HES',
      'km': 'ហ.ស',
      'zh_Hant': 'HES',
    },
    '3bz4zrc6': {
      'en': 'Active',
      'km': 'សកម្ម',
      'zh_Hant': '積極的',
    },
    'twbgrqpt': {
      'en': 'Kim Heang',
      'km': 'គីមហ៊ាង',
      'zh_Hant': '金香',
    },
    'r88xeyt1': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'e9assla1': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'lkv1i5xm': {
      'en': '4',
      'km': '៤',
      'zh_Hant': '4',
    },
    'eatspgsb': {
      'en': '800046776',
      'km': '800046776',
      'zh_Hant': '800046776',
    },
    '4vqrbaz3': {
      'en': 'K10A/5A',
      'km': 'K10A/5A',
      'zh_Hant': 'K10A/5A',
    },
    'urco0mdh': {
      'en': 'INDUSTRIAL',
      'km': 'ឧស្សាហកម្ម',
      'zh_Hant': '工業的',
    },
    '04apfo91': {
      'en': 'TOU02',
      'km': 'ទូ ០២',
      'zh_Hant': '途02',
    },
    'mll54e0v': {
      'en': 'HES',
      'km': 'ហ.ស',
      'zh_Hant': 'HES',
    },
    'voitge35': {
      'en': 'Inactive',
      'km': 'អសកម្ម',
      'zh_Hant': '不活躍',
    },
    'a351yvhi': {
      'en': 'Ti Fong',
      'km': 'ទីហ្វុង',
      'zh_Hant': '蒂芳',
    },
    '9emvzl29': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
    'rf1rt9cx': {
      'en': '06/01/2024',
      'km': '០៦/០១/២០២៤',
      'zh_Hant': '2024年6月1日',
    },
  },
  // cAction
  {
    'mpak4f5k': {
      'en': 'View Details',
      'km': 'មើលព័ត៌មានលម្អិត',
      'zh_Hant': '看詳情',
    },
    'geazzh82': {
      'en': 'Edit',
      'km': 'កែសម្រួល',
      'zh_Hant': '編輯',
    },
    'qi6qs8sg': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
  },
  // BodyHeader
  {
    'u5rv48s7': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'ek9jkj4f': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
  },
  // PagenationComponent
  {
    '1j22han3': {
      'en': '1-25',
      'km': '',
      'zh_Hant': '',
    },
    '6hi7wee9': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
    '7faa9qvc': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    'ktwsynom': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
  },
  // TOUSidebar
  {
    'k1eqw6wu': {
      'en': 'TOU Info',
      'km': 'ព័ត៌មាន TOU',
      'zh_Hant': '分時訊息',
    },
    'rb0fvlyv': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    '4w07xtej': {
      'en': 'TOU01',
      'km': 'ទូ ០១',
      'zh_Hant': '時01',
    },
    'gjrchcev': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'o0sx7lyj': {
      'en': 'Commercial TOU',
      'km': 'TOU ពាណិជ្ជកម្ម',
      'zh_Hant': '商業分時電價',
    },
    'u3quin1o': {
      'en': 'Time Band',
      'km': 'ក្រុមតន្រ្តីពេលវេលា',
      'zh_Hant': '時間帶',
    },
    'm2vory6v': {
      'en': '01',
      'km': '០១',
      'zh_Hant': '01',
    },
    'n5gu64hj': {
      'en': 'T01',
      'km': 'T01',
      'zh_Hant': 'T01',
    },
    '5nqqamb8': {
      'en': 'Day',
      'km': 'ថ្ងៃ',
      'zh_Hant': '天',
    },
    'teeayu1j': {
      'en': '02',
      'km': '០២',
      'zh_Hant': '02',
    },
    'fdrufq3l': {
      'en': 'T02',
      'km': 'T02',
      'zh_Hant': 'T02',
    },
    '4cqxjduw': {
      'en': 'Night',
      'km': 'យប់',
      'zh_Hant': '夜晚',
    },
    'zx8229pe': {
      'en': 'Device List',
      'km': 'បញ្ជីឧបករណ៍',
      'zh_Hant': '設備列表',
    },
    'd56cruze': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'mx9ma7q7': {
      'en': 'Total Device',
      'km': 'ឧបករណ៍សរុប',
      'zh_Hant': '設備總數',
    },
    '7iyikv42': {
      'en': '3',
      'km': '៣',
      'zh_Hant': '3',
    },
    '2qa4vi5g': {
      'en': 'Serial Number',
      'km': 'លេខស៊េរី',
      'zh_Hant': '序號',
    },
    'qt058wc1': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '451rii5i': {
      'en': 'Serial',
      'km': 'សៀរៀល',
      'zh_Hant': '序列',
    },
    'pvkl31ju': {
      'en': '1.',
      'km': '១.',
      'zh_Hant': '1.',
    },
    '14pgogus': {
      'en': '800046773',
      'km': '800046773',
      'zh_Hant': '800046773',
    },
    '1kpmdkis': {
      'en': '2.',
      'km': '២.',
      'zh_Hant': '2.',
    },
    '1duebqu8': {
      'en': '800046773',
      'km': '800046773',
      'zh_Hant': '800046773',
    },
    '778gk7r2': {
      'en': '3.',
      'km': '៣.',
      'zh_Hant': '3.',
    },
    'dwwb2aip': {
      'en': '800046773',
      'km': '800046773',
      'zh_Hant': '800046773',
    },
  },
  // cDevicedDetail
  {
    'nse4zk6j': {
      'en': 'Devcice Detail',
      'km': 'ព័ត៌មានលម្អិតឧបករណ៍',
      'zh_Hant': '設備詳情',
    },
    'xhjom1ag': {
      'en': 'View device detail information',
      'km': 'មើលព័ត៌មានលំអិតអំពីឧបករណ៍',
      'zh_Hant': '查看設備詳細信息',
    },
    'ry3rlw0u': {
      'en': 'Customer Info',
      'km': 'ព័ត៌មានអតិថិជន',
      'zh_Hant': '客戶資訊',
    },
    'sdd9spcb': {
      'en': 'TOU Info',
      'km': 'ព័ត៌មាន TOU',
      'zh_Hant': '分時訊息',
    },
    'wb4rlzf7': {
      'en': 'Load Profile Data',
      'km': 'ផ្ទុកទិន្នន័យកម្រងព័ត៌មាន',
      'zh_Hant': '載入設定檔數據',
    },
    'ymafyb0y': {
      'en': 'Location',
      'km': 'ទីតាំង',
      'zh_Hant': '地點',
    },
  },
  // cSeasonDetailCopy
  {
    'z0tyq1i6': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'i5p5mg9t': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'm6m5f2bd': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'a35jn8ew': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '6o7ezh30': {
      'en': 'Start Month',
      'km': '',
      'zh_Hant': '',
    },
    'zktv24ri': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'wbfkwovt': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'el5n4t3q': {
      'en': 'Please choose start month!',
      'km': '',
      'zh_Hant': '',
    },
    'm2bb4q5b': {
      'en': 'End Month',
      'km': '',
      'zh_Hant': '',
    },
    'f17fnhke': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    's4y5enfw': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'b2k2348a': {
      'en': 'Please choose end month!',
      'km': '',
      'zh_Hant': '',
    },
    'r255wnww': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'rdu2lpnt': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'tlnlxa9b': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'jzj13bka': {
      'en': 'Please input name!',
      'km': '',
      'zh_Hant': '',
    },
    '89aepeez': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'm0o2rong': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'x09x84vi': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cSeasonCopy
  {
    'pt8bsbj5': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    '04ewlwz1': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'b8dfft9h': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'brqsp3th': {
      'en': 'Month Range',
      'km': '',
      'zh_Hant': '',
    },
    'hukcj3y8': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'qntnuthg': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'zymhkkqs': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'n3v1b3gq': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '1el68e5m': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '8r1kihu1': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'tjwivz2q': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    'f34y2u2t': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cSeasonCopy2Team1
  {
    'tmi0axnc': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'gz16fy31': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'i9dvdj2n': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'j0doup3s': {
      'en': 'Month Range',
      'km': '',
      'zh_Hant': '',
    },
    '0ubnqch8': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cSeasonDetails
  {
    'vvkrz06b': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    '7fklze5a': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'ztspmlyw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5qu1sy8e': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'mvvoro7a': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '807xbsbw': {
      'en': 'Month Range',
      'km': '',
      'zh_Hant': '',
    },
    'zq5dbt7y': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'g6mog8nr': {
      'en': 'Jan',
      'km': '',
      'zh_Hant': '',
    },
    'mcdc86x8': {
      'en': 'Please choose month range!',
      'km': '',
      'zh_Hant': '',
    },
    'fc21k4uq': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    '2rjrl1at': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'fzo830fr': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '0vl2nbpm': {
      'en': 'Please input name!',
      'km': '',
      'zh_Hant': '',
    },
    'kr91h275': {
      'en': 'Cannot exceed 200 characters.',
      'km': '',
      'zh_Hant': '',
    },
    'a6inuc1j': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'lxq5buo9': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'ts6vmyjq': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cSeason
  {
    'r27xnf4p': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'mcse1ubg': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'b1k9nlw6': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    '7tsswfcw': {
      'en': 'Month Range',
      'km': '',
      'zh_Hant': '',
    },
    '358p7w3t': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'ydmt64cj': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'yw4hbrcb': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'sxbvyt0l': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '7ye2aku7': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '0cz8vcsk': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    '9rvjq1zq': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    'qsg2ljn0': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // errorseason
  {
    'oi6fqooa': {
      'en': 'Close',
      'km': '',
      'zh_Hant': '',
    },
  },
  // errorpopup
  {
    'dklfpql5': {
      'en': 'Error',
      'km': '',
      'zh_Hant': '',
    },
    'p9dlj1iz': {
      'en': 'Are you sure, you want to close?',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SearchNotFound
  {
    'vdkuhbm2': {
      'en': 'No Results Found',
      'km': '',
      'zh_Hant': '',
    },
    'rv3dbeep': {
      'en':
          'We couldn\'t find what you\'re looking for. Please try a different search term.',
      'km': '',
      'zh_Hant': '',
    },
  },
  // Logout
  {
    '41c5xttc': {
      'en': 'Are you sure you want to log out?',
      'km': '',
      'zh_Hant': '',
    },
    'nlnqkse8': {
      'en':
          'You\'ll need to log back in to access your account and preferences.',
      'km': '',
      'zh_Hant': '',
    },
    'u07ht4b7': {
      'en': 'Cancel',
      'km': '',
      'zh_Hant': '',
    },
    'ozrbsjk8': {
      'en': 'Log Out',
      'km': '',
      'zh_Hant': '',
    },
  },
  // AccountProfile
  {
    '9qtry7xl': {
      'en': 'Switch Accounts',
      'km': '',
      'zh_Hant': '',
    },
    'ab9fdj0u': {
      'en': 'New account',
      'km': '',
      'zh_Hant': '',
    },
    'mxswg1d8': {
      'en': 'My profile',
      'km': '',
      'zh_Hant': '',
    },
    'oait81vv': {
      'en': 'Languages',
      'km': '',
      'zh_Hant': '',
    },
    'mf6ih3zc': {
      'en': 'Settings',
      'km': '',
      'zh_Hant': '',
    },
    '8e1vhdfo': {
      'en': 'Sign out',
      'km': '',
      'zh_Hant': '',
    },
  },
  // CustomColumnsAlert
  {
    'rkm4vs9a': {
      'en': 'Custom Columns',
      'km': '',
      'zh_Hant': '',
    },
    'emkbbze1': {
      'en': 'Device Name',
      'km': '',
      'zh_Hant': '',
    },
    'i0narknp': {
      'en': 'Device Model',
      'km': '',
      'zh_Hant': '',
    },
    '0ycmg49e': {
      'en': 'Device Location',
      'km': '',
      'zh_Hant': '',
    },
    'hjcyuzd8': {
      'en': 'Alert ID',
      'km': '',
      'zh_Hant': '',
    },
    'tbv87d68': {
      'en': 'Device ID',
      'km': '',
      'zh_Hant': '',
    },
    's0ziammp': {
      'en': 'Severity',
      'km': '',
      'zh_Hant': '',
    },
    'dpdapehw': {
      'en': 'Type',
      'km': '',
      'zh_Hant': '',
    },
    'amsafhe5': {
      'en': 'Alert Date',
      'km': '',
      'zh_Hant': '',
    },
    'eh3egqg1': {
      'en': 'Descritption',
      'km': '',
      'zh_Hant': '',
    },
    'd84v9uw5': {
      'en': 'Device Type',
      'km': '',
      'zh_Hant': '',
    },
  },
  // AdvancedSearch
  {
    '7sir5aic': {
      'en': 'Search platform...',
      'km': '',
      'zh_Hant': '',
    },
    're85hrrz': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'zgt4hn1y': {
      'en': 'Quick Links',
      'km': '',
      'zh_Hant': '',
    },
    'cit8n8tc': {
      'en': 'Add Quiz',
      'km': '',
      'zh_Hant': '',
    },
    'cep8w7qu': {
      'en': 'Find Customer',
      'km': '',
      'zh_Hant': '',
    },
    'upv0r1b0': {
      'en': 'New Project',
      'km': '',
      'zh_Hant': '',
    },
    'abhw9nx4': {
      'en': 'New Customer',
      'km': '',
      'zh_Hant': '',
    },
  },
  // EventView
  {
    '6y0z211c': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'df97bi5h': {
      'en': 'Export',
      'km': '',
      'zh_Hant': '',
    },
    'uw9dhxjr': {
      'en': 'All (9)',
      'km': '',
      'zh_Hant': '',
    },
    'myzwij3b': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'qe34384c': {
      'en': 'Device ID',
      'km': '',
      'zh_Hant': '',
    },
    'rbkmokzb': {
      'en': 'Device Name',
      'km': '',
      'zh_Hant': '',
    },
    'cw2b9xmg': {
      'en': 'Alarm Date',
      'km': '',
      'zh_Hant': '',
    },
    '3941e8h8': {
      'en': 'Severity',
      'km': '',
      'zh_Hant': '',
    },
    'j8kk51u9': {
      'en': 'Type',
      'km': '',
      'zh_Hant': '',
    },
    'tgr7ixvy': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'p423fz90': {
      'en': 'Actions',
      'km': '',
      'zh_Hant': '',
    },
    'da1g83id': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'q1nkcdkl': {
      'en': 'DEV-456-789',
      'km': '',
      'zh_Hant': '',
    },
    'o9ii7u20': {
      'en': 'Smart Meter #456',
      'km': '',
      'zh_Hant': '',
    },
    '0psmjgof': {
      'en': '30-11-2024 \n13:15 PM',
      'km': '',
      'zh_Hant': '',
    },
    'heokzgx1': {
      'en': 'Low',
      'km': '',
      'zh_Hant': '',
    },
    'lv8mudyp': {
      'en': 'Physical Tampering ',
      'km': '',
      'zh_Hant': '',
    },
    '663fetca': {
      'en': 'No Power',
      'km': '',
      'zh_Hant': '',
    },
    '4eclcump': {
      'en': 'Archive (2)',
      'km': '',
      'zh_Hant': '',
    },
    'om243w92': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'bcd6oobm': {
      'en': 'Device ID',
      'km': '',
      'zh_Hant': '',
    },
    'iqbt46lw': {
      'en': 'Device Name',
      'km': '',
      'zh_Hant': '',
    },
    'j7jibgr2': {
      'en': 'Alarm Date',
      'km': '',
      'zh_Hant': '',
    },
    'em1glny1': {
      'en': 'Severity',
      'km': '',
      'zh_Hant': '',
    },
    'w563ckwu': {
      'en': 'Type',
      'km': '',
      'zh_Hant': '',
    },
    '6m2x7toy': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'vo3f7ngw': {
      'en': 'Actions',
      'km': '',
      'zh_Hant': '',
    },
    'lmgj29g2': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '4dedqark': {
      'en': 'DEV-456-789',
      'km': '',
      'zh_Hant': '',
    },
    'on5k34lo': {
      'en': 'Smart Meter #456',
      'km': '',
      'zh_Hant': '',
    },
    '8zb2y4c1': {
      'en': '30-11-2024 \n13:15 PM',
      'km': '',
      'zh_Hant': '',
    },
    'apu8uxvc': {
      'en': 'Critical',
      'km': '',
      'zh_Hant': '',
    },
    'r4c74xjn': {
      'en': 'Physical Tampering ',
      'km': '',
      'zh_Hant': '',
    },
    'v3zkutvl': {
      'en': 'Power grid crash',
      'km': '',
      'zh_Hant': '',
    },
  },
  // EventDetailView
  {
    'ynh7u35o': {
      'en': 'Alert Details',
      'km': '',
      'zh_Hant': '',
    },
    't82supkf': {
      'en': 'Send Notification',
      'km': '',
      'zh_Hant': '',
    },
    'x17jjcdm': {
      'en': 'Alert ID',
      'km': '',
      'zh_Hant': '',
    },
    'o6j5535n': {
      'en': 'Device Name',
      'km': '',
      'zh_Hant': '',
    },
    '8wzbu8nb': {
      'en': 'Smart Meter #456',
      'km': '',
      'zh_Hant': '',
    },
    'hmgxcci9': {
      'en': 'Device ID',
      'km': '',
      'zh_Hant': '',
    },
    'uogi8q03': {
      'en': 'DEV-456-789',
      'km': '',
      'zh_Hant': '',
    },
    '8agt68j0': {
      'en': 'Device Model',
      'km': '',
      'zh_Hant': '',
    },
    'txl3rf6q': {
      'en': 'SM-2000X',
      'km': '',
      'zh_Hant': '',
    },
    '9adbtyzf': {
      'en': 'Timestamp',
      'km': '',
      'zh_Hant': '',
    },
    'y8aa4jff': {
      'en': '23-01-2024 14:30:45​​ ​PM',
      'km': '',
      'zh_Hant': '',
    },
    'h39ksrme': {
      'en': 'Alert Type',
      'km': '',
      'zh_Hant': '',
    },
    'xl39cfpz': {
      'en': 'Physical Tampering Detection',
      'km': '',
      'zh_Hant': '',
    },
    'tvdnhxwx': {
      'en': 'Severity Level',
      'km': '',
      'zh_Hant': '',
    },
    'ea2uk1lb': {
      'en': 'Critical',
      'km': '',
      'zh_Hant': '',
    },
    'c4z988yb': {
      'en': 'Source',
      'km': '',
      'zh_Hant': '',
    },
    '08xdpo8l': {
      'en': 'Smart Meter System',
      'km': '',
      'zh_Hant': '',
    },
    '5vuoarcu': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'o8u0y95d': {
      'en': 'Power grid crash',
      'km': '',
      'zh_Hant': '',
    },
    'no8d31ya': {
      'en': 'Comment',
      'km': '',
      'zh_Hant': '',
    },
    '033r7jg5': {
      'en': 'Input your comment...',
      'km': '',
      'zh_Hant': '',
    },
  },
  // AlertdeviceTest
  {
    'te1iwklb': {
      'en': 'Alert Center',
      'km': '',
      'zh_Hant': '',
    },
    'd033nkbv': {
      'en': 'Active Alerts & Notifications',
      'km': '',
      'zh_Hant': '',
    },
    '9hshxc2p': {
      'en': 'Meter Tampering Detected',
      'km': '',
      'zh_Hant': '',
    },
    'cwr9b6en': {
      'en': 'Meter ID: ',
      'km': '',
      'zh_Hant': '',
    },
    '3s5cuuct': {
      'en': 'MT-2024-089',
      'km': '',
      'zh_Hant': '',
    },
    'nkzax25b': {
      'en': 'Date & Time :',
      'km': '',
      'zh_Hant': '',
    },
    'y9151lsf': {
      'en': '20-12-2024 10:30:00 AM',
      'km': '',
      'zh_Hant': '',
    },
    'b302oy5z': {
      'en': 'Description :',
      'km': '',
      'zh_Hant': '',
    },
    've0i5t4l': {
      'en': 'EFA H-Modem Failure Condition became Inactive and Latched=>30C6',
      'km': '',
      'zh_Hant': '',
    },
    'gvzr8xss': {
      'en': 'Maintenance ',
      'km': '',
      'zh_Hant': '',
    },
    'tix1kgcn': {
      'en': '5 meters require routine inspection',
      'km': '',
      'zh_Hant': '',
    },
    '4mzsdcq9': {
      'en': 'Due by: March 15, 2024',
      'km': '',
      'zh_Hant': '',
    },
    'js9ffaxo': {
      'en': 'Low Battery Warning',
      'km': '',
      'zh_Hant': '',
    },
    't5o8jl7e': {
      'en': 'Meter ID: ',
      'km': '',
      'zh_Hant': '',
    },
    '38s4ogf1': {
      'en': 'MT-2024-156',
      'km': '',
      'zh_Hant': '',
    },
    'zn2ggkca': {
      'en': 'Date & Time : ',
      'km': '',
      'zh_Hant': '',
    },
    'fgh2aquz': {
      'en': '20-12-2024 09:30:00 AM',
      'km': '',
      'zh_Hant': '',
    },
    'p58klr4h': {
      'en': 'Description :',
      'km': '',
      'zh_Hant': '',
    },
    'vgoe7p7a': {
      'en': 'Maintenance required within 48 hours',
      'km': '',
      'zh_Hant': '',
    },
    'mz98ag6x': {
      'en': 'View All Alerts',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DataTable
  {
    'cu05nf6n': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'wb9g2yho': {
      'en': 'Row per page: ',
      'km': '',
      'zh_Hant': '',
    },
    '7x32y8xt': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'azz7dtpn': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'nclvu6vc': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '52i37ctl': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'bwc7kylj': {
      'en': '75',
      'km': '',
      'zh_Hant': '',
    },
    'cs2vrncu': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SampleDataTable
  {
    'tgkddd6t': {
      'en': 'Edit Header 2',
      'km': '',
      'zh_Hant': '',
    },
    'owhacu13': {
      'en': 'Edit Header 3',
      'km': '',
      'zh_Hant': '',
    },
    'blghwo0x': {
      'en': 'Edit Column 2',
      'km': '',
      'zh_Hant': '',
    },
    'wrweudak': {
      'en': 'Edit Column 3',
      'km': '',
      'zh_Hant': '',
    },
    '5ryd6wqs': {
      'en': 'Edit Header 4',
      'km': '',
      'zh_Hant': '',
    },
    'be8d16q9': {
      'en': 'Edit Column 4',
      'km': '',
      'zh_Hant': '',
    },
    'cbs9j2j5': {
      'en': 'Edit Header 5',
      'km': '',
      'zh_Hant': '',
    },
    'obxfkyup': {
      'en': 'Edit Column 5',
      'km': '',
      'zh_Hant': '',
    },
    'oikq9nyu': {
      'en': 'Edit Header 6',
      'km': '',
      'zh_Hant': '',
    },
    '5qaa78vo': {
      'en': 'Edit Column 6',
      'km': '',
      'zh_Hant': '',
    },
    '1yag5if4': {
      'en': 'Edit Header 7',
      'km': '',
      'zh_Hant': '',
    },
    'sfdfht65': {
      'en': 'Edit Column 7',
      'km': '',
      'zh_Hant': '',
    },
  },
  // ExportOptions
  {
    'uqqzzq6p': {
      'en': 'Export Options',
      'km': '',
      'zh_Hant': '',
    },
    'ft8xj8dl': {
      'en': '📄 CSV',
      'km': '',
      'zh_Hant': '',
    },
    'mbai51nz': {
      'en': '📊 Excel',
      'km': '',
      'zh_Hant': '',
    },
    '4marcwvx': {
      'en': '{ }  JSON',
      'km': '',
      'zh_Hant': '',
    },
    'm3r8xum7': {
      'en': 'Confirm',
      'km': '',
      'zh_Hant': '',
    },
  },
  // Table
  {
    'um76ahy2': {
      'en': 'No.',
      'km': '',
      'zh_Hant': '',
    },
    '8mz6lqh6': {
      'en': 'Row per page: ',
      'km': '',
      'zh_Hant': '',
    },
    '7zsvjbvc': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'njakc36m': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '363sfl05': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'utpdehr2': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'vf80df98': {
      'en': '75',
      'km': '',
      'zh_Hant': '',
    },
    '9j94iwxq': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
  },
  // MainLayoutV2
  {
    'avomg3vq': {
      'en': 'Hi, Mr. Pov lyhoung',
      'km': '',
      'zh_Hant': '',
    },
    'xpnrs9fp': {
      'en': 'Houng-Coltd.com.ckh',
      'km': '',
      'zh_Hant': '',
    },
    'vlpxep5q': {
      'en': 'Dashboard',
      'km': '',
      'zh_Hant': '',
    },
    'huf89ifs': {
      'en': 'Device Management',
      'km': '',
      'zh_Hant': '',
    },
    '5gq74zkb': {
      'en': 'Devices',
      'km': '',
      'zh_Hant': '',
    },
    '3tzguwy7': {
      'en': 'Configuration',
      'km': '',
      'zh_Hant': '',
    },
    'z12xpthg': {
      'en': 'TOU Management',
      'km': '',
      'zh_Hant': '',
    },
    '4hjx8ww1': {
      'en': 'TOU',
      'km': '',
      'zh_Hant': '',
    },
    'ltwgn5zj': {
      'en': 'Time Bands',
      'km': '',
      'zh_Hant': '',
    },
    'ddl7jym0': {
      'en': 'Special Days',
      'km': '',
      'zh_Hant': '',
    },
    'r2qu5hyr': {
      'en': 'Seasons',
      'km': '',
      'zh_Hant': '',
    },
    '0vdxi3as': {
      'en': 'Events',
      'km': '',
      'zh_Hant': '',
    },
    '870h5fm9': {
      'en': 'Settings',
      'km': '',
      'zh_Hant': '',
    },
    '2djauuoj': {
      'en': 'Product Settings',
      'km': '',
      'zh_Hant': '',
    },
    'nh0e3dsw': {
      'en': 'Security',
      'km': '',
      'zh_Hant': '',
    },
    '64ah83v9': {
      'en': 'Dashboard',
      'km': '',
      'zh_Hant': '',
    },
    'dy4zkf6s': {
      'en': 'Device Management',
      'km': '',
      'zh_Hant': '',
    },
    '18mo360o': {
      'en': 'TOU Management',
      'km': '',
      'zh_Hant': '',
    },
    'agdfym9l': {
      'en': 'Events',
      'km': '',
      'zh_Hant': '',
    },
    '3ffgvpj1': {
      'en': 'Settings',
      'km': '',
      'zh_Hant': '',
    },
  },
  // menuoption
  {
    'bfuq3m06': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    '6olq4p3k': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    '814zedle': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cTestBody
  {
    '6hdndfht': {
      'en': 'Hello World',
      'km': 'សួស្តីពិភពលោក',
      'zh_Hant': '你好世界',
    },
  },
  // cSpecialDayList
  {
    '337ckkqj': {
      'en': 'No',
      'km': 'ល.រ',
      'zh_Hant': '',
    },
    '0hv4r6p3': {
      'en': 'Code',
      'km': 'លេខកូដ',
      'zh_Hant': '',
    },
    '5inxppyl': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
  },
  // cSpecialDayAction
  {
    'xemtb2c5': {
      'en': 'Edit',
      'km': 'កែប្រែ',
      'zh_Hant': '編輯',
    },
    '8p60l77f': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    'c2f6vl66': {
      'en': 'View',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
  },
  // cSpecialDayDetailList
  {
    'k2p95g9s': {
      'en': 'Sepcial Holiday',
      'km': 'វិស្សមកាល',
      'zh_Hant': '特別假期',
    },
    'ekv347dm': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'hefklpmi': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'haod8vdk': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'ns4wem2c': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
  },
  // cSpecialDayDetail
  {
    '9rv0rfru': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '7v8kyxgy': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'qu5lftbg': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'kve1bbpx': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'g6fsy18n': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'm1tlguoh': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '1hp2qx5d': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '6yw2ewr0': {
      'en': 'Please input valid date',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទត្រឹមត្រូវ',
      'zh_Hant': '請輸入有效日期',
    },
    'g4mepcro': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    '7bpu7ipo': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '6yqf01qk': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'hx3pyeke': {
      'en': 'Please input valid date',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទត្រឹមត្រូវ',
      'zh_Hant': '請輸入有效日期',
    },
    '0sxrpj1d': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'dvmnuy47': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'qo5jl782': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'mi01pikw': {
      'en': ' \nThis field is required.',
      'km': 'វាលនេះត្រូវបានទាមទារ',
      'zh_Hant': '此欄位是必需的。',
    },
    'z1b0wxfu': {
      'en': 'Input exceeds the maximum allowed characters {nameMaxLength}.',
      'km': 'ការបញ្ចូលលើសពីតួអក្សរដែលអនុញ្ញាតអតិបរមា',
      'zh_Hant': '輸入超出允許的最大字元數 {nameMaxLength}。',
    },
    'crtypemf': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '68bf07i0': {
      'en': 'Please enter validation date.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទសុពលភាព',
      'zh_Hant': '請輸入驗證日期。',
    },
    '5u0hxo7a': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '925tgrip': {
      'en': 'Please enter validation date.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទសុពលភាព',
      'zh_Hant': '請輸入驗證日期。',
    },
    'zq6fr3wc': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'v6zhjo1m': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'y7clncmn': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '798khadn': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '',
    },
  },
  // cActivityLogSpecialDay
  {
    'c7o0sy1f': {
      'en': 'Holiday Activity Log',
      'km': 'កំណត់ហេតុសកម្មភាពថ្ងៃឈប់សម្រាក',
      'zh_Hant': '假期活動日誌',
    },
    '6tgiipu3': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    '9ebqdy3q': {
      'en': 'Filter Date',
      'km': 'កាលបរិច្ឆេទតម្រង',
      'zh_Hant': '過濾日期',
    },
    'msamzpph': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '888o48xe': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    '5pvofpno': {
      'en': 'Yesterday',
      'km': 'ម្សិលមិញ',
      'zh_Hant': '昨天',
    },
    'y5j6zks2': {
      'en': 'This Week',
      'km': 'សប្តាហ៍នេះ។',
      'zh_Hant': '本星期',
    },
    'fawe40jn': {
      'en': 'This Month',
      'km': 'ខែនេះ។',
      'zh_Hant': '本月',
    },
    'vko7h29k': {
      'en': 'This Year',
      'km': 'ឆ្នាំនេះ',
      'zh_Hant': '今年',
    },
    '6hizwgd0': {
      'en': 'Custom Date',
      'km': 'កាលបរិច្ឆេទផ្ទាល់ខ្លួន',
      'zh_Hant': '客製化日期',
    },
    'tnrziv9r': {
      'en': 'No.',
      'km': 'ទេ',
      'zh_Hant': '不。',
    },
    'wbj8lv5p': {
      'en': 'Created By',
      'km': 'បង្កើតដោយ',
      'zh_Hant': '創建者',
    },
    'y1ayybry': {
      'en': 'Action',
      'km': 'សកម្មភាព',
      'zh_Hant': '行動',
    },
    'dmnvnvv0': {
      'en': 'Action Date',
      'km': 'កាលបរិច្ឆេទសកម្មភាព',
      'zh_Hant': '行動日期',
    },
    '6wfr32gm': {
      'en': 'Log Data',
      'km': 'ទិន្នន័យកំណត់ហេតុ',
      'zh_Hant': '記錄數據',
    },
    'jz41oerv': {
      'en': 'admin',
      'km': 'អ្នកគ្រប់គ្រង',
      'zh_Hant': '行政',
    },
    'buz51opp': {
      'en': 'admin',
      'km': 'អ្នកគ្រប់គ្រង',
      'zh_Hant': '行政',
    },
    'j6zebu9o': {
      'en': 'dffd',
      'km': 'dffd',
      'zh_Hant': 'dffd',
    },
    'nhqfeufn': {
      'en': 'dffd',
      'km': 'dffd',
      'zh_Hant': 'dffd',
    },
    '7qcs6fsm': {
      'en': 'dfdf',
      'km': 'dfdf',
      'zh_Hant': 'dfdf',
    },
  },
  // cSpecialDay
  {
    's1c04b68': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '0s6x9087': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'hvpisl3l': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '0xll3yik': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '3fubf6tt': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'tgkb2o69': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'i97u0bn8': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2dr5cvqs': {
      'en': 'Please input code!',
      'km': 'សូមបញ្ចូលលេខកូដ!',
      'zh_Hant': '請輸入驗證碼！',
    },
    'odzi45ov': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'ybq807tb': {
      'en': 'Please input name!',
      'km': 'សូមបញ្ចូលឈ្មោះ!',
      'zh_Hant': '請輸入姓名！',
    },
    'uzk0orjd': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'vrcxiufx': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '91766l1y': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'vtwo30p8': {
      'en': 'Cancel',
      'km': 'បោះបង់',
      'zh_Hant': '',
    },
    'h0vxtpv1': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '',
    },
  },
  // cActivityLogSub
  {
    '1o11j62y': {
      'en': 'Special Day Activity Log',
      'km': 'កំណត់ហេតុសកម្មភាពថ្ងៃពិសេស',
      'zh_Hant': '特別日活動日誌',
    },
    '97vvnndc': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'q9hh2t6w': {
      'en': 'Filter Date',
      'km': 'កាលបរិច្ឆេទតម្រង',
      'zh_Hant': '過濾日期',
    },
    '762lgya8': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'hjbnnlq7': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    'qwp0p28d': {
      'en': 'Yesterday',
      'km': 'ម្សិលមិញ',
      'zh_Hant': '昨天',
    },
    'tmlku72g': {
      'en': 'This Week',
      'km': 'សប្តាហ៍នេះ។',
      'zh_Hant': '本星期',
    },
    'm32wurie': {
      'en': 'This Month',
      'km': 'ខែនេះ។',
      'zh_Hant': '本月',
    },
    'esgxu2dq': {
      'en': 'This Year',
      'km': 'ឆ្នាំនេះ',
      'zh_Hant': '今年',
    },
    '2nfq9ttg': {
      'en': 'Custom Date',
      'km': 'កាលបរិច្ឆេទផ្ទាល់ខ្លួន',
      'zh_Hant': '客製化日期',
    },
    '0ofzcxxi': {
      'en': 'No.',
      'km': 'ទេ',
      'zh_Hant': '不。',
    },
    'yc9bcc8n': {
      'en': 'Created By',
      'km': 'បង្កើតដោយ',
      'zh_Hant': '創建者',
    },
    'c0v4vn11': {
      'en': 'Action',
      'km': 'សកម្មភាព',
      'zh_Hant': '行動',
    },
    'ty4ftq20': {
      'en': 'Action Date',
      'km': 'កាលបរិច្ឆេទសកម្មភាព',
      'zh_Hant': '行動日期',
    },
    'n39pvlp2': {
      'en': 'Log Data',
      'km': 'ទិន្នន័យកំណត់ហេតុ',
      'zh_Hant': '記錄數據',
    },
    'xuu2imdn': {
      'en': 'admin',
      'km': 'អ្នកគ្រប់គ្រង',
      'zh_Hant': '行政',
    },
    'velgxjpj': {
      'en': 'admin',
      'km': 'អ្នកគ្រប់គ្រង',
      'zh_Hant': '行政',
    },
    'jpit7ykc': {
      'en': 'df',
      'km': 'df',
      'zh_Hant': 'df',
    },
    '5jx8ubt0': {
      'en': 'df',
      'km': 'df',
      'zh_Hant': 'df',
    },
    'oak2mhnl': {
      'en': 'fd',
      'km': 'fd',
      'zh_Hant': 'FD',
    },
  },
  // itemSpecialDayDetials
  {
    '2meco7mg': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '3i8h9mot': {
      'en': 'Input date',
      'km': '',
      'zh_Hant': '',
    },
    'j5aobh86': {
      'en': 'Input date',
      'km': '',
      'zh_Hant': '',
    },
    'rj76pz5i': {
      'en': 'Victory Day',
      'km': 'ទិវាជ័យជំនះ',
      'zh_Hant': '勝利日',
    },
    'n02r2hbg': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'r1bqc1ji': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
  },
  // cPagination
  {
    'n3v96m3p': {
      'en': 'Rows per page',
      'km': 'ទិន្នន័យបង្ហាញ',
      'zh_Hant': '每頁行數',
    },
    'px5xq9ln': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'zcea7b6d': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'd6u56ccc': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'vgl0xkki': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '65y9r01d': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    '1a98mna7': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'o42asflt': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
    'smk39npm': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
  },
  // cSpecialDayAdd
  {
    '4pjifeq0': {
      'en': 'Special Day',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'bzrtekq6': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'lhffcr4c': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '140z1taa': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'jmc1qcbo': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'h9slmz5z': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '7ohg63zm': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'p2kxg017': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'z4koah00': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'luad7v9t': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'r77mgg80': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '8v3pe8u7': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '8v85sc3o': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '7spde09k': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'vobs2a4v': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'yjxpo9pm': {
      'en': 'Special Day Details',
      'km': '',
      'zh_Hant': '',
    },
    '48tors7n': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'vziiikr9': {
      'en': 'Add',
      'km': 'បន្ថែម',
      'zh_Hant': '添加',
    },
    'gccth15s': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '04qycqw8': {
      'en': 'Start Date',
      'km': 'ថ្ងៃចាប់ផ្ដើម',
      'zh_Hant': '開始日期',
    },
    'tjpd96td': {
      'en': 'End Date',
      'km': 'ថ្ងៃបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    'kv1cghv5': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'yyjlatjj': {
      'en': 'Cancel',
      'km': 'បោះបង់',
      'zh_Hant': '',
    },
    'unljzidu': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '',
    },
  },
  // cSpecialDayView
  {
    '4bns1wnl': {
      'en': 'Special Day',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'uodbbkq9': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'yodbjsgb': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'vae1xnh0': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'fjf35etm': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'dumuttez': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'idp79c46': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    '6io8ljih': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'aeemx9h5': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'l75gjby1': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'mynkit3l': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'wbems8rg': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '3g8fogmm': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'iz9nw9cp': {
      'en': 'Special Day Details',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
    },
    'xfz6dmlv': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'esojr108': {
      'en': 'Filter Date',
      'km': 'កាលបរិច្ឆេទតម្រង',
      'zh_Hant': '過濾日期',
    },
    'kjz07mwz': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '4x30rh4y': {
      'en': 'Today',
      'km': 'ថ្ងៃនេះ',
      'zh_Hant': '今天',
    },
    'mhb7crw0': {
      'en': 'Yesterday',
      'km': 'ម្សិលមិញ',
      'zh_Hant': '昨天',
    },
    '1dbip887': {
      'en': 'This Week',
      'km': 'សប្តាហ៍នេះ។',
      'zh_Hant': '本星期',
    },
    '9c57szog': {
      'en': 'This Month',
      'km': 'ខែនេះ។',
      'zh_Hant': '本月',
    },
    '4y1rkpxy': {
      'en': 'This Year',
      'km': 'ឆ្នាំនេះ',
      'zh_Hant': '今年',
    },
    '9svrxkoj': {
      'en': 'Custom Date',
      'km': 'កាលបរិច្ឆេទផ្ទាល់ខ្លួន',
      'zh_Hant': '客製化日期',
    },
    '6xessnot': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'gk33abp3': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'om9dxfbm': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
  },
  // ProductSettingView
  {
    'lfxqeq6h': {
      'en': 'Search ....',
      'km': '',
      'zh_Hant': '',
    },
    'uuqwfarv': {
      'en': 'Options',
      'km': '',
      'zh_Hant': '',
    },
    '48cu76nm': {
      'en': 'Add',
      'km': '',
      'zh_Hant': '',
    },
    'd6ejze12': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'detvzfph': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'nu6y838r': {
      'en': 'Descriptions',
      'km': '',
      'zh_Hant': '',
    },
    'thjk8lwh': {
      'en': 'Start Date',
      'km': '',
      'zh_Hant': '',
    },
    'l5do3v85': {
      'en': 'End Date',
      'km': '',
      'zh_Hant': '',
    },
    'hi8kayjq': {
      'en': 'Start Date',
      'km': '',
      'zh_Hant': '',
    },
    'zr1fam28': {
      'en': 'End Date',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SubRowPageHeader
  {
    '9seznxcg': {
      'en': 'Search ....',
      'km': '',
      'zh_Hant': '',
    },
    'fuy9zqsl': {
      'en': 'Options',
      'km': '',
      'zh_Hant': '',
    },
    '4d87oysv': {
      'en': 'Add',
      'km': '',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    '414mssbb': {
      'en': 'Hello World',
      'km': 'សួស្តីពិភពលោក',
      'zh_Hant': '你好世界',
    },
    'tix4t24b': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5goz6gj8': {
      'en': 'textHeader',
      'km': 'ក្បាលអត្ថបទ',
      'zh_Hant': '文字標題',
    },
    'slu0im4u': {
      'en': 'textTitle',
      'km': 'ចំណងជើងអត្ថបទ',
      'zh_Hant': '文字標題',
    },
    'cskea6iq': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '421iy8pp': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'kjy0nzzt': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'gcozqnuv': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'hczlyr99': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '520o8qua': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'uuffnddw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ekjdff60': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'wtbhjbw3': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '1ybk65t6': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '738ceqmj': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    't9hxvve0': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    's7n45xce': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '47tuj74h': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2g8xheez': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '90kid121': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5mfp8bb4': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'g8wy1d4f': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '4e3dweas': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'koimgpje': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'u3kws2mv': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'fh5k7yol': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'eh65ruvo': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '7u7sx9c7': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'whsls9yi': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ckm332es': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2c2wfl3o': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
