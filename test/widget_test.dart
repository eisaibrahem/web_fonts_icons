import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

class TestCustonPopupScreen extends StatefulWidget {
  @override
  _TestCustonPopupScreenState createState() => _TestCustonPopupScreenState();
}

class _TestCustonPopupScreenState extends State<TestCustonPopupScreen> {

  CustomPopupMenuController _controller = CustomPopupMenuController();
  List<Widget> menuItems = [
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
  ];
  List<Widget> messages = [
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPopupMenu'),
        actions: <Widget>[
          CustomPopupMenu(
            menuBuilder: () => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: const Color(0xFF4C4C4C),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: menuItems
                        .map(
                          (item) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print("onTap");
                          _controller.hideMenu();
                        },
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                size: 15,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'sxasx',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
            pressType: PressType.singleClick,
            verticalMargin: -10,
            controller: _controller,
            child: Container(
              padding: EdgeInsets.all(20),
              child: const Icon(Icons.add_circle_outline, color: Colors.white),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                children: messages
                    .map(
                      (message) => MessageContent(),
                )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageContent extends StatelessWidget {

  List<Widget> menuItems = [
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
    Text('复制',),
  ];

  Widget _buildLongPressMenu() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 220,
        color: const Color(0xFF4C4C4C),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          crossAxisCount: 5,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: menuItems
              .map((item) => Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.ac_unit,
                size: 20,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  'scscsss',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAvatar(bool isMe, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: isMe ? Colors.blueAccent : Colors.pinkAccent,
        width: size,
        height: size,
        child: Icon(
          isMe ? Icons.face : Icons.tag_faces,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = true;
    double avatarSize = 40;

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: isMe ? 0 : 10, left: isMe ? 10 : 0),
            child: CustomPopupMenu(
              menuBuilder: () => GestureDetector(
                child: _buildAvatar(isMe, 100),
                onLongPress: () {
                  print("onLongPress");
                },
                onTap: () {
                  print("onTap");
                },
              ),
              barrierColor: Colors.transparent,
              pressType: PressType.singleClick,
              arrowColor: isMe ? Colors.blueAccent : Colors.pinkAccent,
              position: PreferredPosition.top,
              child: _buildAvatar(isMe, avatarSize),
            ),
          ),
          CustomPopupMenu(
            menuBuilder: _buildLongPressMenu,
            barrierColor: Colors.transparent,
            pressType: PressType.longPress,
            child: Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 240, minHeight: avatarSize),
              decoration: BoxDecoration(
                color: isMe ? Color(0xff98e165) : Colors.white,
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Text('scacsdcdsd'),
            ),
          )
        ],
      ),
    );
  }
}