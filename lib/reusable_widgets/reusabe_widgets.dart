import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField ReusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    // cursorColor: Colors.white,
    style: TextStyle(color: Colors.black87.withOpacity(0.9)),
    decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Colors.black87,
        ),
        hintText:text,
        
        
       // labelText: text,
        labelStyle: TextStyle(color: Colors.red.withOpacity(0.9),fontSize: 10),
        // filled: true,
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(30.0),
            
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInsignUpButton(
    BuildContext context,Color clr, bool islogin, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      child: Text(islogin? 'Sign in':'Sign up',
      style: const TextStyle(
        color: Colors.black,
        fontWeight:FontWeight.bold,
        fontSize: 16),

      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.pressed))
        {
         return Colors.black;
        }
        else
        return clr;
        }
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
    ),
    ),
  );
}
