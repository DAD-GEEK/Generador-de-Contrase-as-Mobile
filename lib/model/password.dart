import 'dart:math';
//class password
class Password {
  int size;
  bool option_mayus;
  bool option_minus;
  bool option_number;
  bool option_simbol;
  String mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String minusculas = "abcdefghijklmnopqrstuvwxyz";
  String numeros = "0123456789";
  String simbolos = "!@#%^&*()";
  Password({
    required this.size,
    required this.option_mayus,
    required this.option_minus,
    required this.option_number,
    required this.option_simbol,
  });
}

String? createpassword(Password password){
  String randomChars = "";
  var r = Random();
  if(password.option_mayus){
     randomChars+= password.mayusculas;
  }
  if(password.option_minus){
     randomChars+= password.minusculas;
  }
  if(password.option_number){
     randomChars+= password.numeros;
  }
  if(password.option_simbol){
     randomChars+= password.simbolos;
  }
  return List.generate(password.size, (index) => randomChars[r.nextInt(randomChars.length)]).join();
}