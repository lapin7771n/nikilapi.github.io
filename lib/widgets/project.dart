import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nikilapi_web/domain/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  ProjectCard({
    @required this.project,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (p) => setState(() => _isHover = true),
      onExit: (p) => setState(() => _isHover = false),
      child: InkWell(
        onTap: widget.project.link == null
            ? null
            : () {
                js.context.callMethod('open', [widget.project.link]);
              },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Color(0xFFfff2e6),
              border: Border(
                top: BorderSide(
                  color: widget.project.backgroundColor,
                  width: 4,
                ),
              ),
              boxShadow: [
                if (_isHover)
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 2,
                    color: widget.project.backgroundColor,
                  )
              ]),
          width: 400,
          height: 450,
          child: Column(
            children: [
              SizedBox(height: 45),
              buildImage(),
              SizedBox(height: 45),
              Text(
                widget.project.title,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                widget.project.description ?? "",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              if (widget.project.stack != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Stack: ${widget.project.stack}",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.asset(
      widget.project.imageUri,
      height: 50,
      width: 50,
      fit: BoxFit.fitWidth,
    );
  }
}
