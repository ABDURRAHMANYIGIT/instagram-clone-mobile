import '../../translations.dart';
part 'keys.dart';

class AppSentences {
  String get exampleSentence => allTranslations.text(_Keys.exampleSentence)!;
  String get support => allTranslations.text(_Keys.support)!;
  String get supportFeedback => allTranslations.text(_Keys.supportFeedback)!;
  String get supportContent => allTranslations.text(_Keys.supportContent)!;
  String get supportFeedbackContent =>
      allTranslations.text(_Keys.supportFeedbackContent)!;
  String get deviceInfo => allTranslations.text(_Keys.deviceInfo)!;
  String get thanksForContactingUs =>
      allTranslations.text(_Keys.thanksForContactingUs)!;
  String get contactUsFeedback =>
      allTranslations.text(_Keys.contactUsFeedback)!;
  String get email => allTranslations.text(_Keys.email)!;
  String get password => allTranslations.text(_Keys.password)!;
  String get login => allTranslations.text(_Keys.login)!;
  String get alreadyHaveAccount =>
      allTranslations.text(_Keys.alreadyHaveAccount)!;
  String get register => allTranslations.text(_Keys.register)!;
  String get dontHaveAccount => allTranslations.text(_Keys.dontHaveAccount)!;
}
