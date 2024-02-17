// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';

// import '../translations.dart';
// import 'domain/router/route.dart';
// import 'main_methods.dart';
import 'main_methods.dart';
import 'resources/config/app_info.dart';
import 'resources/styles/app_theme.dart';
import 'resources/styles/colors.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   log('Message data: ${message.data}');

//   log('Handling a background message: ${message.messageId}');
// }

void main() async {
  await MainMethods().runInitialMethods();

  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone 13 Mini
      // TODO(ALL): UPDATE DESIGN SIZE
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? widget) => GetMaterialApp(
        //initialBinding: AuthBinding(),
        title: AppInfo.appName,
        theme: ThemeDataHelper().themeData,
        themeMode: ThemeMode.light,
        unknownRoute: AppRouter.notFound,
        getPages: AppRouter.pages,
        navigatorKey: Get.key,
        initialRoute: AppRouter.designRoute,
        // supportedLocales: allTranslations.supportedLocales(),
        color: AppColors.primary,
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en'),
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(seconds: 1),
        // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        builder: (BuildContext context, Widget? widget) {
          //add this line
          ScreenUtil.init(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
