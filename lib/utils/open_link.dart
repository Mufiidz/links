
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'utils_export.dart';

class OpenLink {
  OpenLink._();

  static Future<void> withLink(dynamic to) async {
    if (to is String) {
      if (!await launchUrlString(to)) {
        log.d('Could not launch String $to');
      }
    } else if (to is Uri) {
      if (!await launchUrl(to)) {
        log.d('Could not launch Uri $to');
      }
    } else {
      log.d('Could not launch $to with String or Uri');
    }
  }
}
