import 'package:aagneya_flutter_app/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class DetailsVideoPage extends StatelessWidget {
  final String link_;
  DetailsVideoPage(this.link_);

  @override
  Widget build(BuildContext context) {
    String getYoutubeVideoId(String Url) {
      RegExp regExp = new RegExp(
        r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
        caseSensitive: false,
        multiLine: false,
      );
      final match = regExp.firstMatch(Url).group(1); // <- This is the fix
      String str = match;
      return str;
    }

    var vid_Id = getYoutubeVideoId(link_);
    print(vid_Id);

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: vid_Id,
      params: YoutubePlayerParams(
        playlist: [vid_Id], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
        title: Text(
          'Watch Events',
          style: TextStyle(
            color: Colors.grey[900],
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child: Center(
        
        child: Column(
          children: [
            SizedBox(
              height: 90.0,
            ),
            Center(
              child:Container(
                width: 900.0,
              
              child: YoutubePlayerIFrame(
                controller: _controller,
                
                  ),
              )
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: (MediaQuery.of(context).size.width) / 2,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () => {
                    AuthService().launchYouTubeURL(link_).then((val) {
                      print(val);
                    })
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.black,
                  child: Text(
                    'Watch on YouTube',
                    style: TextStyle(
                      color: Colors.red,
                      letterSpacing: 1.5,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            )
          ],
        )),

      ),
    );
  }
}
