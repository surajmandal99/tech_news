import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/components/components.dart';
import 'package:tech_news/utils/text.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

Future<void> _launchURL(String url) async {
  if (await launchUrlString(url)) {
    await canLaunchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                  text: description, size: 16, color: Colors.white)),
          GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text('Read Full Article',
                    style: GoogleFonts.lato(
                      color: Colors.yellow,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
