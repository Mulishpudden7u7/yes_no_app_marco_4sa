//el modelo define los datos que debe
//tener la aplicacion
//vista:pantalla, controlador:logica
//MVC: modelo=informacion
//vista: lo que vemos

import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
        text: answer == 'yes'
            ? 'si'
            : answer == 'no'
                ? 'No'
                : 'Quizas',
        fromWho: FromWho.hers,
        //Sera el gif
        imagenUrl: image, //Esto usara la URL de la imagen
        timestamp: DateTime.now(), //Agrega la hora actual para el timestamp
      );
}
