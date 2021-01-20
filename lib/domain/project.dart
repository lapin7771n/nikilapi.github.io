import 'package:flutter/cupertino.dart';

class Project {
  final String title;
  final String imageUri;
  final String description;
  final String link;
  final Color backgroundColor;

  const Project({
    this.title,
    this.imageUri,
    this.description,
    this.link,
    this.backgroundColor,
  });
}
