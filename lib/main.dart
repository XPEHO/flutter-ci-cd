import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color _xpehoGreen = Color(0xffa0ce4e);
Color _xpehoGrey = Color(0xfff6f6f6);
Color _xpehoTextColor = Color(0xff333333);
String _articleUrl =
    'https://medium.com/@xpeho.mobile/ci-cd-flutter-avec-github-actions-16aadab8d32d';
String _sourcesUrl = 'https://github.com/XPEHO/flutter-ci-cd';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI / CD',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'PT Sans',
          textTheme: TextTheme(
            headline1: TextStyle(color: _xpehoTextColor, fontSize: 32),
            headline2: TextStyle(color: _xpehoGreen, fontSize: 24),
            bodyText1: TextStyle(color: _xpehoTextColor, fontSize: 20),
            bodyText2: TextStyle(color: _xpehoTextColor, fontSize: 14),
          )),
      home: FlutterCiCdApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlutterCiCdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;
        if (width > height) {
          return LandscapeLayout();
        } else {
          return PortraitLayout();
        }
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  final String _text;
  final String _url;

  MenuItem(this._text, this._url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _xpehoGrey,
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: TextButton(
        onPressed: () {
          launch(_url);
        },
        child: Text(
          _text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final bool _colapse;

  Menu(this._colapse);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Image.asset(
            'assets/images/XPEHO_logo.png',
            height: 36.0,
          ),
        ),
        _colapse
            ? Container()
            : MenuItem('Accueil', 'https://flutter-ci-cd-e37ce.web.app/#/'),
        _colapse
            ? Container()
            : MenuItem('Site officiel', 'https://www.xpeho.fr/'),
        _colapse
            ? Container()
            : MenuItem(
                'Voir les sources',
                _sourcesUrl,
              ),
        _colapse ? Container() : MenuItem('Lire l' 'article', _articleUrl),
      ],
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _logoHeight = MediaQuery.of(context).size.height * 0.05;
    return Column(
      children: [
        Image.asset(
          'assets/images/xpehobkg.png',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              text: 'Flutter ',
              style: Theme.of(context).textTheme.headline1,
              children: [
                TextSpan(
                    text: 'CI', style: Theme.of(context).textTheme.headline2),
                TextSpan(
                    text: ' / ', style: Theme.of(context).textTheme.headline1),
                TextSpan(
                    text: 'CD', style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Cette application Flutter a été construite, testée et déployée à l\'aide de Github actions et Firebase.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Tout est expliqué dans notre article sur Medium.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextButton(
            onPressed: () => launch(_articleUrl),
            child: Text(
              _articleUrl,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'N\'hésitez pas à consulter les sources sur Github',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextButton(
            onPressed: () => launch(_sourcesUrl),
            child: Text(
              _sourcesUrl,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Liens',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        TextButton(
          onPressed: () => launch('https://www.flutter.dev/'),
          child: Text('www.flutter.dev'),
        ),
        TextButton(
          onPressed: () => launch('https://github.com/'),
          child: Text('www.github.com'),
        ),
        TextButton(
          onPressed: () => launch('https://www.firebase.com/'),
          child: Text('www.firebase.com'),
        ),
        TextButton(
          onPressed: () => launch('https://www.medium.com/'),
          child: Text('www.medium.com'),
        ),
        SizedBox(
          height: 48.0,
        ),
        SizedBox(
          height: _logoHeight,
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () => launch(
                    'https://flutter.dev/brand#:~:text=The%20%E2%80%9CFlutter%E2%80%9D%20name%20and%20logo,the%20Flutter%20Terms%20of%20Service.'),
                child: Image.asset(
                  'assets/images/logo_flutter_1080px_clr.png',
                  height: _logoHeight,
                ),
              ),
              TextButton(
                onPressed: () => launch('https://github.com/logos'),
                child: Image.asset(
                  'assets/images/Octocat.png',
                  height: _logoHeight,
                ),
              ),
              TextButton(
                onPressed: () =>
                    launch('https://firebase.google.com/brand-guidelines'),
                child: Image.asset(
                  'assets/images/Built_with_Firebase_Logo_Light.png',
                  height: _logoHeight,
                ),
              ),
              TextButton(
                onPressed: () => launch(
                    'https://medium.design/logos-and-brand-guidelines-f1a01a733592'),
                child: Image.asset(
                  'assets/images/medium.png',
                  height: _logoHeight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48.0,
        ),
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Menu(false),
          ),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Content(),
            ),
          ),
        ],
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Menu(false),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                color: _xpehoTextColor,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Menu(true),
          Content(),
        ],
      ),
    );
  }
}
