//https://youtu.be/Mn254cnduOY?t=13539

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_bloc/dialogs/loading_screen_controller.dart';

class LoadingScreen {
//create an instance because you only one variant of loading screen
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  //https://youtu.be/Mn254cnduOY?t=13695
//reason is so that loading screen can manage its own state
  LoadingScreenController? _controller;

  //https://youtu.be/Mn254cnduOY?t=14846
  void show({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = _showOverlay(
        context: context,
        text: text,
      );
    }
  }

//https://youtu.be/Mn254cnduOY?t=15103
  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final _text = StreamController<String>();
    _text.add(text);

    final state = Overlay.of(context);
    //get the size of the screen
    final renderBox = context.findRenderObject() as RenderBox;

    //size of the overlay
    final size = renderBox.size;

    //overlay entry- this is where the screen goes dark to highlight the message
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              //https://youtu.be/Mn254cnduOY?t=14248

              constraints: BoxConstraints(
                maxWidth: size.width * .08,
                maxHeight: size.height * 0.8,
                minWidth: size.width * .5,
              ),
              //https://youtu.be/Mn254cnduOY?t=14308
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              //https://youtu.be/Mn254cnduOY?t=14428
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    //column will always try to take as much space as possible
                    //hence the reason why we use min as the size
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<String>(
                        stream: _text.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    //https://youtu.be/Mn254cnduOY?t=14748
    state?.insert(overlay);

    return LoadingScreenController(
      close: () {
        _text.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        _text.add(text);
        return true;
      },
    );
  }
}
