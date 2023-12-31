import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/backend/functions.dart';
import 'package:tech_news/utils/colors.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});
  static TextEditingController searchcontroller =
      TextEditingController(text: " ");

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white30, borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: MySearchBar.searchcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search your news !',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none),
                ))
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search_rounded,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
