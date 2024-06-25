import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MiniMap extends StatefulWidget {
  const MiniMap({super.key});
  @override
  State<MiniMap> createState() => _MiniMapState();
}

class _MiniMapState extends State<MiniMap> {
  // final List<GeoPoint> _latLonData = [
  //   GeoPoint(
  //     latitude: -7.7828,
  //     longitude: 110.3608,
  //   )
  // ];
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initMapWithUserPosition: const UserTrackingOption(enableTracking: false),
    );
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(232, 232, 232, 1),
      ),
      child: OSMFlutter(
        controller: controller,
        osmOption: const OSMOption(
          zoomOption: ZoomOption(
            initZoom: 17,
            maxZoomLevel: 19,
            minZoomLevel: 2,
            stepZoom: 1.0,
          ),
        ),
      ),
    );
  }
}
