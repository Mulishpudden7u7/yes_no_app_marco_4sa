import 'package:dio/dio.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';
import 'package:yes_no_app_marco_4sa/infraestructure/models/yes_no_models.dart';

class GetYesNoAnswer {
  //se crea una intancia de la clase Dio
  //para mejorar las peticiones HTTP
  final _dio = Dio();
  //obtener las respuesta
  Future<Message> getAnswer() async {
    //almacenar la peticion en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    //almacenar la data de la respuesta de una variable

    final yesNoModel = YesNoModel.fromJson(response.data);

    //devolver la instancia de Message creada en el modelo

    return yesNoModel.toMenssageEntity();
  }
}
