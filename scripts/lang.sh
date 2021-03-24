/**
 * @author [Fatih Kurçenli]
 * @create date 2021-03-24 14:53:46
 * @modify date 2021-03-24 14:53:46
 * @desc [Easy Loacalization command terminal]
 */

code gen generate
//first terminal command
flutter pub run easy_localization:generate  -O lib/core/init/lang -o locale_keys_codegen.g.dart --source-dir asset/lang


//second terminal command
flutter pub run easy_localization:generate  -O lib/core/init/lang -f keys -o locale_keys.g.dart --source-dir asset/lang

