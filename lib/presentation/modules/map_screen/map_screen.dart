import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:monie_point/presentation/modules/map_screen/widgets/map_function_widget.dart';
import 'package:monie_point/presentation/modules/map_screen/widgets/reveal_marker_info_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_screen/widgets/searchbar_animated_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            FlutterMap(
                    options: MapOptions(
            center: LatLng(59.83520508022095, 30.399869084271163),
            zoom: 15.0,
                    ),
                    children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              tileBuilder: _darkModeTileBuilder,
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () =>
                      launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
            MarkerLayer(markers: [
              Marker(
                  width: 100,
                  height: 200,
                  point: LatLng(59.83520508022095, 30.399869084271163),
                  builder: (ctx) => RevealMarkerInfoContainer(locationString: "Street 19")),
              Marker(
                  width: 100,
                  height: 100,
                  point: LatLng(59.829969218098675, 30.402891892005794),
                  builder: (ctx) => RevealMarkerInfoContainer(locationString: "Street 18")),
              Marker(
                  width: 100,
                  height: 100,
                  point: LatLng(59.83693022153871, 30.394409961553702),
                  builder: (ctx) => RevealMarkerInfoContainer(locationString: "Street 7",)),
              Marker(
                  width: 100,
                  height: 100,
                  point: LatLng(59.8368386620331, 30.406375821988657),
                  builder: (ctx) => RevealMarkerInfoContainer(locationString: "House 14",))
            ])
                    ],
                  ),
            Align(
              alignment: Alignment.topCenter,
              child: SearchBarAnimatedWidget(
                onMenuItemSelect: (v){},
                animationStart: 500,
                visibilityAfter: 500,
                animationDuration: 2000,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MapFunctionWidget(
                onMenuItemSelect: (v){},
                animationStart: 500,
                visibilityAfter: 500,
                animationDuration: 2000,
              ),

            )
          ],
        ));
  }

  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ]),
      child: tileWidget,
    );
  }
}


