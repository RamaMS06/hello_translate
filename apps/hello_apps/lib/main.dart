import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hello_apps/extension.dart';
import 'package:translation_design/translation_design.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('id'),
    ],
    path: 'unused',
    assetLoader: const MultiAssetLoader([
      JsonCustomAssetLoader(
        directory: 'assets/translations',
      ),
      JsonCustomAssetLoader(
        directory: 'assets/translations',
        package: 'translation_design',
      ),
    ]),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isIndonesia = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('flag').tr(),
        onPressed: () {
          setState(() {
            isIndonesia = !isIndonesia;
            if (isIndonesia) {
              context.setLocale(const Locale(
                'id',
              ));
            } else {
              context.setLocale(const Locale(
                'en',
              ));
            }
          });
        },
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UILabel('welcome'),
            SizedBox(
              height: 24,
            ),
            UIButton(),
          ],
        ),
      ),
    );
  }
}
