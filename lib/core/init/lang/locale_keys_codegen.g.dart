// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "welcome": "Welcome to My App",
  "onBoard": {
    "page1": {
      "title": "Scan the QR Code",
      "desc": "You can easy find this application and use it."
    },
    "page2": {
      "title": "Collect Points",
      "desc": "Use application save the world and collect the point"
    },
    "page3": {
      "title": "Save The Nature",
      "desc": "You are hero of the world please save the world. Let's fight together for our world!!"
    }
  },
  "login": {
    "tab1": "Login",
    "tab2": "Sign-Up",
    "orLoginWith": "Or Login With",
    "orSignUpWith": "Or Sign-Up With",
    "email": "Email",
    "password": "Password",
    "forgotText": "Forgot Password",
    "name": "Name and Surname"
  },
  "home": {
    "hello": "Hello!",
    "homedescription": "Let's Make\nMoney\nBy Recycling",
    "scancode": "Scan The QR Code",
    "profile": "Profile",
    "heroes": "Heroes",
    "settings": "Settings"
  },
  "settings": {
    "settings": "Settings",
    "account": "Account",
    "language": "Language",
    "notifications": "Notifications",
    "permissions": "Permissions",
    "theme": "Theme Mode",
    "about": "About",
    "logout": "Log out",
    "english": "English",
    "turkish": "Turkish",
    "light": "Light",
    "dark": "Dark",
    "pushnotification": "Push Notification",
    "emailnotification": "Email Notification",
    "camerapermissons": "Camera",
    "locationpermissons": "Location"
  },
  "errorDialog": {
    "error1": "QR Code couldn't be Read !!",
    "error1Description": "The QR Code could not be read. \n Please try again.",
    "eror2": "Could Not Add Point",
    "error2Description": "Your score could not be transferred due to an error in the service. Please try again.",
    "error3": "The QR Code not Same",
    "error3Description": "The name and garbage container QR Code is not equal !!"
  }
};
static const Map<String,dynamic> tr_TR = {
  "welcome": "Uygulamamıza hoşgeldiniz.",
  "onBoard": {
    "page1": {
      "title": "QR Code Taratın",
      "desc": "Kolayca kodu taratın ve işlemlerinizi halledin."
    },
    "page2": {
      "title": "Puanları Toplayın",
      "desc": "Puan toplayın"
    },
    "page3": {
      "title": "Doğayı birlikte koruyalım",
      "desc": "Dünyanın kahramanları biziz. Hadi birlikte savaşalım."
    }
  },
  "login": {
    "tab1": "Giriş",
    "tab2": "Kayıt-Ol",
    "orLoginWith": "Giriş yapın",
    "orSignUpWith": "Kayıt Olun",
    "email": "Email",
    "password": "Şifre",
    "forgotText": "Şifreyi Unuttum",
    "name": "Adınız ve Soyadınız"
  },
  "home": {
    "hello": "Merhaba!",
    "homedescription": "Birlikte Doğayı\nKoruyalım\nVe Para Kazanalım",
    "scancode": "QR Code Okutucu",
    "profile": "Profil",
    "heroes": "Kahramanlar",
    "settings": "Ayarlar"
  },
  "settings": {
    "settings": "Ayarlar",
    "account": "Hesap",
    "language": "Dil Seçeneği",
    "notifications": "Bildirim ayarı",
    "permissions": "İzinler",
    "theme": "Tema Modu",
    "about": "Hakkımızda",
    "logout": "Çıkış Yap",
    "english": "İngilizce",
    "turkish": "Türkçe",
    "light": "Açık Tema",
    "dark": "Koyu Tema",
    "pushnotification": "Bildirim Gönderme İzni",
    "emailnotification": "Email Gönderme İzni",
    "camerapermissons": "Kamera İzni",
    "locationpermissons": "Konum İzni"
  },
  "errorDialog": {
    "error1": "QR Code Okunamadı !!",
    "error1Description": "Qr Code okunamadı. \n Lütfen Tekrar Deneyin.",
    "eror2": "Puan Eklenemedi",
    "error2Description": "Serviste oluşan bir hata dolayısıyla puanınız eklenemedi.\n Lütfen Tekrar deneyiniz.",
    "error3": "QR Kodlar Aynı Değil !!",
    "error3Description": "Çöp kutusu ile atığın QR kodları aynı değil !!"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "tr_TR": tr_TR};
}
