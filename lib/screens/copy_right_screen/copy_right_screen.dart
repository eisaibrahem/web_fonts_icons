import 'package:flutter/material.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../shared/styles/themes.dart';

class CopyRightScreen extends StatelessWidget {
   CopyRightScreen({Key? key}) : super(key: key);
   final TextEditingController nameController =TextEditingController();
   final TextEditingController emailController =TextEditingController();
   final TextEditingController hwbController =TextEditingController();
   final TextEditingController smsController =TextEditingController();
   final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width,65),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarCategory(),
          Expanded(
            child: ListView(
              controller: _scrollController,

              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(6),
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Contact Us',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 22,
                        fontFamily: 'Arial Rounded MT',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 370,
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Container(
                    width: size.width,
                    height: 290,
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('فى حالة كان هذا العنصر يخضع لحقوق الملكية الخاصة بك فيرجى اخبارنا عبر رسالة نصية و سيتم حذفه فور التأكد من صحة ادعائك',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                        ),
                        ),
                        const SizedBox(height: 10,),
                        Text('نرجوا ارسال اى رابط يعرض هذا العنصر فى اى موقع اخر فهذا يسرع من اجراءات حذفه من الموقع',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: 250,
                          child: Row(
                            children: [
                              Container(
                                height: 250,
                                width: 610,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                child: TextField(
                                    controller: smsController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                    cursorColor: Colors.black,
                                    autofocus: true,
                                    enableSuggestions: true,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder:InputBorder.none,
                                    )
                                ),
                              ),
                              const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: TextField(
                                        controller: nameController,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                        cursorColor: Colors.black,
                                        autofocus: true,
                                        enableSuggestions: true,
                                        decoration: const InputDecoration(
                                          hintText: 'enter your name',
                                          hintStyle: TextStyle(
                                              color: Colors.black38,
                                              fontSize:14,
                                            fontWeight: FontWeight.bold
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder:InputBorder.none,
                                              )
                                          ),
                                        ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: TextField(
                                        controller: emailController,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                        cursorColor: Colors.black,
                                        autofocus: true,
                                        enableSuggestions: true,
                                        decoration: const InputDecoration(
                                          hintText: 'email',
                                          hintStyle: TextStyle(
                                              color: Colors.black38,
                                              fontSize:14,
                                              fontWeight: FontWeight.bold
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: TextField(
                                        controller: hwbController,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                        cursorColor: Colors.black,
                                        autofocus: true,
                                        enableSuggestions: true,
                                        decoration: const InputDecoration(
                                          hintText: 'add HWB number',
                                          hintStyle: TextStyle(
                                              color: Colors.black26,
                                              fontSize:14,
                                              fontWeight: FontWeight.bold
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    MyCustomButton(
                                      color: Colors.blue,
                                      text: 'Send',
                                      width: 300,
                                      height: 50,
                                      textColor: Colors.white,
                                      fontFamily: 'Arial Rounded MT',
                                      textSize: 18,
                                      borderRadius: 3,
                                      onTap: (){

                                      },
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,)
                      ],
                    ),
                  ),

                )

              ],
            ),
          ),
          const TableAdsAndHistory(),

        ],
      ),
    );
  }
}
