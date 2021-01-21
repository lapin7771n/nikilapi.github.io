import 'dart:js' as js;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nikilapi_web/sections/working_experience.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8,
            vertical: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Wrap(
                  runSpacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    buildHeader(context),
                    Wrap(
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
                        SizedBox(width: 20),
                        HoverButton(
                          title: 'Open CV in PDF',
                          link:
                              'https://drive.google.com/file/d/1b0NUQZZzA8zsfPgbO5ulGqSB6BSf5c3e/view?usp=sharing',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 250),
              SelectableText(
                'Nikita Lapin',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 10,
              ),
              SelectableText(
                'Hello! I\'m mobile apps developer from Kharkiv, Ukraine 🇺🇦\n'
                'I\'ve been developing software 👨‍💻 for ${_getExperience()} years\n'
                'Could I help you to implement your idea? 😎\n',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 30),
              buildWorkingExperience(context),
              SizedBox(height: 300),
              Center(
                child: Column(
                  children: [
                    SelectableText(
                      'Projects'.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 16,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 22),
                    SelectableText(
                      'Review all my done works',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 42,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    SelectableText(
                      'Here are my projects for all these years. Some of them were my pet-projects.\n'
                      'Some are for commercial usage.',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              WorkingExperienceSection(),
              SizedBox(height: 250),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildWorkingExperience(BuildContext context) {
    var baseTextStyle = Theme.of(context).textTheme.headline3.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        );
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '[2019 - 2021]',
            style: baseTextStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: ' Java and Android developer at '),
          TextSpan(
            text: 'Qualium Systems Ltd.',
            style: baseTextStyle.copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => js.context
                  .callMethod('open', ['https://www.qualium-systems.com/']),
          ),
          TextSpan(text: '\n'),
          TextSpan(
            text: '[2021 - present]',
            style: baseTextStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: ' Android Engineer at '),
          TextSpan(
            text: 'N-ix',
            style: baseTextStyle.copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  js.context.callMethod('open', ['https://www.n-ix.com/']),
          ),
        ],
        style: baseTextStyle,
      ),
    );
  }

  /// Calculates experience with step of 0.5 (ex. 2.3 years -> 2.5 is output)
  String _getExperience() {
    final originExperience =
        ((DateTime.now().difference(DateTime(2018, 9, 1)).inDays / 365 * 2)
                    .roundToDouble() /
                2)
            .toStringAsFixed(1);

    if (originExperience.endsWith('0')) {
      return originExperience.split('\.').first;
    }

    return originExperience;
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
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        js.context.callMethod(
          'open',
          [widget.link],
        );
      },
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: Column(
        children: [
          Text(widget.title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    decoration: _isHover
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  )),
        ],
      ),
    );
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }
}
