
//DICHIARO LE VARIABILI (nome,cognome..) CHE SARANNO INIZIALIZZATE SUCCESSIVAMENTE (grazie a late).
class datiCliente{
  late String nome;
  late String cognome;
  late String dataNascita;
  late String cf;
  late String telefono;
  late String email;
  late String via;
  late String cap;
  late String citta;
  late String provincia;
  late String registrazione;
  late String note;
  final int id; //final: l'ID non deve cambiare mai una volta associato al cliente

//COSTRUTTORE DELLA CLASSE.
datiCliente({
  required this.nome,
  required this.cognome,
  required this.dataNascita,
  required this.cf,
  required this.telefono,
  required this.email,
  required this.via,
  required this.cap,
  required this.citta,
  required this.provincia,
  required this.registrazione,
  required this.note,
  required this.id,});

   //Serve per salvare i dati in modo permanente (se chiudi l'app non si cancellano).
  Map<String, dynamic> toJson() => {
        "nome": nome,
        "cognome": cognome,
        "dataNascita": dataNascita,
        "cf": cf,
        "telefono": telefono,
        "email": email,
        "via": via,
        "cap": cap,
        "citta": citta,
        "provincia": provincia,
        "registrazione": registrazione,
        "note": note,
        "id":id,
      };

  //Serve per ricaricare i dati (factory e un costruttore "speciale").
  factory datiCliente.fromJson(Map<String, dynamic> json) => datiCliente(
        nome: json["nome"],
        cognome: json["cognome"],
        dataNascita: json["dataNascita"],
        cf: json["cf"],
        telefono: json["telefono"],
        email: json["email"],
        via: json["via"],
        cap: json["cap"],
        citta: json["citta"],
        provincia: json["provincia"],
        registrazione: json["registrazione"],
        note: json["note"],
        id: json["id"],
      );
}