import 'package:flutter/material.dart';

class FLButton extends StatelessWidget {
  final double _width;
  final double _height;
  final EdgeInsets _padding;
  final Widget _leftChild;
  final Widget _middleChild;
  final Widget _rightChild;
  final Color _bgColor;
  final Color _borderColor;

  FLButton(
      {double width, double height, EdgeInsets padding, Widget leftChild, Widget middleChild, Widget rightChild, Color bgColor, Color borderColor, })
      : _width = width ?? 0,
        _height = height ?? 0,
        _padding = padding ?? EdgeInsets.zero,
        _leftChild = leftChild ?? null,
        _middleChild = middleChild ?? null,
        _rightChild = rightChild ?? null,
        _bgColor = bgColor ?? Colors.white,
        _borderColor = borderColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button Pressed");
      },
      child: Container(
        width: _width,
        height: _height,
        //margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _bgColor,
          border: Border.all( color: _borderColor),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: _padding,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _leftChild == null ? Container() : _leftChild,
              _middleChild == null ? Container() : _middleChild,
              _rightChild == null ? Container() : _rightChild,
            ],
          ),
        ),
      ),
    );
  }
}
