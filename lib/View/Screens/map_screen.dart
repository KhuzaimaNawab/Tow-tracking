import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tow_tracking/theme/tow_tracking_color.dart';
import 'package:tow_tracking/theme/tow_tracking_textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? position;
  CameraPosition? myPos;
  Marker? marker;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<CameraPosition?> getPosition() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    if (position != null) {
      myPos = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 15,
      );
    }
    return myPos;
  }

  Future<Marker?> getMarker() async {
    BitmapDescriptor myIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/tow-truck.png');
    marker = Marker(
      markerId: MarkerId('aaa'),
      icon: myIcon,
      position: myPos!.target,
    );
    print(marker);
    return marker;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: TowTrackingColors.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/image.png',
                    fit: BoxFit.contain,
                  ),
                  Column(
                    children: [
                      Text('Leslie Alexander',
                          style: TowTrackingTextStyles.HeadlineMedium.copyWith(
                            color: Colors.white,
                          )),
                      Text('View Details',
                          style: TowTrackingTextStyles.HeadlineMedium.copyWith(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Customer Account',
                  style: TowTrackingTextStyles.HeadlineMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_4),
              title: const Text('Admin Account',
                  style: TowTrackingTextStyles.HeadlineMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings',
                  style: TowTrackingTextStyles.HeadlineMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About us',
                  style: TowTrackingTextStyles.HeadlineMedium),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kTextTabBarHeight * 1.5),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
          leadingWidth: size.width,
          backgroundColor: Colors.white,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                flex: 9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          getPosition(),
          getMarker(),
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: snapshot.data[0],
              markers: {
                snapshot.data[1],
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
