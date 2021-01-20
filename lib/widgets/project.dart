import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String imageUri;
  final String link;
  final Color backgroundColor;

  ProjectCard({
    @required this.title,
    @required this.imageUri,
    @required this.link,
    @required this.backgroundColor,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.backgroundColor,
      ),
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: widget.link == null
            ? null
            : () {
                js.context.callMethod('open', [widget.link]);
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Image.asset(
                widget.imageUri,
                height: 150,
                width: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelectableText(
                  widget.title,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
