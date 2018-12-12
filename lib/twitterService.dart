import 'package:url_launcher/url_launcher.dart';

sendTextMessage({String message}) {
  message = "#DevFestAhm #DevFest18" +
      "\n" +
      message +
      "\n" +
      "#GDGAhmedabad #DevFestStories #DevFestIndia";
  launchURL(message);
}

launchURL(String shareText) async {
  var url = "https://twitter.com/intent/tweet?text=" +
      Uri.encodeQueryComponent(shareText);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
    // try to use simple share for the platform
  }
}
