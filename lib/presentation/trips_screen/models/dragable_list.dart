import 'package:flutter/cupertino.dart';

class DraggableList {
  final Widget header;
  final List<DraggableListItem> items;

  const DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final Widget txt;

  const DraggableListItem({
    required this.txt,
  });
}

