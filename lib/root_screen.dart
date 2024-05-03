import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/route/app_route.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      // theme: AppTheme.base(Get.theme).appTheme,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteName.student,
      //initialBinding: AppBinding(),
      enableLog: true,
      // localizationsDelegates: [
      //   L.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: L.delegate.supportedLocales,
    );
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addObserver(AppLifecycleObserver());
    // print('start app lifecycle observer');
    //
    // AppLifecycleObserver().status.listen((AppLifecycleState state) {
    //   print(Get.currentRoute);
    // });
  }

  @override
  void dispose() {
    // WidgetsBinding.instance?.removeObserver(AppLifecycleObserver());
    // print('finish app lifecycle observer');
    // super.dispose();
  }
}
