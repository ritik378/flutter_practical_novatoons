import 'package:get/get.dart';
import 'package:nova_demo/common/language/language_string.dart';

class TranslationServices extends Translations {
  @override
  Map<String, Map<String, String>> get keys => translations;

  final Map<String, Map<String, String>> translations = {
    // English translations
    'en_US': {
      LanguageString.signIn: 'Sign In',
      LanguageString.welcome: 'Please login with one of the options to continue using our app.',
      LanguageString.email: 'Email',
      LanguageString.password: 'Password',
      LanguageString.enterEmail: 'Enter your email',
      LanguageString.enterPassword: 'Enter your password',
      LanguageString.login: 'Log In',
      LanguageString.dontHaveAccount: 'Don’t have an account? ',
      LanguageString.signUp: 'Sign up',
      LanguageString.signUpPrompt: 'Signup with one of the following options to get started.',
      LanguageString.firstName: 'First Name',
      LanguageString.enterFirstName: 'Enter your name',
      LanguageString.lastName: 'Last Name',
      LanguageString.enterLastName: 'Enter your last name',
      LanguageString.dob: 'Date of birth',
      LanguageString.gender:'Gender',
      LanguageString.selectDate:'Select Date',
      LanguageString.selectGender:'Select Gender',
      LanguageString.male :'Male',
      LanguageString.female:'Female',
      LanguageString.other:'Other',
      LanguageString.creatorCheck:'If you are a creator, please check the option if it applies to you. ',
      LanguageString.isCreatorOfColor:'I am a Creator that is Black, African or a person of Color',
      LanguageString.next:'Next',
      LanguageString.alreadyHaveAccount:'Already have an account? '
    },
    // Hindi translations
    'hi_IN': {
      LanguageString.signIn: 'साइन इन करें', // Sign In in Hindi
      LanguageString.welcome: 'कृपया हमारे ऐप का उपयोग जारी रखने के लिए विकल्पों में से एक से लॉगिन करें।', // Welcome message in Hindi
      LanguageString.email: 'ईमेल', // Email in Hindi
      LanguageString.enterEmail: 'अपना ईमेल दर्ज करें', // Enter your email in Hindi
      LanguageString.enterPassword: 'अपना पासवर्ड दर्ज करें', // Enter your password in Hindi
      LanguageString.login: 'लॉग इन करें', // Log In in Hindi
      LanguageString.dontHaveAccount: 'क्या आपके पास खाता नहीं है?', // Don't have an account? in Hindi
      LanguageString.signUp: 'साइन अप करें', // Sign up in Hindi
    },
  };
}
