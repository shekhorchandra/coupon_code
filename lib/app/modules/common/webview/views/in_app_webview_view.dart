import 'package:coupon_code/app/modules/common/webview/controllers/in_app_webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InAppWebviewView extends GetView<InAppWebviewController> {
  final String? title;
  final String? url;

  InAppWebviewView({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    if (title == null || url == null) {
      controller.title.value = 'Error';
      controller.isError.value = true;
      controller.errorMessage.value = 'Failed to navigate!';
    }

    final webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            controller.isLoading.value = false;
          },
          onHttpError: (HttpResponseError error) {
            controller.isError.value = true;
            controller.errorMessage.value = 'Error with status code: ${error.response?.statusCode}';
          },
          onWebResourceError: (WebResourceError error) {
            controller.isError.value = true;
            controller.errorMessage.value = error.description;
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url ?? 'https://yeppads.com'));

    return Scaffold(
      appBar: AppBar(title: Text(title ?? 'Yepp Ads')),

      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (controller.isError.value) {
          return Column(
            children: [
              Text('An error has occured!'),
              Text('Error: ${controller.errorMessage.value}'),
            ],
          );
        }

        return WebViewWidget(controller: webviewController);
      }),
    );
  }
}
