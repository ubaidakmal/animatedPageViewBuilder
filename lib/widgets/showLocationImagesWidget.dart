import 'package:animated_pageview_builder/widgets/expendedContentWidget.dart';
import 'package:animated_pageview_builder/widgets/showImageWidget.dart';
import 'package:flutter/material.dart';

import '../models/locationsModel.dart';

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
          alignment: Alignment.center,
          children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpended ? 50 : 100,
            width: isExpended ? size.width * .78 : size.width * .7,
            height: isExpended ? size.height * .6 : size.height * .5,
            child: ExpandedContentWidget(location: widget.location)),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpended ? 150 : 100,
            child: GestureDetector(
                onPanUpdate: onPanUpdate,
                child: ImageWidget(location: widget.location)))
      ]),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpended = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpended = false;
      });
    }
  }
}
