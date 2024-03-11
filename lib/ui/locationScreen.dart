import 'package:flutter/material.dart';

import '../data/locationsData.dart';
import '../models/locationsModel.dart';
import '../widgets/showLocationImagesWidget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final PageController controller = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              return LocationWidget(
                location: location,
              );
            },
            onPageChanged: (index) => setState(() {
              pageIndex = index;
            }),
          )),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
