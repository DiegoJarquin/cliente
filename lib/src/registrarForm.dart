import 'package:cliente/src/services/databaseFirebase.dart';
import 'package:flutter/material.dart';
import 'package:cliente/src/loginForm.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart';


class RegistrarForm extends StatefulWidget{
  RegistrarForm({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  RegistrarFormState createState() => RegistrarFormState();
}

class RegistrarFormState extends State<RegistrarForm>{

  final AuthServices auth = AuthServices();
  final keyForm = GlobalKey<FormState>();

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String usuario = '';
  String email = '';
  String pass = '';
  String error = '';


  //Segmento: boton de regreso
  Widget regresarBoton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Regresar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  //Segmento: titulo de la pagina
  Widget titulo() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'OFER',
          style: GoogleFonts.oswald(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Color(0xffd1d765),
          ),
          children: [
            TextSpan(
              text: 'PLUS',
              style: TextStyle(color: Color(0xff05668D), fontSize: 50),
            ),
          ]),
    );
  }

  //Segmento: text boxes y su estilo
  // Widget textBox(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: userController,
  //             obscureText: isPassword,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 fillColor: Color(0xffd9d9d9),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  //Segmento: ingreso de datos al form de registro

  Widget emailPassword() {
    final height = MediaQuery.of(context).size.height;
    return Form(
        key: keyForm,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Usuario",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (val) => val!.isEmpty ? 'Poner nombre de usuario' : null,
                      onChanged: (val) {
                        setState(() => usuario = val);
                      },

                      controller: userController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xffd9d9d9),
                          filled: true)),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                      validator: (val) => val!.isEmpty ? 'Poner un correo' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xffd9d9d9),
                          filled: true)),
                  Text(
                    "Contrase??a",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                      validator: (val) => val!.length < 8 ? 'La contrase??a tiene que contener 8 o m??s caracteres' : null,

                      onChanged: (val) {
                        setState(() => pass = val);
                      },
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xffd9d9d9),
                          filled: true)),
                  SizedBox(height: height * .10),
                  ElevatedButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff6D597A), Color(0xff355070)])),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      onPressed: () async {

                        if(keyForm.currentState!.validate()){
                          dynamic resultado = await auth.registrarUsuario(usuario, email, pass);
                          if(resultado == null){
                            setState(() => error = 'Utilizar un email v??lido');
                          }

                          print(usuario);
                          print(email);
                          print(pass);
                        }

                     }
                  ),
                ],
              ),
            ),
          ],
        ),

    );

  }

  //Segmento: boton de envio del form de registro
  // Widget registrarBoton() {
  //   return InkWell(
  //       onTap: () async {
  //         // if(keyForm.currentState.validate()){
  //         //
  //         // };
  //         usuario = userController.text;
  //         email = emailController.text;
  //         pass = passController.text;
  //         print(usuario);
  //         print(email);
  //         print(pass);
  //       },
  //   child: Container(
  //     width: MediaQuery.of(context).size.width,
  //     padding: EdgeInsets.symmetric(vertical: 15),
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(5)),
  //         gradient: LinearGradient(
  //             begin: Alignment.centerLeft,
  //             end: Alignment.centerRight,
  //             colors: [Color(0xff6D597A), Color(0xff355070)])),
  //     child: Text(
  //       'Registrarse',
  //       style: TextStyle(fontSize: 20, color: Colors.white),
  //     ),
  //   ),
  //
  //   );
  // }

  //Segmento: opcion para entrar a la pagina de login
  Widget loginFormBoton() {
    return InkWell(
      onTap: ()  {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginForm(title: '')));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ya tienes cuenta ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xff6D597A),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }


  //Construccion de la clase
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    titulo(),
                    SizedBox(
                      height: 50,
                    ),
                    emailPassword(),
                    SizedBox(
                      height: 20,
                    ),
                    // registrarBoton(),
                    // SizedBox(height: height * .14),
                    loginFormBoton(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: regresarBoton()),
          ],
        ),
      ),
    );
  }



}