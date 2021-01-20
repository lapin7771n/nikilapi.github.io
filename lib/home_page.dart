import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHeader(context),
                Container(
                  child: Row(
                    children: [
                      HoverButton(
                        title: 'LinkedIn',
                        link:
                            'https://www.linkedin.com/in/nikita-lapin-b7a98615a/',
                      ),
                      SizedBox(width: 20),
                      HoverButton(
                        title: 'Twitter',
                        link: 'https://twitter.com/nik_lapin_',
                      ),
                      SizedBox(width: 20),
                      HoverButton(
                        title: 'Instagram',
                        link: 'https://www.instagram.com/nikilapi/',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 200),
            Text(
              'Nikita Lapin',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hello! I\'m mobile apps developer from Kharkiv, Ukraine 🇺🇦\n'
              'I develop software 👨‍💻 for about 2.5 years\n'
              'Could I help you to implement your idea? 😎',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  MouseRegion buildHeader(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: Text(
          '👋 Mobile apps development',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String title;
  final String link;

  const HoverButton({
    Key key,
    @required this.title,
    @required this.link,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        js.context.callMethod(
          'open',
          [widget.link],
        );
      },
      child: MouseRegion(
        child: Column(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    decoration: _isHover
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
            ),
          ],
        ),
        onEnter: (event) => setState(() {
          _isHover = true;
        }),
        onExit: (event) => setState(() {
          _isHover = false;
        }),
      ),
    );
  }
}
