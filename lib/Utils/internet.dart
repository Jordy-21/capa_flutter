

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



abstract class Internet {
  static final Map<String, String> headersCook = {'Accept': 'application/json'};
  static final Map<String, String> headersCookPut = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  ///Peticion por Post
  static Future httpPost(
      {required String url,
      required Map<String, dynamic> body,
      bool timeOut = false,
      required int seconds}) async {
    try {
      debugPrint("Service $url");
      final queryUrl = Uri.parse(url);
      debugPrint("Send $body to $url");
      final response = timeOut
          ? await http.post(queryUrl,
              body: body,
              headers: {"Accept": "*/*"}).timeout(Duration(seconds: seconds))
          : await http.post(queryUrl, body: body, headers: {"Accept": "*/*"});
      debugPrint("Response   ${response.statusCode} from $url");
      var decodedData = json.decode(response.body);
      debugPrint("Response   $decodedData from $url");
      return decodedData;
    } on TimeoutException catch (e) {
      var exep = {
        'valor': false,
        'Message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
      debugPrint("Response exeption  ${exep} from $url");
      return exep;
    } catch (e) {
      var exep = {
        'valor': false,
        'Message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e.toString()
      };
      debugPrint("Response exeption  ${exep} from $url");
      return exep;
    }
  }

  ///Peticion tipo Get
  static Future httpGet({required String url, required String body}) async {
    try {
      debugPrint("Service $url");
      final queryUrl = '${Uri.encodeFull(url)}$body?overview=false';
      debugPrint("Send $body to $url");
      final response = await http.get(Uri.parse(queryUrl));
      debugPrint("Response   ${response.statusCode} from $url");
      var decodedData = json.decode(response.body);
      debugPrint("Response   ${decodedData} from $url");
      return decodedData;
    } on TimeoutException catch (e) {
      var exep = {
        'valor': false,
        'Message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
      debugPrint("Response exeption  ${exep} from $url");
      return exep;
    } catch (e) {
      var exep = {
        'valor': false,
        'Message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e
      };
      debugPrint("Response exeption  ${exep} from $url");
      return exep;
    }
  }
}
