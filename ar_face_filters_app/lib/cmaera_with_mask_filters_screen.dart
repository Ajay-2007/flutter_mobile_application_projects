import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';

import 'dart:io' as Platform;

class CameraWithMaskFiltersScreen extends StatefulWidget {
  @override
  _CameraWithMaskFiltersScreenState createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Deep AR Camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {});
              },
              androidLicenceKey: "9d3126a25989e4194e30667d934436b2c5529d4b95a70a5c2b90daf145b5a5aff95fb99efb0b9c8b",
              onImageCaptured: (path) {
                platformVersion = "Image save at $path";
                print(platformVersion);
                setState(() {

                });
              },
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              },
            ),

            // Face Filters - Image Buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0, right: 28.0),
                      child: Expanded(
                        child: FlatButton(
                          child: Icon(Icons.camera_enhance),
                          color: Colors.white54,
                          padding: EdgeInsets.all(15.0),
                          onPressed: () {
                            if(null == cameraDeepArController) {
                              return;
                            }
                            cameraDeepArController.snapPhoto();
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          8,
                          (page) {
                            bool active = currentPage == page;

                            return Platform.Platform.isIOS
                                // ios app view
                                ? GestureDetector(
                                    onTap: () {
                                      currentPage = page;
                                      cameraDeepArController.changeMask(page);
                                      setState(() {});
                                    },
                                    child: AvatarView(
                                      radius: active ? 45 : 25,
                                      borderColor: Colors.yellow,
                                      borderWidth: 2,
                                      isOnlyText: false,
                                      avatarType: AvatarType.CIRCLE,
                                      backgroundColor: Colors.red,
                                      imagePath:
                                          "assets/assets/ios/${page.toString()}.jpg",
                                      placeHolder: Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                      errorWidget: Container(
                                        child: Icon(
                                          Icons.error,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  )
                                // android app view
                                : GestureDetector(
                                    onTap: () {
                                      currentPage = page;
                                      cameraDeepArController.changeMask(page);
                                      setState(() {});
                                    },
                                    child: AvatarView(
                                      radius: active ? 65 : 30,
                                      borderColor: Colors.yellow,
                                      borderWidth: 2,
                                      isOnlyText: false,
                                      avatarType: AvatarType.CIRCLE,
                                      backgroundColor: Colors.red,
                                      imagePath:
                                          "assets/assets/android/${page.toString()}.jpg",
                                      placeHolder: Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                      errorWidget: Container(
                                        child: Icon(
                                          Icons.error,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
