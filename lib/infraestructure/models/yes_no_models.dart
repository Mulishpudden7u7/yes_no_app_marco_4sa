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

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

//ternario
  Message toMenssageEntity() => Message(
      text: answer == "yes"
          ? "Sí"
          : answer == "no"
              ? "No"
              : "Quizas",
      fromWho: FromWho.hers,
      imageUrl: image);
}
