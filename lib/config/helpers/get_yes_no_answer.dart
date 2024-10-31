import 'package:dio/dio.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  //se crea una intancia de la clase Dio
  //para mejorar las peticiones HTTP
  final _dio = Dio();
  //obtener las respuesta
  Future<Message> getAnswer() async {
    //almacenar la peticion en una variable
    final response = await _dio.get("https://yesno.wtf/api");
    //generar el error
    throw UnimplementedError();
  }
}
