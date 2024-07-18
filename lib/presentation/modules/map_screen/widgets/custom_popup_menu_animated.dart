import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPopupMenu extends StatefulWidget {
  final Widget child;
  MyPopupMenu({Key? key,required this.child}) : assert(child.key != null), super(key: key);

  @override
  _MyPopupMenuState createState() => _MyPopupMenuState();
}

class _MyPopupMenuState extends State<MyPopupMenu>
{

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      itemBuilder: (context) => [
        menuItem(1, "Copy Area", Icons.copy),
        menuItem(2, "Price", Icons.wallet),
        menuItem(3, "Infrastructure", Icons.house_outlined),
        menuItem(4, "Without any layer", Icons.layers)
      ],
      initialValue: 0,
      onCanceled: () {
        print("You have canceled the menu selection.");
      },
      onSelected: (value) {
        switch(value){
          case 1:
          //do something
            break;
          case 2:
          //do something
            break;
          default: { print("Invalid choice"); }
          break;
        }
      },
      offset: const Offset(5, -160),
      child: widget.child,
    );
  }

  PopupMenuEntry<int> menuItem(int value,String text, IconData icon){
    return PopupMenuItem(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
           Padding(
            padding: const EdgeInsets.only(right: 8.0), // Adjust horizontal padding as needed
            child: Icon(icon, size: 22,
                color: (value == 2)?const Color(0xFFfca717):const Color(0xFFbab6ae)),
          ),
          Text(text, style: TextStyle(fontSize: 14.0,color: (value == 2)?const Color(0xFFfca717):const Color(0xFFbab6ae))),
        ],
      ),
    );
  }

}