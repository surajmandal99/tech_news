import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tech_news/components/button_sheet.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/text.dart';
import 'components.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) =>
                      const SimpleCircularProgressBar(
                    size: 60,
                    progressColors: [
                      Colors.yellow,
                      Colors.blue,
                      Colors.green,
                      Colors.red,
                      Colors.purpleAccent
                    ],
                    backColor: Colors.white38,
                    animationDuration: 2,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModifiedText(
                          color: AppColors.white, size: 16, text: title),
                      const SizedBox(height: 5),
                      ModifiedText(
                          color: AppColors.lightwhite, size: 12, text: time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const DividerWidget()
      ],
    );
  }
}
