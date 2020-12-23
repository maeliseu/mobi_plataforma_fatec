import 'package:url_launcher/url_launcher.dart';

class CategoriasService {
  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Falha ao abrir url: $url';
    }
  }
}
