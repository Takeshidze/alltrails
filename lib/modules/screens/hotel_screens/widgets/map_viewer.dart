import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'map_point.dart';

class MapViewer extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MapViewer({super.key, required this.latitude, required this.longitude});

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  late final YandexMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      onMapCreated: (controller) async {
        _mapController = controller;
        // приближаем вид карты ближе к Европе
        await _mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: widget.latitude,
                longitude: widget.longitude,
              ),
              zoom: 15,
            ),
          ),
        );
      },
      mapObjects: _getPlacemarkObjects(context),
    );
  }

  /// Метод для генерации точек на карте
  List<MapPoint> _getMapPoints() {
    return [
      MapPoint(
          name: 'Отель',
          latitude: widget.latitude,
          longitude: widget.longitude),
    ];
  }

  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
    return _getMapPoints()
        .map(
          (point) => PlacemarkMapObject(
            mapId: MapObjectId('MapObject $point'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/icons/map_point.png',
                ),
                scale: 0.07,
              ),
            ),
            onTap: (_, __) => showModalBottomSheet(
              context: context,
              builder: (context) => _ModalBodyView(
                point: point,
              ),
            ),
          ),
        )
        .toList();
  }
}

/// Метод для генерации объектов маркеров для отображения на карте

/// Содержимое модального окна с информацией о точке на карте
class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point});

  final MapPoint point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(point.name, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Text(
          '${point.latitude}, ${point.longitude}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }
}
