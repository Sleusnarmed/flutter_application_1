enum FromWho { me, hers }

//Identidad Atómica
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //final SentTime sentTime; //Para poner el tiempo de enviado

  Message({required this.text, this.imageUrl, required this.fromWho});
}
