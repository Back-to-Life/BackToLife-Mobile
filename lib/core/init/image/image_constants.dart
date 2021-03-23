class ImageConstants {
  static ImageConstants _instance;

  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  //String get logo => toPNG("fatih");

  String toPNG(String name) => "asset/image/$name";
}
