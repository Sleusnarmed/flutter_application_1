import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infraestructure/yes_no_model.dart';


class GetYesNoAnswer {

  //Instancia de la clase Dio para manejar peticiones HTTP
  final dio = Dio();

  Future<Message> getAnswer() async{
    //Almacenar el resultado de la petición
    final response = await dio.get('https://yesno.wtf/api');
    
    //Almacenar los datos de la respuesta
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Retornar la instancia de Messa
    return yesNoModel.toMessageEntity();

  }

}