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
      'km': 'ផ្ទះ',
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
  // TimeBandPage
  {
    '9pbyp26t': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // EventPage
  {
    'lt4bpvpn': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // EventDetailPage
  {
    '0glapjid': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // sandbox3
  {
    'cuyrzrot': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SpecailDayList
  {
    'xxnn3sue': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SpecialDayDetailPage
  {
    '14dilt5e': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SpecialDayAdd
  {
    'visnyqf4': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SpecialDayPage
  {
    'vys5ya6o': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // ProductSettingPage
  {
    '6wii0sbr': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // MainSitePage
  {
    'i6mdyawv': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // MainSiteDetailPage
  {
    'yancvxaz': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SubsiteDetailPage
  {
    'jy1xh4z4': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // TimeBandDetailPage
  {
    'ieu82omg': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SeasonPage
  {
    '4qix4upb': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // SeasonDetailPage
  {
    '17ltt7xr': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // TouList
  {
    'ykj9l139': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // DeviceLists
  {
    'zvtr0i6d': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // pDeviceDetails
  {
    '10m93fv5': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // AuthenticationPage
  {
    'sizi7xdw': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DeviceGroupPage
  {
    've9fqfjm': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // DeviceGroupDetailPage
  {
    '9du3tgfw': {
      'en': 'Home',
      'km': 'ផ្ទះ',
      'zh_Hant': '家',
    },
  },
  // ScheduleList
  {
    '8zgzi352': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // ScheduleView
  {
    '3q5ceci7': {
      'en': 'Home',
      'km': '',
      'zh_Hant': '',
    },
  },
  // filterdatecomponent
  {
    'anvg1wq2': {
      'en': '-',
      'km': '-',
      'zh_Hant': '-',
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
  // DashboardView
  {
    'dg50imui': {
      'en': 'Overview',
      'km': 'ទិដ្ឋភាពទូទៅ',
      'zh_Hant': '概述',
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
      'km': 'ការប្រើប្រាស់ថាមពល',
      'zh_Hant': '能源使用',
    },
    '20wwukvk': {
      'en': 'Total Consumsion',
      'km': 'ការប្រើប្រាស់សរុប',
      'zh_Hant': '總消費',
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
      'km': 'ចំណុចចូលដំណើរការ-១២',
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
      'km': 'ចំណុចចូលដំណើរការ-១២',
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
      'km': 'ចំណុចចូលដំណើរការ-១២',
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
  // ResourceView
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
      'km': 'កំណែ 2.1.0 កំណត់ចំណាំចេញផ្សាយ',
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
  // TouDetailsView
  {
    'gok72848': {
      'en': 'Code',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'v1h1nltt': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'mljxu560': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '293piuxb': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'pd919aij': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'z0ro78pv': {
      'en': 'Name',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'ljlqyghm': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '2cfvd23w': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'vsjpf4c1': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'vrjrwj94': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2fyy095c': {
      'en': 'Description',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'wsbw9f9k': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'amkeq3ji': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'brlwan9q': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'xdxzrr7u': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '5u0hxo7a': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'um9qbdjj': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'ksfy21ga': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '1hx9n3hp': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '5akpl7u1': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'i3iee1qq': {
      'en': 'Select TimeBand',
      'km': 'កូដ',
      'zh_Hant': '程式碼',
    },
    'pyfw407y': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'zotzmnvp': {
      'en': 'TimeBand',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '6vrhb4ty': {
      'en': 'Channel',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'mjh8m9ni': {
      'en': 'Register',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    'arlnporw': {
      'en': 'Time of use validate',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandView
  {
    'vpkicd0v': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'yv1itc2e': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '6deqmaf3': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '6a29s0eo': {
      'en': 'Start Time',
      'km': 'ពេលវេលាចាប់ផ្តើម',
      'zh_Hant': '開始時間',
    },
    'ngs35na7': {
      'en': 'End Time',
      'km': 'ពេលវេលាបញ្ចប់',
      'zh_Hant': '結束時間',
    },
    '7r7plp9y': {
      'en': 'Period',
      'km': 'ថ្ងៃនៃសប្តាហ៍',
      'zh_Hant': '星期幾',
    },
    'l7aitu38': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'hj992rjh': {
      'en': 'Rows per page',
      'km': 'ជួរដេកក្នុងមួយទំព័រ',
      'zh_Hant': '每頁行數',
    },
    'z1u5esgf': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'ekv4b6dz': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'skks96k5': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    '4zg2drpy': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '878njejj': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    '8u6p3r00': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
    'mszgf7j8': {
      'en': '(D) Day of Week',
      'km': '',
      'zh_Hant': '',
    },
    '2h8pqh60': {
      'en': '(M) Month of Year',
      'km': '',
      'zh_Hant': '',
    },
    'h08a6dgl': {
      'en': '(S) Season',
      'km': '',
      'zh_Hant': '',
    },
    'y3c34hp9': {
      'en': '(P) Special Day',
      'km': '',
      'zh_Hant': '',
    },
  },
  // BodyHeader
  {
    'u5rv48s7': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
  },
  // PagenationComponent
  {
    '1j22han3': {
      'en': '1-25',
      'km': '១-២៥',
      'zh_Hant': '1-25',
    },
    '6hi7wee9': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
    '7faa9qvc': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'ktwsynom': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
  },
  // SeasonView
  {
    'dm4auawe': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'trat5o7u': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '913x43w4': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'tc38mlb1': {
      'en': 'Month Range',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    'sizmk51m': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'lg4whlof': {
      'en': 'Rows per page',
      'km': 'ជួរដេកក្នុងមួយទំព័រ',
      'zh_Hant': '每頁行數',
    },
    'yxxb6954': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'lywsyrwv': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '53qyipyr': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'jk78vzpb': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '6xjyowie': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'a6j80l8y': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
  },
  // Logout
  {
    '41c5xttc': {
      'en': 'Are you sure you want to log out?',
      'km': 'តើ​អ្នក​ប្រាកដ​ជា​ចង់​ចេញ?',
      'zh_Hant': '您確定要退出嗎？',
    },
    'nlnqkse8': {
      'en':
          'You\'ll need to log back in to access your account and preferences.',
      'km': 'អ្នកនឹងត្រូវចូលគណនីវិញ ដើម្បីចូលប្រើគណនី និងចំណូលចិត្តរបស់អ្នក។',
      'zh_Hant': '您需要重新登入才能存取您的帳戶和首選項。',
    },
    'u07ht4b7': {
      'en': 'Cancel',
      'km': 'បោះបង់',
      'zh_Hant': '取消',
    },
    'ozrbsjk8': {
      'en': 'Log Out',
      'km': 'ចេញ',
      'zh_Hant': '退出',
    },
  },
  // CustomColumnsAlert
  {
    'rkm4vs9a': {
      'en': 'Custom Columns',
      'km': 'ជួរឈរផ្ទាល់ខ្លួន',
      'zh_Hant': '自訂列',
    },
    'emkbbze1': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'i0narknp': {
      'en': 'Device Model',
      'km': 'ម៉ូដែលឧបករណ៍',
      'zh_Hant': '設備型號',
    },
    '0ycmg49e': {
      'en': 'Device Location',
      'km': 'ទីតាំងឧបករណ៍',
      'zh_Hant': '設備位置',
    },
    'hjcyuzd8': {
      'en': 'Alert ID',
      'km': 'លេខសម្គាល់ការជូនដំណឹង',
      'zh_Hant': '警報ID',
    },
    'tbv87d68': {
      'en': 'Device ID',
      'km': 'លេខសម្គាល់ឧបករណ៍',
      'zh_Hant': '設備ID',
    },
    's0ziammp': {
      'en': 'Severity',
      'km': 'ភាពធ្ងន់ធ្ងរ',
      'zh_Hant': '嚴重性',
    },
    'dpdapehw': {
      'en': 'Type',
      'km': 'ប្រភេទ',
      'zh_Hant': '類型',
    },
    'amsafhe5': {
      'en': 'Alert Date',
      'km': 'កាលបរិច្ឆេទជូនដំណឹង',
      'zh_Hant': '警報日期',
    },
    'eh3egqg1': {
      'en': 'Descritption',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'd84v9uw5': {
      'en': 'Device Type',
      'km': 'ប្រភេទឧបករណ៍',
      'zh_Hant': '設備類型',
    },
  },
  // EventView
  {
    '6y0z211c': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'df97bi5h': {
      'en': 'Export',
      'km': 'នាំចេញ',
      'zh_Hant': '出口',
    },
    'uw9dhxjr': {
      'en': 'All (9)',
      'km': 'ទាំងអស់ (9)',
      'zh_Hant': '全部 (9)',
    },
    'myzwij3b': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'qe34384c': {
      'en': 'Device ID',
      'km': 'លេខសម្គាល់ឧបករណ៍',
      'zh_Hant': '設備ID',
    },
    'rbkmokzb': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'cw2b9xmg': {
      'en': 'Alarm Date',
      'km': 'កាលបរិច្ឆេទរោទិ៍',
      'zh_Hant': '報警日期',
    },
    '3941e8h8': {
      'en': 'Severity',
      'km': 'ភាពធ្ងន់ធ្ងរ',
      'zh_Hant': '嚴重性',
    },
    'j8kk51u9': {
      'en': 'Type',
      'km': 'ប្រភេទ',
      'zh_Hant': '類型',
    },
    'tgr7ixvy': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'p423fz90': {
      'en': 'Actions',
      'km': 'សកម្មភាព',
      'zh_Hant': '行動',
    },
    'da1g83id': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'q1nkcdkl': {
      'en': 'DEV-456-789',
      'km': 'DEV-456-789',
      'zh_Hant': 'DEV-456-789',
    },
    'o9ii7u20': {
      'en': 'Smart Meter #456',
      'km': 'Smart Meter #456',
      'zh_Hant': '智慧電錶#456',
    },
    '0psmjgof': {
      'en': '30-11-2024 \n13:15 PM',
      'km': '៣០-១១-២០២៤ \nម៉ោង ១៣:១៥ រសៀល',
      'zh_Hant': '2024年11月30日 \n下午 13:15',
    },
    'heokzgx1': {
      'en': 'Low',
      'km': 'ទាប',
      'zh_Hant': '低的',
    },
    'lv8mudyp': {
      'en': 'Physical Tampering ',
      'km': 'ការរំខានរាងកាយ',
      'zh_Hant': '物理篡改',
    },
    '663fetca': {
      'en': 'No Power',
      'km': 'គ្មានថាមពល',
      'zh_Hant': '沒有電源',
    },
    '4eclcump': {
      'en': 'Archive (2)',
      'km': 'បណ្ណសារ (2)',
      'zh_Hant': '檔案 (2)',
    },
    'om243w92': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'bcd6oobm': {
      'en': 'Device ID',
      'km': 'លេខសម្គាល់ឧបករណ៍',
      'zh_Hant': '設備ID',
    },
    'iqbt46lw': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    'j7jibgr2': {
      'en': 'Alarm Date',
      'km': 'កាលបរិច្ឆេទរោទិ៍',
      'zh_Hant': '報警日期',
    },
    'em1glny1': {
      'en': 'Severity',
      'km': 'ភាពធ្ងន់ធ្ងរ',
      'zh_Hant': '嚴重性',
    },
    'w563ckwu': {
      'en': 'Type',
      'km': 'ប្រភេទ',
      'zh_Hant': '類型',
    },
    '6m2x7toy': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'vo3f7ngw': {
      'en': 'Actions',
      'km': 'សកម្មភាព',
      'zh_Hant': '行動',
    },
    'lmgj29g2': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    '4dedqark': {
      'en': 'DEV-456-789',
      'km': 'DEV-456-789',
      'zh_Hant': 'DEV-456-789',
    },
    'on5k34lo': {
      'en': 'Smart Meter #456',
      'km': 'Smart Meter #456',
      'zh_Hant': '智慧電錶#456',
    },
    '8zb2y4c1': {
      'en': '30-11-2024 \n13:15 PM',
      'km': '៣០-១១-២០២៤ \nម៉ោង ១៣:១៥ រសៀល',
      'zh_Hant': '2024年11月30日 \n下午 13:15',
    },
    'apu8uxvc': {
      'en': 'Critical',
      'km': 'រិះគន់',
      'zh_Hant': '批判的',
    },
    'r4c74xjn': {
      'en': 'Physical Tampering ',
      'km': 'ការរំខានរាងកាយ',
      'zh_Hant': '物理篡改',
    },
    'v3zkutvl': {
      'en': 'Power grid crash',
      'km': 'គាំងបណ្តាញអគ្គិសនី',
      'zh_Hant': '電網崩潰',
    },
  },
  // EventDetailView
  {
    'ynh7u35o': {
      'en': 'Alert Details',
      'km': 'ព័ត៌មានលម្អិតអំពីការជូនដំណឹង',
      'zh_Hant': '警報詳情',
    },
    't82supkf': {
      'en': 'Send Notification',
      'km': 'ផ្ញើការជូនដំណឹង',
      'zh_Hant': '發送通知',
    },
    'x17jjcdm': {
      'en': 'Alert ID',
      'km': 'លេខសម្គាល់ការជូនដំណឹង',
      'zh_Hant': '警報ID',
    },
    'o6j5535n': {
      'en': 'Device Name',
      'km': 'ឈ្មោះឧបករណ៍',
      'zh_Hant': '設備名稱',
    },
    '8wzbu8nb': {
      'en': 'Smart Meter #456',
      'km': 'Smart Meter #456',
      'zh_Hant': '智慧電錶#456',
    },
    'hmgxcci9': {
      'en': 'Device ID',
      'km': 'លេខសម្គាល់ឧបករណ៍',
      'zh_Hant': '設備ID',
    },
    'uogi8q03': {
      'en': 'DEV-456-789',
      'km': 'DEV-456-789',
      'zh_Hant': 'DEV-456-789',
    },
    '8agt68j0': {
      'en': 'Device Model',
      'km': 'ម៉ូដែលឧបករណ៍',
      'zh_Hant': '設備型號',
    },
    'txl3rf6q': {
      'en': 'SM-2000X',
      'km': 'SM-2000X',
      'zh_Hant': 'SM-2000X',
    },
    '9adbtyzf': {
      'en': 'Timestamp',
      'km': 'ត្រាពេលវេលា',
      'zh_Hant': '時間戳',
    },
    'y8aa4jff': {
      'en': '23-01-2024 14:30:45​​ ​PM',
      'km': '23-01-2024 14:30:45 ល្ងាច',
      'zh_Hant': '2024 年 1 月 23 日 14:30:45 下午',
    },
    'h39ksrme': {
      'en': 'Alert Type',
      'km': 'ប្រភេទការជូនដំណឹង',
      'zh_Hant': '警報類型',
    },
    'xl39cfpz': {
      'en': 'Physical Tampering Detection',
      'km': 'ការរកឃើញការរំខានរាងកាយ',
      'zh_Hant': '物理篡改檢測',
    },
    'tvdnhxwx': {
      'en': 'Severity Level',
      'km': 'កម្រិតនៃភាពធ្ងន់ធ្ងរ',
      'zh_Hant': '嚴重程度',
    },
    'ea2uk1lb': {
      'en': 'Critical',
      'km': 'រិះគន់',
      'zh_Hant': '批判的',
    },
    'c4z988yb': {
      'en': 'Source',
      'km': 'ប្រភព',
      'zh_Hant': '來源',
    },
    '08xdpo8l': {
      'en': 'Smart Meter System',
      'km': 'ប្រព័ន្ធ Smart Meter',
      'zh_Hant': '智慧電錶系統',
    },
    '5vuoarcu': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'o8u0y95d': {
      'en': 'Power grid crash',
      'km': 'គាំងបណ្តាញអគ្គិសនី',
      'zh_Hant': '電網崩潰',
    },
    'no8d31ya': {
      'en': 'Comment',
      'km': 'មតិយោបល់',
      'zh_Hant': '評論',
    },
    '033r7jg5': {
      'en': 'Input your comment...',
      'km': 'បញ្ចូលមតិរបស់អ្នក...',
      'zh_Hant': '輸入您的評論...',
    },
  },
  // AlertdeviceTest
  {
    'te1iwklb': {
      'en': 'Alert Center',
      'km': 'មជ្ឈមណ្ឌលជូនដំណឹង',
      'zh_Hant': '警報中心',
    },
    'd033nkbv': {
      'en': 'Active Alerts & Notifications',
      'km': 'ការជូនដំណឹង និងការជូនដំណឹងសកម្ម',
      'zh_Hant': '活動警報和通知',
    },
    '9hshxc2p': {
      'en': 'Meter Tampering Detected',
      'km': 'បានរកឃើញការរំខានម៉ែត្រ',
      'zh_Hant': '檢測到電錶篡改',
    },
    'cwr9b6en': {
      'en': 'Meter ID: ',
      'km': 'លេខសម្គាល់ម៉ែត្រ៖',
      'zh_Hant': '儀表 ID：',
    },
    '3s5cuuct': {
      'en': 'MT-2024-089',
      'km': 'MT-2024-089',
      'zh_Hant': 'MT-2024-089',
    },
    'nkzax25b': {
      'en': 'Date & Time :',
      'km': 'កាលបរិច្ឆេទ និងពេលវេលា៖',
      'zh_Hant': '日期和時間：',
    },
    'y9151lsf': {
      'en': '20-12-2024 10:30:00 AM',
      'km': '20-12-2024 10:30:00 ព្រឹក',
      'zh_Hant': '2024年12月20日 10:30:00 上午',
    },
    'b302oy5z': {
      'en': 'Description :',
      'km': 'ការពិពណ៌នា៖',
      'zh_Hant': '描述 ：',
    },
    've0i5t4l': {
      'en': 'EFA H-Modem Failure Condition became Inactive and Latched=>30C6',
      'km':
          'លក្ខខណ្ឌបរាជ័យរបស់ EFA H-Modem បានក្លាយជាអសកម្ម និង Laatched=>30C6',
      'zh_Hant': 'EFA H-數據機故障條件變為非活動狀態並鎖定=>30C6',
    },
    'gvzr8xss': {
      'en': 'Maintenance ',
      'km': 'ការថែទាំ',
      'zh_Hant': '維護',
    },
    'tix1kgcn': {
      'en': '5 meters require routine inspection',
      'km': '5 ម៉ែត្រតម្រូវឱ្យមានការត្រួតពិនិត្យជាប្រចាំ',
      'zh_Hant': '5米需要例行檢查',
    },
    '4mzsdcq9': {
      'en': 'Due by: March 15, 2024',
      'km': 'ផុតកំណត់ត្រឹមថ្ងៃទី ១៥ ខែមីនា ឆ្នាំ ២០២៤',
      'zh_Hant': '截止日期：2024 年 3 月 15 日',
    },
    'js9ffaxo': {
      'en': 'Low Battery Warning',
      'km': 'ការព្រមានអំពីថ្មទាប',
      'zh_Hant': '低電量警告',
    },
    't5o8jl7e': {
      'en': 'Meter ID: ',
      'km': 'លេខសម្គាល់ម៉ែត្រ៖',
      'zh_Hant': '儀表 ID：',
    },
    '38s4ogf1': {
      'en': 'MT-2024-156',
      'km': 'MT-2024-156',
      'zh_Hant': 'MT-2024-156',
    },
    'zn2ggkca': {
      'en': 'Date & Time : ',
      'km': 'កាលបរិច្ឆេទ និងពេលវេលា៖',
      'zh_Hant': '日期和時間：',
    },
    'fgh2aquz': {
      'en': '20-12-2024 09:30:00 AM',
      'km': '20-12-2024 09:30:00 ព្រឹក',
      'zh_Hant': '2024年12月20日 09:30:00 上午',
    },
    'p58klr4h': {
      'en': 'Description :',
      'km': 'ការពិពណ៌នា៖',
      'zh_Hant': '描述 ：',
    },
    'vgoe7p7a': {
      'en': 'Maintenance required within 48 hours',
      'km': 'ត្រូវការការថែទាំក្នុងរយៈពេល 48 ម៉ោង។',
      'zh_Hant': '48小時內需要維修',
    },
    'mz98ag6x': {
      'en': 'View All Alerts',
      'km': 'មើលការជូនដំណឹងទាំងអស់។',
      'zh_Hant': '查看所有警報',
    },
  },
  // DataTable
  {
    'cu05nf6n': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'wb9g2yho': {
      'en': 'Row per page: ',
      'km': 'ជួរដេកក្នុងមួយទំព័រ៖',
      'zh_Hant': '每頁行數：',
    },
    '7x32y8xt': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'azz7dtpn': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'nclvu6vc': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    '52i37ctl': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'bwc7kylj': {
      'en': '75',
      'km': '៧៥',
      'zh_Hant': '75',
    },
    'cs2vrncu': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
  },
  // SampleDataTable
  {
    'tgkddd6t': {
      'en': 'Edit Header 2',
      'km': 'កែសម្រួល​បឋមកថា ២',
      'zh_Hant': '編輯標題2',
    },
    'owhacu13': {
      'en': 'Edit Header 3',
      'km': 'កែសម្រួលបឋមកថា 3',
      'zh_Hant': '編輯標題 3',
    },
    '5ryd6wqs': {
      'en': 'Edit Header 4',
      'km': 'កែសម្រួលបឋមកថា 4',
      'zh_Hant': '編輯標題 4',
    },
    'cbs9j2j5': {
      'en': 'Edit Header 5',
      'km': 'កែសម្រួលបឋមកថា 5',
      'zh_Hant': '編輯標題 5',
    },
    'oikq9nyu': {
      'en': 'Edit Header 6',
      'km': 'កែសម្រួលបឋមកថា ៦',
      'zh_Hant': '編輯標題 6',
    },
    '1yag5if4': {
      'en': 'Edit Header 7',
      'km': 'កែសម្រួលបឋមកថា 7',
      'zh_Hant': '編輯標題 7',
    },
    'blghwo0x': {
      'en': 'Edit Column 2',
      'km': 'កែសម្រួលជួរឈរ 2',
      'zh_Hant': '編輯第 2 欄',
    },
    'wrweudak': {
      'en': 'Edit Column 3',
      'km': 'កែសម្រួលជួរឈរ 3',
      'zh_Hant': '編輯第3欄',
    },
    'be8d16q9': {
      'en': 'Edit Column 4',
      'km': 'កែសម្រួលជួរឈរ 4',
      'zh_Hant': '編輯第 4 欄',
    },
    'obxfkyup': {
      'en': 'Edit Column 5',
      'km': 'កែសម្រួលជួរឈរ 5',
      'zh_Hant': '編輯第5欄',
    },
    '5qaa78vo': {
      'en': 'Edit Column 6',
      'km': 'កែសម្រួលជួរឈរ 6',
      'zh_Hant': '編輯第6欄',
    },
    'sfdfht65': {
      'en': 'Edit Column 7',
      'km': 'កែសម្រួលជួរឈរ 7',
      'zh_Hant': '編輯第7欄',
    },
  },
  // ExportOptions
  {
    'uqqzzq6p': {
      'en': 'Export Options',
      'km': 'ជម្រើសនាំចេញ',
      'zh_Hant': '匯出選項',
    },
    'ft8xj8dl': {
      'en': '📄 CSV',
      'km': '📄 CSV',
      'zh_Hant': '📄 CSV',
    },
    'mbai51nz': {
      'en': '📊 Excel',
      'km': '📊 Excel',
      'zh_Hant': '📊 Excel',
    },
    '4marcwvx': {
      'en': '{ }  JSON',
      'km': '{ } JSON',
      'zh_Hant': '{ } JSON',
    },
    'm3r8xum7': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
      'zh_Hant': '確認',
    },
  },
  // Table
  {
    'um76ahy2': {
      'en': 'No.',
      'km': 'ទេ',
      'zh_Hant': '不。',
    },
    '8mz6lqh6': {
      'en': 'Row per page: ',
      'km': 'ជួរដេកក្នុងមួយទំព័រ៖',
      'zh_Hant': '每頁行數：',
    },
    '7zsvjbvc': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'njakc36m': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    '363sfl05': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'utpdehr2': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'vf80df98': {
      'en': '75',
      'km': '៧៥',
      'zh_Hant': '75',
    },
    '9j94iwxq': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
  },
  // MainLayout
  {
    'avomg3vq': {
      'en': 'Hi, Mr. Pov lyhoung',
      'km': 'សួស្តីលោក ពៅ លីហួង',
      'zh_Hant': '你好，Pov lyhoung 先生',
    },
    'xpnrs9fp': {
      'en': 'Houng-Coltd.com.ckh',
      'km': 'Houng-Coltd.com.ckh',
      'zh_Hant': 'Houng-Coltd.com.ckh',
    },
    'vlpxep5q': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
      'zh_Hant': '儀表板',
    },
    'huf89ifs': {
      'en': 'Device Management',
      'km': 'ការគ្រប់គ្រងឧបករណ៍',
      'zh_Hant': '設備管理',
    },
    '5gq74zkb': {
      'en': 'Devices',
      'km': 'ឧបករណ៍',
      'zh_Hant': '裝置',
    },
    '3tzguwy7': {
      'en': 'Configuration',
      'km': 'ការកំណត់រចនាសម្ព័ន្ធ',
      'zh_Hant': '配置',
    },
    'w9f54f82': {
      'en': 'Devices Group',
      'km': 'ឧបករណ៍',
      'zh_Hant': '裝置',
    },
    '50b7ap55': {
      'en': 'Schedule',
      'km': 'ឧបករណ៍',
      'zh_Hant': '裝置',
    },
    'z12xpthg': {
      'en': 'TOU Management',
      'km': 'ការគ្រប់គ្រង TOU',
      'zh_Hant': '分時使用管理',
    },
    '4hjx8ww1': {
      'en': 'TOU',
      'km': 'ទូ',
      'zh_Hant': '時令',
    },
    'ltwgn5zj': {
      'en': 'Time Bands',
      'km': 'ក្រុមតន្រ្តីពេលវេលា',
      'zh_Hant': '時間帶',
    },
    'ddl7jym0': {
      'en': 'Special Days',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'r2qu5hyr': {
      'en': 'Seasons',
      'km': 'រដូវ',
      'zh_Hant': '季節',
    },
    '0vdxi3as': {
      'en': 'Events',
      'km': 'ព្រឹត្តិការណ៍',
      'zh_Hant': '活動',
    },
    '870h5fm9': {
      'en': 'Settings',
      'km': 'ការកំណត់',
      'zh_Hant': '設定',
    },
    'agf32v6c': {
      'en': 'SIte',
      'km': 'គេហទំព័រ',
      'zh_Hant': '地點',
    },
    'nh0e3dsw': {
      'en': 'Security',
      'km': 'សន្តិសុខ',
      'zh_Hant': '安全',
    },
    '2djauuoj': {
      'en': 'Product Settings',
      'km': 'ការកំណត់ផលិតផល',
      'zh_Hant': '產品設定',
    },
    '64ah83v9': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
      'zh_Hant': '儀表板',
    },
    'dy4zkf6s': {
      'en': 'Device Management',
      'km': 'ការគ្រប់គ្រងឧបករណ៍',
      'zh_Hant': '設備管理',
    },
    '18mo360o': {
      'en': 'TOU Management',
      'km': 'ការគ្រប់គ្រង TOU',
      'zh_Hant': '分時使用管理',
    },
    'agdfym9l': {
      'en': 'Events',
      'km': 'ព្រឹត្តិការណ៍',
      'zh_Hant': '活動',
    },
    '3ffgvpj1': {
      'en': 'Settings',
      'km': 'ការកំណត់',
      'zh_Hant': '設定',
    },
  },
  // SpecialDayListView
  {
    'l1gyxin7': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    '337ckkqj': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '0hv4r6p3': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '5inxppyl': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'e7dzqhuf': {
      'en': 'Rows per page',
      'km': 'ជួរដេកក្នុងមួយទំព័រ',
      'zh_Hant': '每頁行數',
    },
    'i9rta7xw': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'mpu728kb': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'ervw23mi': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'prb98rh0': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'xzimepbq': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'hcwyc40t': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'wisbl6r7': {
      'en': '1',
      'km': '១',
      'zh_Hant': '1',
    },
    'hdjrqzx2': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
  },
  // SpecialDayAction
  {
    'xemtb2c5': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
      'zh_Hant': '更新',
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
  // SpecialDayView
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
    'az6fwdry': {
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
      'en': 'Please input Start date',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '請輸入開始日期',
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
      'en': 'Please input End date',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '請輸入結束日期',
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
    '778t2g6k': {
      'en': 'Please input Name',
      'km': 'សូមបញ្ចូលឈ្មោះ',
      'zh_Hant': '請輸入姓名',
    },
    'z1b0wxfu': {
      'en': 'Input exceeds the maximum allowed characters {nameMaxLength}.',
      'km': 'ការបញ្ចូលលើសពីតួអក្សរដែលអនុញ្ញាតអតិបរមា {nameMaxLength}។',
      'zh_Hant': '輸入超出允許的最大字元數 {nameMaxLength}。',
    },
    'crtypemf': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '68bf07i0': {
      'en': 'Please enter validation date.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទសុពលភាព។',
      'zh_Hant': '請輸入驗證日期。',
    },
    'whqlzd5y': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '925tgrip': {
      'en': 'Please enter validation date.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទសុពលភាព។',
      'zh_Hant': '請輸入驗證日期。',
    },
    'zq6fr3wc': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
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
      'zh_Hant': '節省',
    },
  },
  // ItemSpecialDayDetials
  {
    '2meco7mg': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '3i8h9mot': {
      'en': 'Input date',
      'km': 'កាលបរិច្ឆេទបញ្ចូល',
      'zh_Hant': '輸入日期',
    },
    'j5aobh86': {
      'en': 'Input date',
      'km': 'កាលបរិច្ឆេទបញ្ចូល',
      'zh_Hant': '輸入日期',
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
    '33bv5u8d': {
      'en': 'Name is required',
      'km': 'ទាមទារឈ្មោះ',
      'zh_Hant': '姓名為必填項',
    },
    'sndjn3ia': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'eh21va4y': {
      'en': 'StartDate is required',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើមត្រូវបានទាមទារ',
      'zh_Hant': '開始日期為必填項',
    },
    'armoybde': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'qae6u1p6': {
      'en': 'EndDate is required',
      'km': 'កាលបរិច្ឆេទបញ្ចប់ត្រូវបានទាមទារ',
      'zh_Hant': '結束日期為必填項',
    },
    'q3lxqrvt': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '0md8rln5': {
      'en': 'Description is required',
      'km': 'ការពិពណ៌នាត្រូវបានទាមទារ',
      'zh_Hant': '描述為必填項',
    },
    'ixp76bv9': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
  },
  // SpecialDayAddView
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
      'en': 'Calendars',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
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
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'tjpd96td': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
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
      'zh_Hant': '取消',
    },
    'unljzidu': {
      'en': 'Save',
      'km': 'រក្សាទុក',
      'zh_Hant': '節省',
    },
  },
  // SpecialDayDetailView
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
      'en': 'Field is required.',
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
      'en': 'Calendars',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
    },
    'xfz6dmlv': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
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
    '5ubf06ta': {
      'en': 'Sample API Call',
      'km': 'ការហៅ API គំរូ',
      'zh_Hant': 'API 呼叫範例',
    },
    'lfxqeq6h': {
      'en': 'Search ....',
      'km': 'ស្វែងរក....',
      'zh_Hant': '搜尋 ....',
    },
    'uuqwfarv': {
      'en': 'Options',
      'km': 'ជម្រើស',
      'zh_Hant': '選項',
    },
    '48cu76nm': {
      'en': 'Add',
      'km': 'បន្ថែម',
      'zh_Hant': '添加',
    },
    'd6ejze12': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'detvzfph': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'nu6y838r': {
      'en': 'Descriptions',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '說明',
    },
    'thjk8lwh': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'l5do3v85': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    'hi8kayjq': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    'zr1fam28': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    '4fhwcvbv': {
      'en': 'Sample API Call V2',
      'km': 'ការហៅ API គំរូ V2',
      'zh_Hant': 'API 呼叫範例 V2',
    },
    'wy97rnok': {
      'en': 'Search ....',
      'km': 'ស្វែងរក....',
      'zh_Hant': '搜尋 ....',
    },
    'xvuca1i0': {
      'en': 'Row per page',
      'km': 'ជួរដេកក្នុងមួយទំព័រ',
      'zh_Hant': '每頁行數',
    },
    'dbchldks': {
      'en': '5',
      'km': '៥',
      'zh_Hant': '5',
    },
    '09slqjkl': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ksoxenmu': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'vggvvr4j': {
      'en': '5',
      'km': '៥',
      'zh_Hant': '5',
    },
    '7nfkm578': {
      'en': '10',
      'km': '១០',
      'zh_Hant': '10',
    },
    'orufeewg': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    '4ng7b629': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'qxxmhkq0': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    '4ir9c54y': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
  },
  // ActionHeader
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
  // SiteListView
  {
    'x2lumm5n': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'y4edeqdr': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'd79s7v47': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'g8c0zcqw': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'q5dd749w': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    '9ps4yjnp': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '9le23u0n': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'qmc3ubgi': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'ydrxdz1q': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'a841zfmo': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    '8vecf9ax': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'b79tv1vm': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // siteActions
  {
    'bewmrcdb': {
      'en': 'Update',
      'km': 'កែប្រែ',
      'zh_Hant': '編輯',
    },
    'xg6dc4xi': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    'n7ulcg34': {
      'en': 'View',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
  },
  // MainSiteDetialView
  {
    't5z0zxo7': {
      'en': 'Main Site',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    'meflyv6z': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '8ywnzohi': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '9g8q2nv5': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '9rh5p2yk': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'b5c969xm': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'x8xmonku': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'zxf5ybvn': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ch8yy6m1': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'djqquj4m': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'evvzda4p': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'loob21nw': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '0of8akb5': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'rcvmk3ku': {
      'en': 'Sub-Site',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
    },
    '9qzab83m': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'x6ksy5c9': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'fgznugqo': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'iuzq7nzy': {
      'en': 'Description',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
  },
  // SubSiteDetailView
  {
    'xhbv5vcc': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'jhcr6axb': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '62jfhv4l': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '3txt165i': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'i6lyjjph': {
      'en': 'Choose Main',
      'km': '',
      'zh_Hant': '',
    },
    'mmamjy4j': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'bpsxgy5i': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'ftmg3n8u': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'v4mywfue': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'atykpckv': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '0oekajqi': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'cyvsm3s7': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'n03if8ic': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'ddr2m4r5': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'uigb454x': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
  },
  // CutomizeDataTable
  {
    '9ccg81x9': {
      'en': 'Search ....',
      'km': '',
      'zh_Hant': '',
    },
    't2e1kgae': {
      'en': 'Options',
      'km': '',
      'zh_Hant': '',
    },
    'k6gagfwi': {
      'en': 'Add',
      'km': '',
      'zh_Hant': '',
    },
    'nwzg97ch': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
  },
  // MoreOptions
  {
    'mbefuwhe': {
      'en': 'Edit',
      'km': 'កែប្រែ',
      'zh_Hant': '編輯',
    },
    'utkn5qxk': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    'rynvtkil': {
      'en': 'View',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
    '4yhtrzh3': {
      'en': 'Switch Parent',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
  },
  // RowHeaderWidget
  {
    '4f87vdih': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'dd975duo': {
      'en': 'Descriptions',
      'km': '',
      'zh_Hant': '',
    },
    'ft1yi546': {
      'en': 'Active',
      'km': '',
      'zh_Hant': '',
    },
    'y63izy48': {
      'en': 'Id',
      'km': '',
      'zh_Hant': '',
    },
  },
  // RowHeader
  {
    'zs84t4zm': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
  },
  // HideShowColumn
  {
    '21yt57w3': {
      'en': 'Column 1',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SpecialDaySideBar
  {
    '7ik0x8cn': {
      'en': 'Calendars',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
    },
    '9gyi0lym': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    '9hi900q8': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '80r0uu60': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    '2jpx8y77': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
  },
  // HandelMessage
  {
    'qd2t3w18': {
      'en': 'Close',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DataEmtpy
  {
    'a45q5fyy': {
      'en': 'No Results Found',
      'km': '',
      'zh_Hant': '',
    },
    'gf3hou5u': {
      'en':
          'We couldn\'t find what you\'re looking for. Please try a different search term.',
      'km': '',
      'zh_Hant': '',
    },
  },
  // NoData
  {
    '8kw0aw5e': {
      'en': 'No Data Available',
      'km': '',
      'zh_Hant': '',
    },
    'b3nyimnz': {
      'en':
          'There is no data to display at this time. Please check back later or try a different selection.',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandDetailView
  {
    '11awrpe8': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'idn4cniy': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'mmksim2a': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'j03192em': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '233y07kx': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'f5xn4wgy': {
      'en': 'Hello World',
      'km': '',
      'zh_Hant': '',
    },
    'lsfefaj6': {
      'en': 'Start Time',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    '5ydx4m3k': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '0wo379la': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5vv5nvqi': {
      'en': 'Please pick start time.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទត្រឹមត្រូវ',
      'zh_Hant': '請輸入有效日期',
    },
    's613delp': {
      'en': 'End Time',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
    'pc9ovwcd': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '9pgj8nfc': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'sd4tzc83': {
      'en': 'Please pick end time.',
      'km': 'សូមបញ្ចូលកាលបរិច្ឆេទត្រឹមត្រូវ',
      'zh_Hant': '請輸入有效日期',
    },
    'noqcqesd': {
      'en': 'Day of Week',
      'km': '',
      'zh_Hant': '',
    },
    'm3oxqw8e': {
      'en': 'Jan',
      'km': '',
      'zh_Hant': '',
    },
    '9yrdtzbl': {
      'en': 'Month of Year',
      'km': '',
      'zh_Hant': '',
    },
    'opgnib83': {
      'en': 'Jan',
      'km': '',
      'zh_Hant': '',
    },
    '1oiuddpu': {
      'en': 'Season',
      'km': '',
      'zh_Hant': '',
    },
    'cj77ou7f': {
      'en': 'Special Day',
      'km': '',
      'zh_Hant': '',
    },
    'l9vpbnnz': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'ia4oi2u2': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'v19rj06w': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'kxfd3zz6': {
      'en': 'Please input name!',
      'km': '',
      'zh_Hant': '',
    },
    '1hv2s834': {
      'en': 'Cannot exceed 200 characters.',
      'km': '',
      'zh_Hant': '',
    },
    'lzn3h0rm': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'ucw10g6e': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '2otyzb60': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'j0cvl92b': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'ra5k1jtq': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '4ol9bjlc': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '9yrq2915': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SeasonDetailView
  {
    'gsr9ru5h': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    '9hx1y2o7': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'igur5j0j': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'jg9v9ben': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'y33e9xrd': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'yx0opaa4': {
      'en': 'Month Range',
      'km': '',
      'zh_Hant': '',
    },
    '3vzcbl1j': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    '5hjt48jo': {
      'en': 'Jan',
      'km': '',
      'zh_Hant': '',
    },
    'zgd68vgy': {
      'en': 'Please choose month range.',
      'km': '',
      'zh_Hant': '',
    },
    'nz8z7oqe': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    'anul3nto': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ewho5ruv': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '3zalvfgk': {
      'en': 'Field is required.',
      'km': '',
      'zh_Hant': '',
    },
    'frqtgqsk': {
      'en': 'Cannot exceed 200 characters.',
      'km': '',
      'zh_Hant': '',
    },
    'vjm94d1e': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'aq0tua7w': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '2ijtylrb': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
  },
  // Channel
  {
    'njr1nedm': {
      'en': 'Channel',
      'km': '',
      'zh_Hant': '',
    },
    '6y54yrxt': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'yna2r814': {
      'en': 'No.',
      'km': '',
      'zh_Hant': '',
    },
    'iuzrtmfd': {
      'en': 'Code',
      'km': '',
      'zh_Hant': '',
    },
    '60d2q7ya': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TouDetailLists
  {
    'u31p9751': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'fw805qpy': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'euhy7mtn': {
      'en': 'Code',
      'km': '',
      'zh_Hant': '',
    },
    'ulyvnwhz': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'se0itetu': {
      'en': 'Description',
      'km': '',
      'zh_Hant': '',
    },
    '2ajbst1z': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'x5wc552b': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'py8nxtdn': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'kqp62tzp': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '0zrohftp': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'hk10918p': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    '5b1z492n': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '7n7augk6': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // actionTOU
  {
    '8g38y2rh': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    '54devvx7': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    'r0aler84': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // ProfileWidget
  {
    '9fdm6ytj': {
      'en': 'Profile',
      'km': '',
      'zh_Hant': '',
    },
    '2564cc8m': {
      'en': 'Languages',
      'km': '',
      'zh_Hant': '',
    },
    'oqioizfe': {
      'en': 'Appearance',
      'km': '',
      'zh_Hant': '',
    },
    '3fipwrhm': {
      'en': 'Sign out',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cDeviceList
  {
    '3npifaol': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'vznth2h8': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    '0l5qtnz2': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    '9x7jflck': {
      'en': 'DeviceType',
      'km': '',
      'zh_Hant': '',
    },
    '77jkcon4': {
      'en': 'Model',
      'km': '',
      'zh_Hant': '',
    },
    '4wfherxw': {
      'en': 'Manufacturer',
      'km': '',
      'zh_Hant': '',
    },
    'q9k5o5n9': {
      'en': 'Status',
      'km': '',
      'zh_Hant': '',
    },
    '67ph7ufe': {
      'en': 'Link Status',
      'km': '',
      'zh_Hant': '',
    },
    'dcx8fbv4': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'n7mpgjuj': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'ib4gcnwt': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'zyt9svov': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '0jfliwpf': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'dmd4fqa4': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'md0z6dsb': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '6geojjgw': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
    '67y9wd9s': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'rsqabpyn': {
      'en': 'Device List',
      'km': '',
      'zh_Hant': '',
    },
    'i34zpf88': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'hyh9jxlr': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'huze6x2w': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'z165l34f': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'nwzttfeq': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'vfynp80l': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'h4uaapnd': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // caddList
  {
    'n5n1gepc': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
  },
  // cAddList
  {
    'ryoh77pq': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'ccvea7bl': {
      'en': 'Input date',
      'km': 'កាលបរិច្ឆេទបញ្ចូល',
      'zh_Hant': '輸入日期',
    },
    'l2kiitbh': {
      'en': 'Input date',
      'km': 'កាលបរិច្ឆេទបញ្ចូល',
      'zh_Hant': '輸入日期',
    },
    'sq0at4sb': {
      'en': 'Victory Day',
      'km': 'ទិវាជ័យជំនះ',
      'zh_Hant': '勝利日',
    },
    'eob6runt': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'mshgiu6s': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'a88r2mvv': {
      'en': 'Name is required',
      'km': 'ទាមទារឈ្មោះ',
      'zh_Hant': '姓名為必填項',
    },
    'lu9cws3r': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    '8jxoutpg': {
      'en': 'StartDate is required',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើមត្រូវបានទាមទារ',
      'zh_Hant': '開始日期為必填項',
    },
    'wffx6cj8': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'tdmqx1ce': {
      'en': 'EndDate is required',
      'km': 'កាលបរិច្ឆេទបញ្ចប់ត្រូវបានទាមទារ',
      'zh_Hant': '結束日期為必填項',
    },
    'qbih4bhs': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'rx43t6y9': {
      'en': 'Description is required',
      'km': 'ការពិពណ៌នាត្រូវបានទាមទារ',
      'zh_Hant': '描述為必填項',
    },
    'vrfv9bn7': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
  },
  // cActionV1
  {
    'kiafdl00': {
      'en': 'Update',
      'km': 'កែប្រែ',
      'zh_Hant': '編輯',
    },
    '59fh84n1': {
      'en': 'Delete',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    'd00bvd7a': {
      'en': 'View',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
  },
  // cAddIntegration
  {
    '4yicmh15': {
      'en': 'Add  items ...',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cSelectorMenuItems
  {
    'k8yqr9t3': {
      'en': 'Search....',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cActionV2
  {
    'wrogqnkr': {
      'en': 'Commissioning',
      'km': 'កែប្រែ',
      'zh_Hant': '編輯',
    },
    'hzgdlumb': {
      'en': 'Decommissioning',
      'km': 'លុប',
      'zh_Hant': '刪除',
    },
    '2qcgsbid': {
      'en': 'Ping',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
    'sqqtwjps': {
      'en': 'Link HES',
      'km': 'មើល',
      'zh_Hant': '看法',
    },
  },
  // cFilterV1
  {
    'bl4yfly2': {
      'en': 'Phase',
      'km': '',
      'zh_Hant': '',
    },
    'e7uszrz7': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'kctgzec3': {
      'en': 'Units',
      'km': '',
      'zh_Hant': '',
    },
    'wmcrmpgv': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'yuocxwxn': {
      'en': 'FlowDirection',
      'km': '',
      'zh_Hant': '',
    },
    '43oecpie': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'a4pjdezm': {
      'en': 'ApportionPolicy',
      'km': '',
      'zh_Hant': '',
    },
    'p9vbmgez': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
  },
  // checkFilter
  {
    'bg5tb3o0': {
      'en': 'Select All',
      'km': '',
      'zh_Hant': '',
    },
  },
  // SelectTimeOfUse
  {
    'l024wlxu': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'c8j4mkfa': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'kfiy10zg': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cValidationTOUDynamic
  {
    'cibid23o': {
      'en': 'TOU Validation',
      'km': '',
      'zh_Hant': '',
    },
    'jcxp4169': {
      'en': 'Hour',
      'km': '',
      'zh_Hant': '',
    },
    '2j0eifqz': {
      'en': 'Sun',
      'km': '',
      'zh_Hant': '',
    },
    'uhp70d08': {
      'en': 'Mon',
      'km': '',
      'zh_Hant': '',
    },
    '3vb6ji73': {
      'en': 'Tue',
      'km': '',
      'zh_Hant': '',
    },
    '7aoqgpma': {
      'en': 'Wed',
      'km': '',
      'zh_Hant': '',
    },
    'sl1p8fgg': {
      'en': 'Thu',
      'km': '',
      'zh_Hant': '',
    },
    '77be91nw': {
      'en': 'Fri',
      'km': '',
      'zh_Hant': '',
    },
    'bmggjw86': {
      'en': 'Sat',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DynamicTable
  {
    'ndyy9o96': {
      'en': 'Hour',
      'km': '',
      'zh_Hant': '',
    },
    'k71n8l50': {
      'en': 'Sun',
      'km': '',
      'zh_Hant': '',
    },
    'of4wcjw9': {
      'en': 'Sun',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBand
  {
    'tyj6v1yz': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    '8c4sll3j': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'q1wt0x07': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'mdc5l0ca': {
      'en': 'Start Time',
      'km': 'ពេលវេលាចាប់ផ្តើម',
      'zh_Hant': '開始時間',
    },
    '235eh6zv': {
      'en': 'End Time',
      'km': 'ពេលវេលាបញ្ចប់',
      'zh_Hant': '結束時間',
    },
    'oynmq76n': {
      'en': 'Description',
      'km': 'ថ្ងៃនៃសប្តាហ៍',
      'zh_Hant': '星期幾',
    },
  },
  // TimeBandSeasonDropDown
  {
    'r2w382jt': {
      'en': 'Search....',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandSpecialDayDetail
  {
    'tw0lw5nk': {
      'en': 'Special Day',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    '48m2gjk3': {
      'en': 'Name',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '9ueay98x': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'dzoejxvl': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'hhvts02e': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'g40v72b8': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'hfy8xy4u': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'yy8p5rwv': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'deykzc55': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'f2xiityh': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'xing1hrj': {
      'en': 'Calendar',
      'km': 'ព័ត៌មានលម្អិតថ្ងៃពិសេស',
      'zh_Hant': '特別日子詳情',
    },
    '28a4qi8y': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'sf2ezig8': {
      'en': 'Start Date',
      'km': 'កាលបរិច្ឆេទចាប់ផ្តើម',
      'zh_Hant': '開始日期',
    },
    't1f0edv7': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
      'zh_Hant': '結束日期',
    },
  },
  // TimeBandSeasonDetail
  {
    '2smr7ded': {
      'en': 'Season',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    '7enpqgol': {
      'en': 'Name',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'nt3hrg7d': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    '49wynbt1': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'uuqu0xs2': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'daf7xozc': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'jmhaubzo': {
      'en': 'Month Range',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'vtv0alju': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'v3uzlo5v': {
      'en': 'Jan',
      'km': '',
      'zh_Hant': '',
    },
    '8a4tbpet': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'mub76t8a': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    't73oxaz5': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'onpmnpbp': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandSpecialDayDropDown
  {
    '3ykte2gv': {
      'en': 'Search....',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandTimePicker
  {
    'gns85tx9': {
      'en': 'Select Time',
      'km': '',
      'zh_Hant': '',
    },
    'e171kuwa': {
      'en': 'Hour',
      'km': '',
      'zh_Hant': '',
    },
    '6iwcxako': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'yhb4wc9n': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'd6lzjuhz': {
      'en': 'Minute',
      'km': '',
      'zh_Hant': '',
    },
    '5v4d9xpf': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '5yl5joqn': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '33o7c7u9': {
      'en': '15 mn',
      'km': '',
      'zh_Hant': '',
    },
    'scgqzalk': {
      'en': '30 mn',
      'km': '',
      'zh_Hant': '',
    },
    '4j1rxuhm': {
      'en': '45 mn',
      'km': '',
      'zh_Hant': '',
    },
    'z16g17ld': {
      'en': 'Cancel',
      'km': '',
      'zh_Hant': '',
    },
    '6x8kroxz': {
      'en': 'OK',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DeviceGroupView
  {
    'lmezrv0s': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    '6uamde37': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'c7zt2wl1': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '3w76s1c7': {
      'en': 'Total Device',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'cwsr0tsf': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'r8bf2pcd': {
      'en': 'Rows per page',
      'km': 'ជួរដេកក្នុងមួយទំព័រ',
      'zh_Hant': '每頁行數',
    },
    '4pux1qlv': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    'acd76xsd': {
      'en': 'Search...',
      'km': 'ស្វែងរក...',
      'zh_Hant': '搜尋...',
    },
    'x3uj1ub8': {
      'en': '25',
      'km': '២៥',
      'zh_Hant': '25',
    },
    '847r3cc1': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '35lt9jgm': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'v2z49293': {
      'en': 'of',
      'km': 'នៃ',
      'zh_Hant': '的',
    },
  },
  // SeasonAction
  {
    'tckv3odd': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    'x8f5e8w1': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    'td172q60': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // TimeBandsAction
  {
    '26bs26ix': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    '523e1j2u': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    'c0x0i0rm': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cScheduleList
  {
    'km2xo6ae': {
      'en': 'Search',
      'km': 'ស្វែងរក',
      'zh_Hant': '搜尋',
    },
    'qjdyfazd': {
      'en': 'Add',
      'km': '',
      'zh_Hant': '',
    },
    'vg29sked': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    'gz4rx2rp': {
      'en': 'Start Date\t',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '5hpqjjqs': {
      'en': 'End Date\t',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'q9yb5abr': {
      'en': 'Schedule Type',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'mkygjnvw': {
      'en': 'Interval',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    '2afnesm4': {
      'en': 'Last Execute Time',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    'y4bjbgsf': {
      'en': 'Next Execute Time',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    'usxl8bpx': {
      'en': 'Status',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '3r4k6ky0': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'yqypo4tl': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'xbfyu0mf': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'jqvdqu8v': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'y7ebz54f': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'gd1nfv5w': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'byl75b16': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'iq90hj51': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DeviceListForGroup
  {
    'f4hknbof': {
      'en': 'Device',
      'km': '',
      'zh_Hant': '',
    },
    '0y2wghtl': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    '834neh7o': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    '20twao5o': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    'dgavhfhj': {
      'en': 'DeviceType',
      'km': '',
      'zh_Hant': '',
    },
    '5eovhw18': {
      'en': 'Model',
      'km': '',
      'zh_Hant': '',
    },
    'jik6z8l0': {
      'en': 'Manufacturer',
      'km': '',
      'zh_Hant': '',
    },
    'uvb549a3': {
      'en': 'Status',
      'km': '',
      'zh_Hant': '',
    },
    'sgeg4ni9': {
      'en': 'Link Status',
      'km': '',
      'zh_Hant': '',
    },
    'sxtuddl1': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    'lqvj6x89': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'mous6rba': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'put3mjpn': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'jbn5f7w7': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '2534qjps': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'vui6w67z': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    '49on34he': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '3px2fgmo': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cOptionAddSchedule
  {
    'vzy2rcjh': {
      'en': 'Device Schedule',
      'km': '',
      'zh_Hant': '',
    },
    '3m4l63xx': {
      'en': 'Device Group Schedule',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cScheduleView
  {
    '0xojnzg9': {
      'en': 'Schedule',
      'km': '',
      'zh_Hant': '',
    },
    'ncy1evsc': {
      'en': 'Schedule Type',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '68nk92of': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '79oxvz0o': {
      'en': 'Select Schedule Type',
      'km': '',
      'zh_Hant': '',
    },
    'xmbl4rst': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '0yqrej6i': {
      'en': 'Schedule Type is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'hofvfwyl': {
      'en': 'Interval',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'cieelek5': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'si11w2b7': {
      'en': 'Select Interval',
      'km': '',
      'zh_Hant': '',
    },
    'rrvt3d5c': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'ag12u5q9': {
      'en': 'InterValue',
      'km': '',
      'zh_Hant': '',
    },
    'umgylchz': {
      'en': 'Interval is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'ttapyk0l': {
      'en': 'Start Date',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'a5pffgon': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '42dauzm7': {
      'en': 'Start Date is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'g25hgy6y': {
      'en': 'End Date',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'r2japc50': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'zas8i17v': {
      'en': 'LastExecutedTime',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '90wkj4t1': {
      'en': 'NextExecuteTime',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'lgok66dk': {
      'en': 'RetryCount',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '9oimhjmw': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'jxihbh3q': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'yaybx6z6': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ma9gied4': {
      'en': 'RetryCount is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'huhqx4l3': {
      'en': 'Status',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '7znp8i97': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'uy90jt7q': {
      'en': 'Billing Device',
      'km': '',
      'zh_Hant': '',
    },
    'gtp9d36m': {
      'en': 'Device',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '8z6z3kw3': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '2v7ej0d4': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'oj8xfbsr': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '8w9g48jj': {
      'en': 'Device is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '4bfdosc3': {
      'en': 'DeviceGroup',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'jvtsairu': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '986hs42m': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'eibczyc4': {
      'en': 'DeviceGroup is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'kymd4nyc': {
      'en': 'Site',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'pym64z7p': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'jemoqw2h': {
      'en': 'Select Site',
      'km': '',
      'zh_Hant': '',
    },
    '3xewe3p7': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'xhkrcili': {
      'en': 'Site is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '43bq4g4r': {
      'en': 'TimeOfUse',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '0bc91uwp': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    'g6h8wpk3': {
      'en': 'Select TimeOfUse',
      'km': '',
      'zh_Hant': '',
    },
    'l1lrjpi7': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'wghnsbgp': {
      'en': 'TimeOfUse is require!',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'im9aa4ok': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '724il945': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '0nxwkiy9': {
      'en': 'More Info',
      'km': '',
      'zh_Hant': '',
    },
    'o4eb6ryl': {
      'en': 'Device',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '7htjhdp2': {
      'en': 'SerialNumber :',
      'km': '',
      'zh_Hant': '',
    },
    'metuyi2t': {
      'en': 'DeviceType :',
      'km': '',
      'zh_Hant': '',
    },
    'xop0slzp': {
      'en': 'Model :',
      'km': '',
      'zh_Hant': '',
    },
    '3rq4jt1c': {
      'en': 'Manufacturer :',
      'km': '',
      'zh_Hant': '',
    },
    'gtrznpiw': {
      'en': 'Status :',
      'km': '',
      'zh_Hant': '',
    },
    'lod9xqbe': {
      'en': 'Link Status :',
      'km': '',
      'zh_Hant': '',
    },
    '1xvp6l5c': {
      'en': 'Device Group',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'yaem29sc': {
      'en': 'Name :',
      'km': '',
      'zh_Hant': '',
    },
    'a57ltdr4': {
      'en': 'Desciption :',
      'km': '',
      'zh_Hant': '',
    },
    'k802pt11': {
      'en': 'Total Device :',
      'km': '',
      'zh_Hant': '',
    },
    't050ugnt': {
      'en': 'Site',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    '09se6yrx': {
      'en': 'Name :',
      'km': '',
      'zh_Hant': '',
    },
    'nxfm6lma': {
      'en': 'Desciption :',
      'km': '',
      'zh_Hant': '',
    },
    'mpy3krwa': {
      'en': 'Total Sub Site :',
      'km': '',
      'zh_Hant': '',
    },
    'rzko2pig': {
      'en': 'TimeOfUse',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'j3yd2hkp': {
      'en': 'Code :',
      'km': '',
      'zh_Hant': '',
    },
    't0f6wzu7': {
      'en': 'Name :',
      'km': '',
      'zh_Hant': '',
    },
    '4gu4nb7n': {
      'en': 'Desciption :',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cScheduleAction
  {
    'o556ry09': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    '4kqthhih': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    'c18ele5m': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // deviceInfos
  {
    'kudfk4o5': {
      'en': 'Device Info',
      'km': '',
      'zh_Hant': '',
    },
    '3izc82m1': {
      'en': 'Channel',
      'km': '',
      'zh_Hant': '',
    },
    'les8is87': {
      'en': 'Code',
      'km': '',
      'zh_Hant': '',
    },
    'g2p7cric': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'wmi371lt': {
      'en': 'Unit',
      'km': '',
      'zh_Hant': '',
    },
    'iivuhp38': {
      'en': 'Flow Direction',
      'km': '',
      'zh_Hant': '',
    },
    'h48ws1kk': {
      'en': 'Device Attribute',
      'km': '',
      'zh_Hant': '',
    },
    'oabzmjzt': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'k9lvn4jd': {
      'en': 'Value',
      'km': '',
      'zh_Hant': '',
    },
    'ff3kfpbr': {
      'en': 'Load Profile',
      'km': '',
      'zh_Hant': '',
    },
    '29etfnv7': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'xjs7el2i': {
      'en': 'Date Time',
      'km': '',
      'zh_Hant': '',
    },
    '1ng2x9xl': {
      'en': 'Value',
      'km': '',
      'zh_Hant': '',
    },
    'mv1y09bc': {
      'en': 'Units',
      'km': '',
      'zh_Hant': '',
    },
    '0q622srs': {
      'en': 'Flow Direction',
      'km': '',
      'zh_Hant': '',
    },
    't0clw49s': {
      'en': 'Phase',
      'km': '',
      'zh_Hant': '',
    },
    '51r6nr6p': {
      'en': 'Apportion Policy',
      'km': '',
      'zh_Hant': '',
    },
    '0iagpyev': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'abmvi9q5': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'owai7qnl': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'oa1b23r6': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'ma7ofk3j': {
      'en': '50',
      'km': '',
      'zh_Hant': '',
    },
    'jtfhlgqa': {
      'en': '100',
      'km': '',
      'zh_Hant': '',
    },
    'wg5ivag0': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '1odz4rgh': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
    '6mpi94hr': {
      'en': 'Reading',
      'km': '',
      'zh_Hant': '',
    },
    '3yikwmuj': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'tnbf2t6p': {
      'en': 'Value',
      'km': '',
      'zh_Hant': '',
    },
    'x79a7bs6': {
      'en': 'Meter ID',
      'km': '',
      'zh_Hant': '',
    },
    'kx4xzgc8': {
      'en': 'Meter ID',
      'km': '',
      'zh_Hant': '',
    },
    'vjn1tsoi': {
      'en': 'Device Specification',
      'km': '',
      'zh_Hant': '',
    },
    'evbhb5q5': {
      'en': 'Name',
      'km': '',
      'zh_Hant': '',
    },
    'rp6hgude': {
      'en': 'Value',
      'km': '',
      'zh_Hant': '',
    },
    'f7aqwyc1': {
      'en': 'Voltage Rating',
      'km': '',
      'zh_Hant': '',
    },
    '6mh01k7c': {
      'en': '\t230V',
      'km': '',
      'zh_Hant': '',
    },
    'eqw9jn49': {
      'en': 'Schedule',
      'km': '',
      'zh_Hant': '',
    },
    'krd55jp8': {
      'en': 'From',
      'km': '',
      'zh_Hant': '',
    },
    'd3ryqnzd': {
      'en': 'Start Date',
      'km': '',
      'zh_Hant': '',
    },
    'phc4i99d': {
      'en': 'End Date',
      'km': '',
      'zh_Hant': '',
    },
    'fbamm210': {
      'en': 'Type',
      'km': '',
      'zh_Hant': '',
    },
    'wrmggmoh': {
      'en': 'Interval',
      'km': '',
      'zh_Hant': '',
    },
    '2jlqeh0l': {
      'en': 'Retry Count',
      'km': '',
      'zh_Hant': '',
    },
    '77nkjo0b': {
      'en': 'Retry Count',
      'km': '',
      'zh_Hant': '',
    },
    'wzv3bzfz': {
      'en': 'Location',
      'km': '',
      'zh_Hant': '',
    },
    '3h0rmks8': {
      'en': 'Location',
      'km': '',
      'zh_Hant': '',
    },
    'o4fyc7t5': {
      'en': 'Latitude',
      'km': '',
      'zh_Hant': '',
    },
    'fj4ixuty': {
      'en': 'Longitude',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cDeviceListforSearch
  {
    'f7laizuz': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'wgru1aok': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    '1crkl27x': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    'rnsly7in': {
      'en': 'DeviceType',
      'km': '',
      'zh_Hant': '',
    },
    'al8qoibq': {
      'en': 'Model',
      'km': '',
      'zh_Hant': '',
    },
    '4amcesy1': {
      'en': 'Manufacturer',
      'km': '',
      'zh_Hant': '',
    },
    '87863w1g': {
      'en': 'Status',
      'km': '',
      'zh_Hant': '',
    },
    'kqkfvirc': {
      'en': 'Link Status',
      'km': '',
      'zh_Hant': '',
    },
    'q4zlxa6s': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'zk2wt5xr': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '17a5vxkg': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '2sg8lw6l': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    '2876a7wm': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'bribau8d': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'l9gitggq': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'mk4fe65r': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
    'nrg9tuyp': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    '4xhcbhys': {
      'en': 'Device List',
      'km': '',
      'zh_Hant': '',
    },
    's7yx13kx': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'q8jhodh7': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '0dmkrymp': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'vr6o4arm': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '23lv94hw': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    '8475qivx': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'jue5qzal': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cIntegration
  {
    'ta9qucdg': {
      'en': 'Integration',
      'km': '',
      'zh_Hant': '',
    },
    'luyre64q': {
      'en': 'TOU',
      'km': '',
      'zh_Hant': '',
    },
    'naqfutvy': {
      'en': 'Select TOU',
      'km': '',
      'zh_Hant': '',
    },
    '7htm0tt9': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '5900fmbj': {
      'en': 'Link Status',
      'km': '',
      'zh_Hant': '',
    },
    'xeyh9l56': {
      'en': 'None',
      'km': '',
      'zh_Hant': '',
    },
    'dc13wa85': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'c9getu8x': {
      'en': 'Status',
      'km': '',
      'zh_Hant': '',
    },
    'mgcae3ci': {
      'en': 'None',
      'km': '',
      'zh_Hant': '',
    },
    'v7ma89rq': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cDeviceMaps
  {
    '1ax8ubeh': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'yswxyndw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cGeneralInfo
  {
    '84bovnfx': {
      'en': 'General Info',
      'km': '',
      'zh_Hant': '',
    },
    '7amcn8qn': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    'ziedugmb': {
      'en': ' *',
      'km': '',
      'zh_Hant': '',
    },
    'svkleauj': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'z4c5hg19': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'q5gz7398': {
      'en': 'Model',
      'km': '',
      'zh_Hant': '',
    },
    '7jddbxsu': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '2phrclxw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '0ydgrj9g': {
      'en': 'Manufacture',
      'km': '',
      'zh_Hant': '',
    },
    'u7mwvaxc': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'ypxkxo26': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'xupg4hj2': {
      'en': 'Location',
      'km': '',
      'zh_Hant': '',
    },
    'jf8ahoc5': {
      'en': 'Location2',
      'km': '',
      'zh_Hant': '',
    },
    '250c02hu': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    '1fc5fj2u': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'zir09zk9': {
      'en': 'Device Type',
      'km': '',
      'zh_Hant': '',
    },
    'zjg18kb4': {
      'en': 'None',
      'km': '',
      'zh_Hant': '',
    },
    '2pcpk7h3': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'jpezww47': {
      'en': 'Device Group',
      'km': '',
      'zh_Hant': '',
    },
    'x9u5z5k0': {
      'en': 'None',
      'km': '',
      'zh_Hant': '',
    },
    'yfuedqz7': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'pouiorbo': {
      'en': '0',
      'km': '',
      'zh_Hant': '',
    },
    'omhksurd': {
      'en': '5',
      'km': '',
      'zh_Hant': '',
    },
    'x050xnu0': {
      'en': '10',
      'km': '',
      'zh_Hant': '',
    },
    'co0j2y8h': {
      'en': '15',
      'km': '',
      'zh_Hant': '',
    },
    'odhl7can': {
      'en': '20',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cDeviceDetails
  {
    'mxo0iz90': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'gvpdw609': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '4l3564k5': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '5byxuclm': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '4cevt6xf': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'sg8a92f9': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '049ekast': {
      'en': 'currentPage is required',
      'km': '',
      'zh_Hant': '',
    },
    '6cp6on9s': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    '1dkgzw6p': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    'pyqzdeiz': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'vqammvpb': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '5po6s0mh': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'bywtdfhk': {
      'en': 'Field is required',
      'km': '',
      'zh_Hant': '',
    },
    '57bi7ogg': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
    'hi6vnf3y': {
      'en': 'currentPage is required',
      'km': '',
      'zh_Hant': '',
    },
    't087toxa': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
      'zh_Hant': '',
    },
  },
  // DeviceGroupAction
  {
    'qqlle0an': {
      'en': 'Update',
      'km': '',
      'zh_Hant': '',
    },
    'v039bcib': {
      'en': 'Delete',
      'km': '',
      'zh_Hant': '',
    },
    'o0ywyj5j': {
      'en': 'View',
      'km': '',
      'zh_Hant': '',
    },
  },
  // MainDeviceGroupDetialView
  {
    '64it1zfk': {
      'en': 'Device Group',
      'km': 'ថ្ងៃពិសេស',
      'zh_Hant': '特別的日子',
    },
    '6i2ltzu2': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
      'zh_Hant': '姓名',
    },
    'tyz5yfn4': {
      'en': ' *',
      'km': '*',
      'zh_Hant': '*',
    },
    '8rtcl27k': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'cqlbhizt': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'iq2ma51h': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '6ha8phvz': {
      'en': ' ',
      'km': '',
      'zh_Hant': '',
    },
    'bza81skw': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'oduwhgih': {
      'en': '',
      'km': '',
      'zh_Hant': '',
    },
    'hcr13xdv': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    '3619d39w': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'lat20sn1': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
      'zh_Hant': '欄位為必填項',
    },
    'suhwnhc6': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
      'zh_Hant': '請從下拉清單中選擇一個選項',
    },
    'byo7wvar': {
      'en': 'Devices',
      'km': '',
      'zh_Hant': '',
    },
    'mictl49j': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    'i0wrxd72': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    'an2szirn': {
      'en': 'Serial Number',
      'km': '',
      'zh_Hant': '',
    },
    'ftpaiqjv': {
      'en': 'DeviceType',
      'km': '',
      'zh_Hant': '',
    },
    '1qbk6wx2': {
      'en': 'Model',
      'km': '',
      'zh_Hant': '',
    },
    'newihz9b': {
      'en': 'Manufacturer',
      'km': '',
      'zh_Hant': '',
    },
    'jqsa3wlu': {
      'en': 'Status',
      'km': '',
      'zh_Hant': '',
    },
    'urk3p8qw': {
      'en': 'Link Status',
      'km': '',
      'zh_Hant': '',
    },
    'y4f03lqk': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'yzb5ui90': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'pb2r9d19': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    'tvklyada': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'khq1pp6c': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    '7zn12to7': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'lbuiytco': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    'jrcd3ane': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
    '0g9qsa2d': {
      'en': 'Schedules',
      'km': '',
      'zh_Hant': '',
    },
    'zt0u30ik': {
      'en': 'Search',
      'km': '',
      'zh_Hant': '',
    },
    '5evpn245': {
      'en': 'No',
      'km': 'ទេ',
      'zh_Hant': '不',
    },
    '7l0g9eu2': {
      'en': 'Start Date\t',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    'jbr34pka': {
      'en': 'End Date\t',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '9okxttrl': {
      'en': 'Schedule Type',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '1105cmem': {
      'en': 'Interval',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    'yczxygj3': {
      'en': 'Last Execute Time',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    '76jwexj1': {
      'en': 'Next Execute Time',
      'km': 'ជួរខែ',
      'zh_Hant': '月份範圍',
    },
    'xuqexdzb': {
      'en': 'Status',
      'km': 'ការពិពណ៌នា',
      'zh_Hant': '描述',
    },
    '677ezizc': {
      'en': 'Rows per page',
      'km': '',
      'zh_Hant': '',
    },
    'udkuuwe6': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'l8l993ev': {
      'en': 'Search...',
      'km': '',
      'zh_Hant': '',
    },
    '61jwt8fq': {
      'en': '25',
      'km': '',
      'zh_Hant': '',
    },
    'ncfsrw5i': {
      'en': '50',
      'km': '៥០',
      'zh_Hant': '50',
    },
    'acyvt5ef': {
      'en': '100',
      'km': '១០០',
      'zh_Hant': '100',
    },
    'doi8h1kx': {
      'en': '1',
      'km': '',
      'zh_Hant': '',
    },
    '8c5fm7v8': {
      'en': 'of',
      'km': '',
      'zh_Hant': '',
    },
  },
  // confirmInfo
  {
    'wbmlu8iw': {
      'en': 'Message',
      'km': '',
      'zh_Hant': '',
    },
    'w6o13l4e': {
      'en': 'Are you sure to ',
      'km': '',
      'zh_Hant': '',
    },
    'iuy5axm0': {
      'en': ' ?',
      'km': '',
      'zh_Hant': '',
    },
    'fp4lwxtb': {
      'en': 'Are you sure to Enable?',
      'km': '',
      'zh_Hant': '',
    },
    'dc1g4eon': {
      'en': 'No',
      'km': '',
      'zh_Hant': '',
    },
    '34x8mkko': {
      'en': 'Yes',
      'km': '',
      'zh_Hant': '',
    },
  },
  // cGoogleMapCopy
  {
    'ly82smtg': {
      'en': 'TextField',
      'km': '',
      'zh_Hant': '',
    },
    '1qa8fde9': {
      'en': 'Hello World',
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
    'xwqa51fz': {
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
