import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thepos/features/home/presentation/widgets/search_widget.dart';
import 'package:thepos/features/home/presentation/controllers/home_controller.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: SearchBar(
            isSearching: controller.searching.value, controller: controller),
        leading: InkWell(
          onTap: () {
            controller.showHidCart();
          },
          child: Container(
            color: const Color(0xffF79624),
            width: 50,
            child: const Icon(Icons.menu),
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/svg/barcode.svg",
            width: 30,
          ),
          // Icon(
          //   Icons.qr_code,
          //   color: Colors.grey,
          // ),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                controller.showSearch();
              },
              child: SvgPicture.asset(
                "assets/svg/search.svg",
                width: 20,
              )),

          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final bool isSearching;
  final HomeController controller;

  SearchBar({required this.isSearching, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimateExpansion(
          animate: !isSearching,
          axisAlignment: 1.0,
          child: Text("المبيعات",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              )),
        ),
        AnimateExpansion(
          animate: isSearching,
          axisAlignment: -1.0,
          child: Search(controller),
        ),
      ],
    );
  }
}
