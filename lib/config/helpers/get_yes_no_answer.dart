import 'package:dio/dio.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';
import 'package:yes_no_app_marco_4sa/infraestructure/models/yes_no_models.dart';

class GetYesNoAnswer {
  //Se crea instancia de la clase dio
  //Para majera las peticiones de HTTP
  final _dio = Dio();

//Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

//Almacenar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

//Devolver la instancia de "Message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
