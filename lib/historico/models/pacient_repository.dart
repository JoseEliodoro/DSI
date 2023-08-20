/* import 'dart:convert';
import 'dart:typed_data';

import 'pacient.dart';

import 'package:http/http.dart' as http;

class Predicts {
  late String id;
  late List<Predict> tabela = [];
  late List previsoes;
  bool isLoading = true;

  Predicts({required id}) {
    fetch(id);
  }

  Future fetch(var id) async {
    String url =
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$id/.json';
    var response = await http.get(Uri.parse(url));
    previsoes = await json.decode(response.body)['predicts'].values.toList();
    for (int x = 0; x < previsoes.length; x++) {
      tabela.add(Predict.fromJson(previsoes[x]));
    }
  }
}
 */