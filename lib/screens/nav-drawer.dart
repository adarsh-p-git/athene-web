import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:aagneya_flutter_app/utilities/Url.dart';

import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:html' as html;
import 'dart:html' show window;


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Athene Arts',
              style: GoogleFonts.dancingScript(
                textStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("assets/nav-bar.jpg"))),
          ),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Color(0xFFFF9800),
            ),
            title: window.localStorage.containsKey("userid")
                ? Text('Account')
                : Text('Login'),
            onTap: () => {
              window.localStorage.containsKey("userid")
                  ? Navigator.of(context).pushNamed(ACCOUNT)
                  : Navigator.of(context).pushNamed(SIGN_IN),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.app_registration,
              color: Color(0xFFFF9800),
            ),
            title: Text('Register'),
            onTap: () => {
              window.localStorage.containsKey("userid")
                  ? html.window
                      .open( URL + '/app-event-register/' + window.localStorage["userid"], "_self")
                  : Navigator.of(context).pushNamed(SIGN_IN),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo,
              color: Color(0xFFFF9800),
            ),
            title: Text('Photo gallery'),
            onTap: () => {
              Navigator.of(context).pushNamed(GALLERY),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.video_collection,
              color: Color(0xFFFF9800),
            ),
            title: Text('Watch videos'),
            onTap: () => {
              Navigator.of(context).pushNamed(VIDEO_LIST_SCREEN),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.upload,
              color: Color(0xFFFF9800),
            ),
            title: Text('Upload your works'),
            onTap: () => {
              window.localStorage.containsKey("userid")
                  ? html.window.open(
                      URL +
                          '/app-upload-entries/' +
                          window.localStorage["userid"],
                      "_self")
                  : Navigator.of(context).pushNamed(SIGN_IN),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.border_color,
              color: Color(0xFFFF9800),
            ),
            title: Text('Feedback'),
            onTap: () => {AuthService().launchURL().then((val) {})},
          ),
          window.localStorage.containsKey("userid")
              ? ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFFFF9800),
                  ),
                  title: Text('Logout'),
                  onTap: () => {
                    AuthService().logout().then((value) {
                      print(value);
                    }),
                    Navigator.of(context).pushNamed(HOME),
                    print("Routing to Home screen"),
                    window.localStorage.remove("userid"),
                  },
                )
              : Text(" "),
        ],
      ),
    );
  }
}
