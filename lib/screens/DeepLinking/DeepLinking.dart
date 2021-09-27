import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:get/get.dart';

class DeepLinking extends StatefulWidget {
  @override
  _DeepLinkingState createState() => _DeepLinkingState();
}

class _DeepLinkingState extends State<DeepLinking> {
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  StreamSubscription _sub;

  Future<void> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final _latestUri = await getInitialUri();
      final queryParams = _latestUri.queryParametersAll.entries.toList();
      print(queryParams);

      var parameters = <dynamic, dynamic>{};
      for (final item in queryParams) {
        parameters.addAll({item.key: item.value.join(', ')});
      }
      print(parameters);
      Get.toNamed('/OrganizationScreen');
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Text('aaa'),
      )),
    );
  }
}
