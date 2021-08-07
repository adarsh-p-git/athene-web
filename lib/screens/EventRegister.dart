
import 'dart:io';
import 'package:aagneya_flutter_app/utilities/Url.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:html' show window;

String url_=URL+'/app-event-register/';

bool isLoading=true;
final _key = UniqueKey();


//final SecureStorage secureStorage = SecureStorage();

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
      ),
      body:Stack(
        children: <Widget>[
            WebView(
            key: _key,
            initialUrl: url_+window.localStorage["userid"],
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
           isLoading ? Center( child: CircularProgressIndicator(color: Color(0xFFFF9800)),)
                    : Stack(),
        ],
      )
      
      
      );
    
  }
}


