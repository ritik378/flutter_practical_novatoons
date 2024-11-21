import 'package:get/get.dart';
import 'package:nova_demo/common/language/language_string.dart';

class TranslationServices extends Translations {
  @override
  Map<String, Map<String, String>> get keys => translations;

  final Map<String, Map<String, String>> translations = {
    // English translations
    'en_US': {
      LanguageString.signIn: 'Sign In',
      LanguageString.welcome:
          'Please login with one of the options to continue using our app.',
      LanguageString.email: 'Email',
      LanguageString.password: 'Password',
      LanguageString.enterEmail: 'Enter your email',
      LanguageString.enterPassword: 'Enter your password',
      LanguageString.login: 'Log In',
      LanguageString.dontHaveAccount: 'Don’t have an account? ',
      LanguageString.signUp: 'Sign up',
      LanguageString.signUpPrompt:
          'Signup with one of the following options to get started.',
      LanguageString.firstName: 'First Name',
      LanguageString.enterFirstName: 'Enter your name',
      LanguageString.lastName: 'Last Name',
      LanguageString.enterLastName: 'Enter your last name',
      LanguageString.dob: 'Date of birth',
      LanguageString.gender: 'Gender',
      LanguageString.selectDate: 'Select Date',
      LanguageString.selectGender: 'Select Gender',
      LanguageString.male: 'Male',
      LanguageString.female: 'Female',
      LanguageString.other: 'Other',
      LanguageString.creatorCheck:
          'If you are a creator, please check the option if it applies to you. ',
      LanguageString.isCreatorOfColor:
          'I am a Creator that is Black, African or a person of Color',
      LanguageString.next: 'Next',
      LanguageString.alreadyHaveAccount: 'Already have an account? ',
      LanguageString.home: 'Home',
      LanguageString.favorite: 'Favorite',
      LanguageString.download: 'Download',
      LanguageString.settings: 'Settings',
      LanguageString.comicBook: 'Comic Books',
      LanguageString.art: 'Art',
      LanguageString.eBook: 'E-Book',
      LanguageString.nft: 'Nft',
      LanguageString.youMayLike: 'You may like',
      LanguageString.captainMarvel: 'Captain Marvel',
      LanguageString.rating: '4.5',
      LanguageString.popular: 'Popular',
      LanguageString.myLibrary: 'My Library',
      LanguageString.thinkFrom: 'The Think From Another World',
      LanguageString.hiJoy: 'Hi,Joy',
      LanguageString.profile: 'Profile',
      LanguageString.profileName: 'David Willom',
      LanguageString.signOut: 'Sign Out',
      LanguageString.transactionsAmt: '54 cr',
      LanguageString.name: 'Name',
      LanguageString.enterName: 'Enter your name',
      LanguageString.changePassword: 'Change Password',
      LanguageString.bio: 'Bio',
      LanguageString.enterBio: 'Enter your bio',
      LanguageString.myInfo: 'My Info',
      LanguageString.done: 'Done',
      LanguageString.transactions: 'Transactions',
      LanguageString.received: 'Received',
      LanguageString.crAndUSDValue: '100cr / 100usd',
      LanguageString.monthYear: 'For the month: Jan 2022',
      LanguageString.paymentDate: 'Date: 17-3-2022',
      LanguageString.paymentPaid: 'Payment Paid',
      LanguageString.notificationSettings: 'Notification Settings',
      LanguageString.commentReceived: 'Comment Received Notification',
      LanguageString.notifications: 'Notifications',
      LanguageString.newText: 'New',
      LanguageString.thisWeek: 'This Week',
      LanguageString.thisMonth: 'This Month',
      LanguageString.chrisEvans: 'Chris Evans',
      LanguageString.twoMinAgo: '2 min ago',
      LanguageString.politicalRift: 'Political involvement in the\n'
          'Avengers affairs causes a rift between',
      LanguageString.contactSupport: 'Contact Us',
      LanguageString.subject: 'Subject',
      LanguageString.message: 'Message',
      LanguageString.dropMessage: 'Drop Up A Message',
      LanguageString.avengersRift:
          'Political involvement in the Avengers affairs\ncauses a rift between Captain America and Iron\nMan. With many people fearing the.',
      LanguageString.generalEnquiry: 'General Enquiry',
      LanguageString.systemDowntime: 'System Downtime',
      LanguageString.featureRequest: 'Feature Request',
      LanguageString.enterMessage: 'Enter Message',
      LanguageString.sendMessage: 'Send Message',
      LanguageString.mySupportMessages: 'My Support Messages',
    },
  };
}
