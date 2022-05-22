//implement edeceğimiz adresileri yazyoruz
import 'dart:async'; 
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
enum NFCStatus { //nfc durumu için statu yapısını kuruyoruz
  none,
  reading,
  read,
  stopped,
  error,
}
class NfcData { //nfc verilerinin alımı için veri enum yapısını kuruyoruz.
  final String id;
  final String content;
  final String error;
  final String statusMapper;
  NFCStatus status = NFCStatus.none; //nfc statutusünü belirliyoruz.
  NfcData({ //nfc verilerinin atamalarını yapıyoruz.
    this.id,
    this.content,
    this.error,
    this.statusMapper,
  });
  factory NfcData.fromMap(Map data) { //nfc kitinin veri tiplerinin adlandırmasını yapıyoruz.
    NfcData result = NfcData(
      id: data['nfcId'],
      content: data['nfcContent'],
      error: data['nfcError'],
      statusMapper: data['nfcStatus'],
    );
    switch (result.statusMapper) { //nfc durumuna göre caselerde kontrol yapıp nfc kitinin durumunu güncelliyoruz.
      case 'none':
        result.status = NFCStatus.none; //nfc durumu olmadığı zaman
        break;
      case 'reading':
        result.status = NFCStatus.reading;// nfc okuma durumu
        break;
      case 'stopped':
        result.status = NFCStatus.stopped;//nfc durma durumu
        break;
      case 'error':
        result.status = NFCStatus.error;//nfc hata durumu
        break;
      default:
        result.status = NFCStatus.none;// default olarak yok durumu.
    }
    return result; // durumu döndürüyoruz
  }
}
class FlutterNfcReader {// nfc okuma yapmak için reader sınıfını kuruyoruz.
  static const MethodChannel _channel =
      const MethodChannel('flutter_nfc_reader'); // bir method kuruyoruz 
  static const stream =
      const EventChannel('it.matteocrippa.flutternfcreader.flutter_nfc_reader'); //okuma yapabilmek için flutter pluginlerden bir packes alıyoruz.

  static Future<NfcData> enableReaderMode() async {// nfc okuma yaparken veri okumasını etkinleştiriyoruz.
    final Map data = await _channel.invokeMethod('NfcEnableReaderMode');
    final NfcData result = NfcData.fromMap(data);

    return result; //durumu döndürüyoruz.
  }
  static Future<NfcData> disableReaderMode() async { // nfc okuma yaparken veri okumasını engelliyoruz.
    final Map data = await _channel.invokeMethod('NfcDisableReaderMode');
    final NfcData result = NfcData.fromMap(data);

    return result; //durumu döndürüyoruz.
  }

  static Future<void> stop() => _channel.invokeMethod('NfcStop'); // nfc okuma yaparken veri okumasını durduruyoruz.

  static Future<NfcData> read({String instruction}) async {
    final Map data = await _callRead(instruction: instruction);
    final NfcData result = NfcData.fromMap(data);
    return result; //durumu döndürüyoruz.
  }

  static Stream<NfcData> onTagDiscovered({String instruction}) {  // nfc okuma yaparken veri tespit edildiği zaman.
    if (Platform.isIOS) {
      _callRead(instruction: instruction);// talimata göre okuma yapıyoruz.
    }
    return stream.receiveBroadcastStream().map((rawNfcData) {
      return NfcData.fromMap(rawNfcData);// veriyi döndürüyoruz.
    });
  }

  static Future<Map> _callRead({instruction: String}) async {// okumayı çağırmak için tanımdığımız future
    return await _channel
        .invokeMethod('NfcRead', <String, dynamic>{"instruction": instruction});// duruma göre talimatı döndürüyoruz.
  }

  static Future<NfcData> write(String path, String label) async {// nfc yazmak için tanımladığımız future
    final Map data = await _channel.invokeMethod(// veri yazmak için yolu ve mesajı alıyoruz.
        'NfcWrite', <String, dynamic>{'label': label, 'path': path});

    final NfcData result = NfcData.fromMap(data);

    return result; // durumu döndürüyoruz.
  }

  static Future<NFCAvailability> checkNFCAvailability() async { //nfc kullanılabilirliği için yazdığımız future
    var availability =
        "NFCAvailability.${await _channel.invokeMethod<String>("NfcAvailable")}";
    return NFCAvailability.values
        .firstWhere((item) => item.toString() == availability);
  }
}

enum NFCAvailability { available, disabled, not_supported }// kullanılabilirlik için atama yapıyoruz.
