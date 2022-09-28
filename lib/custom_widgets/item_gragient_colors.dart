import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/shared/components.dart';
import 'package:portfolio/shared/routing/rout_name.dart';

import '../screens/fonts_screen/fonts_screen.dart';
import '../screens/gradients_screen/gradient_details_screen.dart';
import '../screens/quick_view_screen/quick_view_screen.dart';
import '../shared/routing/locator.dart';
import '../shared/routing/nav_services.dart';
import '../shared/styles/themes.dart';
import 'custom_buttons/save_button.dart';
import 'custom_tost.dart';
import 'my_custom_pupup_item.dart';

class ItemsGragientGridView extends StatefulWidget {

  @override
  State<ItemsGragientGridView> createState() => _ItemsGragientGridViewState();
}

class _ItemsGragientGridViewState extends State<ItemsGragientGridView> {

  @override
  Widget build(BuildContext context) {
Size size =MediaQuery.of(context).size;
    return  Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child:GridView.builder(
        padding: const EdgeInsets.all(5),
        shrinkWrap: true,
        primary:true ,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
          return buildItemGradient(size);
        },
        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
          size.width<2800&&size.width>2200?
          size.width*0.13:
          size.width>2800?
          size.width*0.08:
          size.width*0.18,
          childAspectRatio:
          size.width<1000&&size.width>600?2.3:
          size.width<1200&&size.width>1000?2.8:
          size.width<1400&&size.width>1200?1.01:    //100%
          size.width<1600&&size.width>1400?1.14:
          size.width<1800&&size.width>1600?1.28:
          size.width<2000&&size.width>1800?1.18:      //اول ظهور لل padding
          size.width<2200&&size.width>2000?1.28:     //67%
          size.width<2800&&size.width>2200?1.2:       //50%
          size.width<4600&&size.width>2800?1.2:
          1.6,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,

        ),
        itemCount: 20,
      ),

    );

  }

}

class buildItemGradient extends StatefulWidget {
  final Size size;
   buildItemGradient(this.size);

  @override
  State<buildItemGradient> createState() => _buildItemGradientState();
}

class _buildItemGradientState extends State<buildItemGradient> {
  final CustomPopupMenuController customPopupMenuController =CustomPopupMenuController();
  bool isHover=false;
  final toast=FToast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover=true;
            });

          },
          onExit: (event) {
            setState(() {
              isHover=false;
            });
          },
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //       type: PageTransitionType.fade,
                  //       alignment: Alignment.center,
                  //       child :  GradientDetailsScreen(),
                  //       duration: const Duration(milliseconds: 200)
                  //   ),
                  // );
                  // Navigator.pushNamed(context, GradientsDetailsRoute);
                  locator<NavigationService>().navigateTo(GradientsDetailsRoute,queryParams:{"index":'5'} );
                },
                child: Container(
                  height: 200,
                  width: widget.size.width*0.18,
                  constraints: BoxConstraints(
                      maxWidth: 280
                  ),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFF3366FF),
                          Color(0xFF00CCFF),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
              isHover? Positioned(
                top: 10,
                left: 10,
                child: InkWell(
                  onTap: (){
                    showBottomToast();
                    Clipboard.setData(ClipboardData(text: 'ok copy'));
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ):const SizedBox(),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 30,
          width: widget.size.width*0.18,
          constraints: BoxConstraints(
              maxWidth: 280
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Row(
                children:List.generate(3, (index)
                =>  Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: (){
                      showBottomToast();
                      Clipboard.setData(ClipboardData(text: 'ok copy'));
                    },
                    child:  CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 10,
                    ),
                  ),
                ),
                ),
              ),
              const Spacer(),
              SaveButton(
                color:Colors.white,
                width: 40,
                height: 25,
                iconsSize: 25,
                paddingVertical: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text('50.6k ',
                  style: TextStyle(
                      color: Colors.grey,
                      height: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              CustomPopupMenu(
                controller: customPopupMenuController,
                arrowColor: kPrimaryColor,
                horizontalMargin:0 ,
                verticalMargin: 0,
                enablePassEvent: false,
                barrierColor: Colors.transparent,
                menuBuilder: () {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MyCustomPopUpItem(

                          onTap: (){
                            customPopupMenuController.hideMenu();
                            showQuickScreen(
                                isPalettesScreen:false ,
                                isIconsScreen: false,
                                context: context,
                                isGradientScreen:true
                            );
                          },

                          height: 30,
                          text:'Quick View',
                          textSize: 13,
                          iconSize: 20,
                          width: 150,

                          icon:Icons.remove_red_eye_outlined,

                        ),
                        MyCustomPopUpItem(
                          onTap: (){

                          },
                          width: 150,
                          height: 30,
                          text:'Copy Palette ID',
                          icon:Icons.copy,
                          textSize: 13,
                          iconSize: 20,

                        ),
                        MyCustomPopUpItem(
                          onTap: (){

                          },
                          width: 150,
                          height: 30,
                          textSize: 13,
                          iconSize: 20,
                          text:'Download Image',
                          icon:Icons.download,

                        ),
                        MyCustomPopUpItem(
                          onTap: () {

                          },
                          width: 150,
                          height: 30,
                          icon: Icons.menu,
                          textSize: 13,
                          iconSize: 20,
                          text:  'Explore Similar',
                        ),
                        MyCustomPopUpItem(
                          onTap: () {

                          },
                          width: 150,
                          textSize: 13,
                          text:'Save Font' ,
                          height: 30,
                          widthSVG: 20,
                          heightSVG: 20 ,

                        ),
                      ],
                    ),
                  );
                },
                pressType: PressType.singleClick,
                child:  Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 28,
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
  void showBottomToast(){
    toast.showToast(
        child: MyCustomToast(),
        positionedToastBuilder: (context,child){
          return Positioned(child: child, bottom: 10,left: 510,);
        }
    );
  }
}
