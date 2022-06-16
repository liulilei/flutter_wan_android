import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/show.dart';
import 'package:test_flutter/app/ui/title_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author lll
/// @date on 2022/6/16
class FlutterWebView extends StatelessWidget {
  FlutterWebView({Key? key}) : super(key: key);

  static const String title = "title";

  static const String url = "url";

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: TitleAppBar(
        title: arguments[title] ?? "",
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: arguments[url] ?? "",
            onWebViewCreated: (webViewController) {
              _controller.complete(webViewController);
              SmartDialog.showLoading();
            },
            onPageFinished: (_) {
              if (SmartDialog.config.isExistLoading) {
                SmartDialog.dismiss(status: SmartStatus.loading);
              }
            },
          ),
          Positioned(left: 0, bottom: 0, right: 0, child: NavigationControls(_controller.future)),
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture, {Key? key}) : super(key: key);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady = snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Container(
          color: Colors.white.withOpacity(0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black54,
                ),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller!.canGoBack()) {
                          await controller.goBack();
                        } else {
                          Get.back();
                          return;
                        }
                      },
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                ),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller!.canGoForward()) {
                          await controller.goForward();
                        } else {
                          showSnackBar(context, "没有下一页");
                          return;
                        }
                      },
              ),
              IconButton(
                icon: const Icon(
                  Icons.replay_rounded,
                  color: Colors.black54,
                ),
                onPressed: !webViewReady
                    ? null
                    : () {
                        controller!.reload();
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
