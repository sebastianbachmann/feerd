import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:feerd/dashboard_page/dashboard_page_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'playgrounds_page/playgrounds_page_widget.dart';
import 'clubs_page/clubs_page_widget.dart';
import 'kindergartens_page/kindergartens_page_widget.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feerd',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('de', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/wappen-fuerth.svg',
                  fit: BoxFit.fill,
                ),
              ),
            )
          : NavBarPage(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'PlaygroundsPage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'PlaygroundsPage': PlaygroundsPageWidget(),
      'ClubsPage': ClubsPageWidget(),
      'KindergartensPage': KindergartensPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.hippo,
              size: 24,
            ),
            label: 'Spielplätze',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.child_care,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
