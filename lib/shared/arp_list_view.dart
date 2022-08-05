import 'package:flutter/material.dart';

class ArpListViewWidget<T> extends StatefulWidget {
  final List<T> items;
  final IndexedWidgetBuilder itemBuilder;

  const ArpListViewWidget(
      {Key? key, required this.items, required this.itemBuilder})
      : super(key: key);

  @override
  State<ArpListViewWidget> createState() => _ArpListViewWidgetState();
}

class _ArpListViewWidgetState extends State<ArpListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.items.length,
      itemBuilder: widget.itemBuilder,
    );
  }
}
