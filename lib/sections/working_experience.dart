import 'package:flutter/widgets.dart';
import 'package:nikilapi_web/domain/project.dart';
import 'package:nikilapi_web/widgets/project.dart';

class WorkingExperienceSection extends StatelessWidget {
  static const List<Project> projects = [
    Project(
      title: "Worship Songs",
      imageUri: "images/worship_songs.png",
      description:
          "One day I thought that would be interesting to try to do something real with Flutter. So I grab my friend-designer Mark and we started thinking about an idea. We stopped here. Worship Songs is an app to help Christians to find worship songs during the campfire or where you can\'t reach the wall-projector.",
      link: "https://play.google.com/store/apps/details?id=com.worshipsongs",
      backgroundColor: Color(0x66027DF9),
      stack: "Flutter, Dart, BLoC, Android, iOS",
    ),
    Project(
      title: 'Wedbox',
      imageUri: 'images/wedbox.webp',
      link: 'https://play.google.com/store/apps/details?id=com.capty.wedbox',
      backgroundColor: Color(0x66FFB398),
      description:
          "An app to help the wedding couple share and gather photos from their wedding. This app very similar to Instagram, but with wedding-related features like a day schedule.",
      stack: "Android, Kotlin, Java, MVP, CameraX",
    ),
    Project(
        title: 'ARSport',
        imageUri: 'images/arcore.png',
        link: 'https://youtu.be/gAZoGyaI-AA',
        backgroundColor: Color(0x66BA69C8),
        description:
            """A module of augmented reality soccer app. There 2 objects to interact with. The first one is the Portal. You can enter the portal and see the stadium panorama (360 degrees image) inside and hear the stadium noise.

The second one is the Stadium. You can see the players' info with AR from parsed JSON. Also, there are attacking areas feature - arrows with match statistic.""",
        stack: "ARCore, ViroCore, Kotlin, JSON, Math 🤓"),
    Project(
      title: 'QInk',
      imageUri: 'images/qink.png',
      link: null,
      backgroundColor: Color(0x6635AAE2),
      description:
          "Qualified Ink. Is an Adobe Reader plugin to automate signing papers. We followed the eIDAS regulation for signing papers. So our plugin's sign was exactly the same de jure as the hand signing.",
      stack: "Adobe Reader, C++, wxWidgets, SHA",
    ),
    Project(
      title: 'Even Hearing Test',
      imageUri: 'images/even_logo.png',
      link: null,
      backgroundColor: Color(0x66131C3A),
      description:
          "Even is an app for point of sale. It adapts music to your hearing.  You pass the test for each ear and for each frequency, then the app changes the equalizer settings especially for you.",
      stack: "Android, Kotlin, MVP, Dagger2, ExoPlayer, Equalizer API"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: [...projects.map((e) => ProjectCard(project: e)).toList()],
      ),
    );
  }
}
