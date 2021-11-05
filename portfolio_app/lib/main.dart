import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    Portfolio(),
  );
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  Future<void> _openUrl(String url) async {
    final isLaunchable = await canLaunch(url);
    if (isLaunchable) {
      launch(url);
    }
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/image.jpeg'),
            radius: 100,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Hello World, I'm Ajay",
                style: TextStyle(
                    color: kDarkGrey,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "A Software Engineer and Machine Learning Engineer passionate about building ML App and Mobile App",
              style: TextStyle(
                color: kDarkGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    _openUrl("https://www.linkedin.com/in/ajay-2007"),
                icon: const FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: kBlueColor,
                ),
              ),
              IconButton(
                onPressed: () => _openUrl("https://www.github.com/Ajay-2007"),
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  color: kBlueColor,
                ),
              ),
              IconButton(
                onPressed: () =>
                    _openUrl("https://www.instagram.com/ajayr_2007/"),
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badges() {
    const technologies = [
      "flutter",
      "dart",
      "python",
      "docker",
      "google_cloud",
      "git",
      "bitcoin",
      "bash",
      "firebase",
      "tensorflow",
      "html",
      "javascript",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: technologies
            .map(
              (technology) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/badges/$technology.png',
                        width: 48.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text(technology),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderProjectCard({
    required String imageUrl,
    required String title,
    required String description,
    String? visitLink,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 350),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: kDarkGrey,
          ),
        ),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: 350,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: kDarkGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            if (visitLink != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, bottom: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => _openUrl(visitLink),
                      child: Text('VISIT'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _projects() {
    return Container(
      color: kLightGrey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 52.0, horizontal: 16.0),
      child: Column(
        children: [
          const Text('Projects',
              style: TextStyle(
                color: kDarkGrey,
                fontSize: 28.0,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 16.0,
          ),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              _renderProjectCard(
                  imageUrl: 'assets/projects/pokedex.png',
                  title: 'Pokedex',
                  description: 'Pokemon explorer built with Flutter',
                  visitLink: 'https://pokedexweb.surge.sh'),
              _renderProjectCard(
                  imageUrl: 'assets/projects/cryptospace.png',
                  title: 'Cryptospace',
                  description: 'Cryptocurrency tracker',
                  visitLink: 'https://cryptospace.surge.sh'),
              _renderProjectCard(
                  imageUrl: 'assets/projects/notable.png',
                  title: 'Notable',
                  description: 'Note-taking made simple',
                  visitLink: 'https://notable.surge.sh'),
              _renderProjectCard(
                  imageUrl: 'assets/projects/chatly.png',
                  title: 'Chatly',
                  description: 'Real-time Chat',
                  visitLink: 'https://chatly.surge.sh'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      color: kBlackColor,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Text(
            'Made by Ajay R',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'FiraCode',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Ajay R",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 800.0),
                child: Column(
                  children: [
                    _header(),
                    const SizedBox(height: 24.0),
                    _badges(),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              _projects(),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }
}
