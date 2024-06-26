import 'package:lingui_mobile/models/discussion.dart';

const Map<String, String> languageToFlagCode = {
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
};

String getFlagAsset(String language) {
  String? flagCode = languageToFlagCode[language];
  if (flagCode != null) {
    return 'icons/flags/svg/$flagCode.svg';
  }
  return 'icons/flags/svg/us.svg';
}