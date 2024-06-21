import 'package:persikota/core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchWhatsAppOrder() async {
  final String message = AccountDatabase.email == null
      ? "Halo, saya ingin melakukan pemesanan."
      : "Halo, saya ingin melakukan pemesanan. by ${AccountDatabase.email}";
  const String phoneNumber =
      "6285156088846"; // Ganti dengan nomor WhatsApp target
  final String url =
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

  try {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print("Error: $e");
    // Handle if WhatsApp cannot be launched
    bool isBrowserOpened = await launchInBrowser(url);
    if (!isBrowserOpened) {
      showErrorDialog('Gagal',
          'Gagal membuka WhatsApp. Silakan coba lagi atau gunakan browser lain.');
    }
  }
}

Future<bool> launchInBrowser(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    return true;
  } else {
    return false;
  }
}
