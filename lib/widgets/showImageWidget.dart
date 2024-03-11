import 'package:animated_pageview_builder/models/locationsModel.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final Location location;

  const ImageWidget({Key? key, required this.location}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 1, spreadRadius: 1),
        ], borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildTopText(), buildLatitudeLongitudeText()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Image.network(
          widget.location.images!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTopText() {
    return Text(
      widget.location.name!,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget buildLatitudeLongitudeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.location.latitude!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Icon(
          Icons.location_on_rounded,
          color: Colors.white,
        ),
        Text(
          widget.location.longitude!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
