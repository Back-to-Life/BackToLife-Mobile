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
    "passwordA": "Password Again",
    "forgotText": "Forgot Password",
    "name": "Name and Surname"
  },
  "home": {
    "hello": "Hello!",
    "homedescription": "Let's Make\nMoney\nBy Recycling",
    "scancode": "Scan The QR Code",
    "profile": "Profile",
    "heroes": "Heroes",
    "settings": "Settings",
    "animationText1": "We are building together",
    "animationText2": "We are the best",
    "animationText3": "Back TO LIFE",
    "tutorial": {
      "profilePictureTitle": "Profile Picture",
      "profilePictureDescription": "You can see your profile photo here and change it by going to the profile page.",
      "barcodeTitle": "QR Code Scanning",
      "barcodeDescription": "Scan the QR code and earn your points after passing the control stage.",
      "prfofilePageTitle": "Profile Page",
      "profilePageDescription": "You can see the points you have earned on the profile page.",
      "heroesPageTitle": "Heroes Page",
      "heroesPageDescription": "View the top list organized each week.",
      "settingsTitle": "Settings Page",
      "settingsDescription": "You can manage app settings and account settings from the settings page.",
      "themeTitle": "Light and Dark Theme Mode",
      "themeDescription": "You can set the theme mode with a single button without going to the settings section of the light and dark mode.",
      "skip": "SKIP"
    }
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
    "locationpermissons": "Location",
    "accountSettings": {
      "title1": "Enter the information",
      "title2": "You want to change",
      "userName": "UserName",
      "email": "Email",
      "submit": "Submit"
    }
  },
  "errorDialog": {
    "error1": "QR Code couldn't be Read !!",
    "error1Description": "The QR Code could not be read. \n Please try again.",
    "eror2": "Could Not Add Point",
    "error2Description": "Your score could not be transferred due to an error in the service. Please try again.",
    "error3": "The QR Code not Same",
    "error3Description": "The name and garbage container QR Code is not equal !!"
  },
  "scanBarcodeView": {
    "mainName": "Let's recycle in \n a few steps.",
    "step1": "Step 1",
    "step1Title": "Scan recycling waste",
    "step1Description": "Scan the QR code of the recycling waste",
    "step1Button": "SCAN",
    "step2": "Step 2",
    "step2Title": "Scan recycling bin",
    "step2Description": "Now scan the QR Code of the recycling bin that matches",
    "step2Button": "SCAN",
    "step3": "Step 3",
    "step3Title": "Throw in recycle bin",
    "step3Description": "Now you can put your recycling waste in the box and your points will be loaded on your card",
    "step3Button": "COMPLETE"
  },
  "profileView": {
    "sconboard": "Scoreboard",
    "score": "Your Recycling Score",
    "description": "To find out the equivalent of your score,\n please visit our website"
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
    "passwordA": "Şifre Tekrarı",
    "forgotText": "Şifreyi Unuttum",
    "name": "Adınız ve Soyadınız"
  },
  "home": {
    "hello": "Merhaba!",
    "homedescription": "Birlikte Doğayı\nKoruyalım\nVe Para Kazanalım",
    "scancode": "QR Code Okutucu",
    "profile": "Profil",
    "heroes": "Kahramanlar",
    "settings": "Ayarlar",
    "animationText1": "Beraber İnşa Ediyoruz",
    "animationText2": "Çünkü Biz En iyisiyiz",
    "animationText3": "Back TO LIFE",
    "tutorial": {
      "profilePictureTitle": "Profil Fotoğrafınız",
      "profilePictureDescription": "Profil fotoğrafınızı buradan görebilir ve profil sayfasına giderek değiştirebilirsiniz.",
      "barcodeTitle": "QR Kodu Taratma",
      "barcodeDescription": "QR code okutun ve kontrol aşamasından geçtikten sonra puanınıza kazanın.",
      "prfofilePageTitle": "Profil Sayfasınız",
      "profilePageDescription": "Profil sayfasını kazandığınız puanları görebilirsiniz.",
      "heroesPageTitle": "Kahramanlar Sayfası",
      "heroesPageDescription": "Her hafta düzenlenen top listesini görüntüleyin.",
      "settingsTitle": "Ayarlar Sayfası",
      "settingsDescription": "Ayarlar sayfasından uygulama ayarlarını ve hesap ayarlarınızı yönetebilirsiniz.",
      "themeTitle": "Açık ve Koyu Tema Modu",
      "themeDescription": "Açık ve koyu modunu ayarlar kısmına gitmeden tek bir buton ile tema modunu ayarlayabilirsiniz.",
      "skip": "GEÇ"
    }
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
    "locationpermissons": "Konum İzni",
    "accountSettings": {
      "title1": "Değiştirmek istediğiniz",
      "title2": "Bilgilerinizi Girin",
      "userName": "Adınız Soyadınız",
      "email": "Email",
      "submit": "Gönder"
    }
  },
  "errorDialog": {
    "error1": "QR Code Okunamadı !!",
    "error1Description": "Qr Code okunamadı. \n Lütfen Tekrar Deneyin.",
    "eror2": "Puan Eklenemedi",
    "error2Description": "Serviste oluşan bir hata dolayısıyla puanınız eklenemedi.\n Lütfen Tekrar deneyiniz.",
    "error3": "QR Kodlar Aynı Değil !!",
    "error3Description": "Çöp kutusu ile atığın QR kodları aynı değil !!"
  },
  "scanBarcodeView": {
    "mainName": "Hadi ! Birkaç adımla geri dönüşümü sağlayalım.",
    "step1": "Adım 1",
    "step1Title": "Çöpü Taratın",
    "step1Description": "Çöp kutusu üzerindeki QR kodu taratın",
    "step1Button": "TARAT",
    "step2": "Adım 2",
    "step2Title": "Çöp Kutusundaki QR kodu",
    "step2Description": "Çöp kutusu üzerindeki QR kodu taratın",
    "step2Button": "TARAT",
    "step3": "Adım 3",
    "step3Title": "Çöp kutusuna atın ve Bekleyin",
    "step3Description": "Çöp kutusuna atın ve birkaç saniye bekleyin, sonrasında tamamla diyerek puanı kazanın.",
    "step3Button": "TAMAMLA"
  },
  "profileView": {
    "sconboard": "Puan Tablosu",
    "score": "Geri Dönüşüm Puanınız",
    "description": "Puanınızın karşılığını öğrenmek için \n lütfen web sitemizi ziyaret edin"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "tr_TR": tr_TR};
}
