import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class FlutterMapPage extends StatefulWidget {
  static const name = "/FlutterMapPage";
  const FlutterMapPage({super.key});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top,),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(31.2304, 121.4737), // 上海市中心
                minZoom: 2,
                maxZoom: 19,
                initialZoom: 4,
              ),
              children: [
                TileLayer( // Bring your own tiles
                  urlTemplate: 'http://t0.tianditu.gov.cn/img_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=img&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk=472cbc6a2124b0a32cc77f23979c515e', // For demonstration only
                  userAgentPackageName: 'com.example.flutteruitest', // Add your app identifier
                  // And many more recommended properties!
                ),
                MarkerLayer(markers: [
                  Marker(
                    point: const LatLng(31.2304, 121.4737),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
