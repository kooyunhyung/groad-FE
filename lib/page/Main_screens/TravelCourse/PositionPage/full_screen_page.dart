import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenPage extends StatefulWidget {
  FullScreenPage({Key key, this.image}) : super(key: key);

  Image image;

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 333),
              curve: Curves.fastOutSlowIn,
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 4,
                child: widget.image,
              ),
            ),
          ]),
          SafeArea(
              child: Align(
            alignment: Alignment.topLeft,
            child: MaterialButton(
              padding: const EdgeInsets.all(15),
              elevation: 0,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
              color: Colors.black12,
              highlightElevation: 0,
              minWidth: double.minPositive,
              height: double.minPositive,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ))
        ],
      ),
    );
  }
}
