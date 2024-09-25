// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Profil`
  String get Profil {
    return Intl.message(
      'Profil',
      name: 'Profil',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get Dark_Mode {
    return Intl.message(
      'Dark Mode',
      name: 'Dark_Mode',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get Help {
    return Intl.message(
      'Help',
      name: 'Help',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get Current_Password {
    return Intl.message(
      'Current Password',
      name: 'Current_Password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password {
    return Intl.message(
      'New Password',
      name: 'New_Password',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message(
      'Loading...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `There are no items in your favorites'`
  String get tt {
    return Intl.message(
      'There are no items in your favorites\'',
      name: 'tt',
      desc: '',
      args: [],
    );
  }

  /// `Faq`
  String get Faq {
    return Intl.message(
      'Faq',
      name: 'Faq',
      desc: '',
      args: [],
    );
  }

  /// `How do I add items to cart`
  String get How_do_I_add_items_to_cart {
    return Intl.message(
      'How do I add items to cart',
      name: 'How_do_I_add_items_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Adding items to cart explanation`
  String get Adding_items_to_cart_explanation {
    return Intl.message(
      'Adding items to cart explanation',
      name: 'Adding_items_to_cart_explanation',
      desc: '',
      args: [],
    );
  }

  /// `How do I check out`
  String get How_do_I_check_out {
    return Intl.message(
      'How do I check out',
      name: 'How_do_I_check_out',
      desc: '',
      args: [],
    );
  }

  /// `Checkout process explanation`
  String get Checkout_process_explanation {
    return Intl.message(
      'Checkout process explanation',
      name: 'Checkout_process_explanation',
      desc: '',
      args: [],
    );
  }

  /// `What is the shipping and return policy`
  String get What_is_the_shipping_and_return_policy {
    return Intl.message(
      'What is the shipping and return policy',
      name: 'What_is_the_shipping_and_return_policy',
      desc: '',
      args: [],
    );
  }

  /// `Shipping and return policy explanation`
  String get Shipping_and_return_policy_explanation {
    return Intl.message(
      'Shipping and return policy explanation',
      name: 'Shipping_and_return_policy_explanation',
      desc: '',
      args: [],
    );
  }

  /// `How do I contact customer support`
  String get How_do_I_contact_customer_support {
    return Intl.message(
      'How do I contact customer support',
      name: 'How_do_I_contact_customer_support',
      desc: '',
      args: [],
    );
  }

  /// `Contacting customer support explanation`
  String get Contacting_customer_support_explanation {
    return Intl.message(
      'Contacting customer support explanation',
      name: 'Contacting_customer_support_explanation',
      desc: '',
      args: [],
    );
  }

  /// `User Manual`
  String get User_Manual {
    return Intl.message(
      'User Manual',
      name: 'User_Manual',
      desc: '',
      args: [],
    );
  }

  /// `Open User Manual`
  String get Open_User_Manual {
    return Intl.message(
      'Open User Manual',
      name: 'Open_User_Manual',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get Contact_Us {
    return Intl.message(
      'Contact Us',
      name: 'Contact_Us',
      desc: '',
      args: [],
    );
  }

  /// `Contact Customer Support`
  String get Contact_Customer_Support {
    return Intl.message(
      'Contact Customer Support',
      name: 'Contact_Customer_Support',
      desc: '',
      args: [],
    );
  }

  /// `Find the item you want to add`
  String get Find_the_item_you_want_to_add {
    return Intl.message(
      'Find the item you want to add',
      name: 'Find_the_item_you_want_to_add',
      desc: '',
      args: [],
    );
  }

  /// `Click the Add to Cart button`
  String get Click_the_Add_to_Cart_button {
    return Intl.message(
      'Click the Add to Cart button',
      name: 'Click_the_Add_to_Cart_button',
      desc: '',
      args: [],
    );
  }

  /// `(Optional) Select the quantity you want`
  String get Optional_Select_the_quantity_you_want {
    return Intl.message(
      '(Optional) Select the quantity you want',
      name: 'Optional_Select_the_quantity_you_want',
      desc: '',
      args: [],
    );
  }

  /// `The item will then appear in your shopping cart. You can review and edit your shopping cart at any time`
  String get Cc {
    return Intl.message(
      'The item will then appear in your shopping cart. You can review and edit your shopping cart at any time',
      name: 'Cc',
      desc: '',
      args: [],
    );
  }

  /// `### comments:`
  String get comments {
    return Intl.message(
      '### comments:',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `*Make sure you have an account to be able to add items to your cart.`
  String get a {
    return Intl.message(
      '*Make sure you have an account to be able to add items to your cart.',
      name: 'a',
      desc: '',
      args: [],
    );
  }

  /// `*Some items may not be available to add to cart.`
  String get b {
    return Intl.message(
      '*Some items may not be available to add to cart.',
      name: 'b',
      desc: '',
      args: [],
    );
  }

  /// `*Items will be removed from your shopping cart if you do not complete checkout within a specified time.`
  String get c {
    return Intl.message(
      '*Items will be removed from your shopping cart if you do not complete checkout within a specified time.',
      name: 'c',
      desc: '',
      args: [],
    );
  }

  /// `1. Go to your shopping cart.`
  String get z {
    return Intl.message(
      '1. Go to your shopping cart.',
      name: 'z',
      desc: '',
      args: [],
    );
  }

  /// `2. Make sure all the items you want are in the shopping cart.`
  String get x {
    return Intl.message(
      '2. Make sure all the items you want are in the shopping cart.',
      name: 'x',
      desc: '',
      args: [],
    );
  }

  /// `3. Click on the “Proceed to Payment” button.`
  String get v {
    return Intl.message(
      '3. Click on the “Proceed to Payment” button.',
      name: 'v',
      desc: '',
      args: [],
    );
  }

  /// `4. Select your shipping address and payment method.`
  String get B {
    return Intl.message(
      '4. Select your shipping address and payment method.',
      name: 'B',
      desc: '',
      args: [],
    );
  }

  /// `5. Enter your payment information.`
  String get n {
    return Intl.message(
      '5. Enter your payment information.',
      name: 'n',
      desc: '',
      args: [],
    );
  }

  /// `6. Click the “Confirm Payment” button.`
  String get m {
    return Intl.message(
      '6. Click the “Confirm Payment” button.',
      name: 'm',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a confirmation email when payment is completed. Your order will be shipped as soon as possible.`
  String get A {
    return Intl.message(
      'You will receive a confirmation email when payment is completed. Your order will be shipped as soon as possible.',
      name: 'A',
      desc: '',
      args: [],
    );
  }

  /// `*Make sure you have a valid shipping address and payment method.`
  String get s {
    return Intl.message(
      '*Make sure you have a valid shipping address and payment method.',
      name: 's',
      desc: '',
      args: [],
    );
  }

  /// `*Shipping charges and taxes may apply to your order.`
  String get d {
    return Intl.message(
      '*Shipping charges and taxes may apply to your order.',
      name: 'd',
      desc: '',
      args: [],
    );
  }

  /// `*You can track your order at any time through your account.`
  String get f {
    return Intl.message(
      '*You can track your order at any time through your account.',
      name: 'f',
      desc: '',
      args: [],
    );
  }

  /// `User photo`
  String get Image_user {
    return Intl.message(
      'User photo',
      name: 'Image_user',
      desc: '',
      args: [],
    );
  }

  /// `English/Arabic`
  String get English {
    return Intl.message(
      'English/Arabic',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get C {
    return Intl.message(
      'Create a new account',
      name: 'C',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in {
    return Intl.message(
      'Sign in',
      name: 'Sign_in',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Create Your\nAccount`
  String get cc {
    return Intl.message(
      'Create Your\nAccount',
      name: 'cc',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get ccc {
    return Intl.message(
      'Don\'t have account?',
      name: 'ccc',
      desc: '',
      args: [],
    );
  }

  /// `Hello\nSign in!`
  String get zzz {
    return Intl.message(
      'Hello\nSign in!',
      name: 'zzz',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get Welcome_Back {
    return Intl.message(
      'Welcome Back',
      name: 'Welcome_Back',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGN_UP {
    return Intl.message(
      'SIGN UP',
      name: 'SIGN_UP',
      desc: '',
      args: [],
    );
  }

  /// `Login with Social Media`
  String get xxx {
    return Intl.message(
      'Login with Social Media',
      name: 'xxx',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
