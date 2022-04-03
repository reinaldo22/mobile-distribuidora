import 'dart:convert';
import 'dart:io';

import 'package:distribuidora/model/customer/customer.dart';
import 'package:distribuidora/services/api_response.dart';
import 'package:http/http.dart' as http;

class CustomerApi {
  static Future<ApiResponse> register(Customer data) async {
    try {
      var url = 'http://{{local}}:3333/customer';

      var response = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(
          data.toJson(),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = jsonDecode(response.body);

        Customer customer = Customer.fromMap(mapResponse as dynamic);
        print("Novo cliente: ${customer}");

        return ApiResponse.ok();
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error(msg: "Não foi possível salvar o cliente");
      }

      Map mapResponse = jsonDecode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      ApiResponse.error(msg: "Não foi possível salvar o carro");
    }

    return ApiResponse.ok();
  }
}
