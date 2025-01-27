import 'package:stroll_task/imports/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MyApp(),
  );
}

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stroll Task #1',
      theme: ThemeData(
        fontFamily: Fonts.proximaNova,
        colorScheme: ColorScheme.fromSeed(seedColor: kAppPurpleMain),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
