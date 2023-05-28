import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.rang, this.cardChild, this.onTap});

  final Color rang;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: rang,
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
