import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../screens/home_screen/home_screen.dart';

class TableAdsAndHistory extends StatefulWidget {
  const TableAdsAndHistory({Key? key}) : super(key: key);

  @override
  State<TableAdsAndHistory> createState() => _TableAdsAndHistoryState();
}

class _TableAdsAndHistoryState extends State<TableAdsAndHistory> {
  final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3)),
      margin: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
      padding: const EdgeInsets.all(5),
      width: size.width * 0.22,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            constraints: const BoxConstraints(
              maxHeight: 270,
              minHeight: 200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                'https://angartwork.akamaized.net/webp/?id=153545060&size=296',
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 45,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryItemHistory(
                      context,
                      'assets/icons/fonts-logo.svg', 0,),
                  const SizedBox(width: 10,),
                  buildCategoryItemHistory(context,
                      "assets/icons/icons-logo.svg", 1,),
                  const SizedBox(width: 10,),
                  buildCategoryItemHistory(context,
                      "assets/icons/color-palette-logo.svg", 2,),
                  const SizedBox(width: 10,),
                  buildCategoryItemHistory(context,
                      "assets/icons/gridient-history-logo.svg", 3,),
                  const SizedBox(width: 5,),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(3)),
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildItemHistory();
                },
                itemCount: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
  List<bool> selectedHistory = [true, false, false, false,];

  void selectCategoryHistory(int n) {
    for (int i = 0; i < 4; i++) {
      if (i == n) {
        selectedHistory[i] = true;
      } else {
        selectedHistory[i] = false;
      }
    }
  }


   Widget buildCategoryItemHistory(
      BuildContext context, String assetSVG, int index,) {
    return InkWell(
      onTap: () {
        setState(() {
          selectCategoryHistory(index);
        });
      },
      child: AnimatedContainer(

        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: selectedHistory[index]
              ? Colors.white
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric( horizontal: 5),
        child: SvgPicture.asset(
          assetSVG,
          height: 20.5,
          width: 20.5,
          color: selectedHistory[index]
              ? HexColor('#525667')
              : HexColor('#A7AAB9'),
        ),
      ),
    );
  }

   Widget buildItemHistory() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: const Text(
          'Cutie Maggie Demo',
          style: TextStyle(
            fontFamily: 'Matura MT Script Capitals',
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}
