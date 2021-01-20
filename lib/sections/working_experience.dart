import 'package:flutter/widgets.dart';
import 'package:nikilapi_web/domain/project.dart';
import 'package:nikilapi_web/widgets/project.dart';

class WorkingExperienceSection extends StatelessWidget {
  static const List<Project> projects = [
    Project(
      title: "Worship Songs",
      imageUri: "images/worship_songs.png",
      description: "All the worship songs are in your hand",
      link: "https://play.google.com/store/apps/details?id=com.worshipsongs",
      backgroundColor: Color(0x66027DF9),
    ),
    Project(
      title: 'Wedbox',
      imageUri: 'images/wedbox.webp',
      link: 'https://play.google.com/store/apps/details?id=com.capty.wedbox',
      backgroundColor: Color(0x66FFB398),
    ),
    Project(
      title: 'ARSport',
      imageUri: 'images/arcore.png',
      link: 'https://youtu.be/gAZoGyaI-AA',
      backgroundColor: Color(0x66BA69C8),
    ),
    Project(
      title: 'QInk',
      imageUri: 'images/qink.png',
      link: null,
      backgroundColor: Color(0x6635AAE2),
    ),
    Project(
      title: 'Even Hearing Test',
      imageUri: 'images/even_logo.png',
      link: null,
      backgroundColor: Color(0x66131C3A),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...projects
            .map((e) => ProjectCard(
                  title: e.title,
                  imageUri: e.imageUri,
                  link: e.link,
                  backgroundColor: e.backgroundColor,
                ))
            .toList()
      ],
    );
  }
}
