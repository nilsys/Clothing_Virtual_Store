import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_three/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(

              child: Text(
                "CRIAR CONTA",
                style: TextStyle(
                  fontSize: 15.0
                ),
              ),
            textColor: Colors.white,

            onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>SignUpScreen())
                );
            },
          )
        ],
      ),
      body: Form(//valida campos
          key: _formKey,
          child: ListView(//bom usar listView pq pode ser que algo importante seja coberto pelo teclado
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                 TextFormField(
                   decoration: InputDecoration(
                     hintText: "Email"
                   ),
                   keyboardType: TextInputType.emailAddress,//já aparece o @ no teclado
                   validator: (text){
                     if(text.isEmpty || !text.contains("@")){
                       return "Email Invalido";
                     }
                   },
                 ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Senha"
                  ),
                  obscureText: true,//pra não ver a senha
                  validator: (text){
                    if(text.isEmpty || text.length<6){
                      return "Senha inválida";
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: (){},
                      child: Text("Esqueci minha senha",
                      textAlign: TextAlign.right,),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text("Entrar",
                      style: TextStyle(
                          fontSize: 18.0
                      ),

                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                        if(_formKey.currentState.validate()){

                        }
                    },
                  ),
                ),
              ],
          ),
      ),
    );
  }
}