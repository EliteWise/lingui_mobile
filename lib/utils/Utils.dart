import 'package:intl/intl.dart';

class LanguageList {

  static String getCurrentLanguageCode() {
    return Intl.getCurrentLocale();
  }

  static const Map<String, String> languageToFlagCode = {
    'English': 'us',
    'Spanish': 'es',
    'German': 'de',
    'Chinese': 'cn',
    'Japanese': 'jp',
    'French': 'fr',
    'Italian': 'it',
    'Portuguese': 'pt',
    'Russian': 'ru',
    'Korean': 'kr',
    'Hindi': 'in',
    'Arabic': 'sa',
    'Dutch': 'nl',
    'Swedish': 'se',
    'Norwegian': 'no',
    'Danish': 'dk',
    'Finnish': 'fi',
    'Greek': 'gr',
    'Turkish': 'tr',
    'Polish': 'pl',
    'Czech': 'cz',
    'Hungarian': 'hu',
    'Romanian': 'ro',
    'Hebrew': 'il',
    'Thai': 'th',
    'Vietnamese': 'vn',
    'Indonesian': 'id',
    'Malay': 'my',
    'Filipino': 'ph',
    'USA': 'us',
    'Canada': 'ca',
    'Germany': 'de',
    'Japan': 'jp',
    'Australia': 'au',
    'Brazil': 'br',
    'India': 'in',
    'China': 'cn',
    'Mexico': 'mx',
    'Russia': 'ru',
    'Italy': 'it',
    'Spain': 'es',
    'United Kingdom': 'gb',
    'South Korea': 'kr',
    'South Africa': 'za',
    'Argentina': 'ar',
    'Netherlands': 'nl',
    'Sweden': 'se',
    'New Zealand': 'nz'
  };

  static List<String> languages = [
    'English', 'Spanish', 'German', 'Chinese', 'Japanese', 'French',
    'Italian', 'Portuguese', 'Russian', 'Korean', 'Hindi', 'Arabic',
    'Dutch', 'Swedish', 'Norwegian', 'Danish', 'Finnish', 'Greek',
    'Turkish', 'Polish', 'Czech', 'Hungarian', 'Romanian', 'Hebrew',
    'Thai', 'Vietnamese', 'Indonesian', 'Malay', 'Filipino'
  ];

  static List<String> countries = ['Canada', 'Germany', 'Japan', 'Australia', 'Brazil'];

  static String getFlagAsset(String language) {
    String? flagCode = languageToFlagCode[language];
    if (flagCode != null) {
      return 'icons/flags/svg/$flagCode.svg';
    }
    return 'icons/flags/svg/us.svg';
  }
}