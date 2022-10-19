import 'dart:ui';

import 'package:flutter_authentication/text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/firstpage.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      body: Container(
        child: Container(

            // we will give media query height
            // double.infinity make it big as my parent allows
            // while MediaQuery make it big as per the screen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1584794171574-fe3f84b43838?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG9jZWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              // even space distribution
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    
                    Container(
                      child: Image.network("https://res.cloudinary.com/dcsi333w7/image/upload/v1661266353/samples/sih/5_INCOIS-removebg-preview_udkqad.png"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.network("https://res.cloudinary.com/dcsi333w7/image/upload/v1661252315/samples/sih/matsyastra-removebg-preview_nlkfmt.png"),
                    ),
                    
                  ],
                ),
                
                Column(children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: 400,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => textpage()));
                    },
                    // defining the shape
                    color: Color.fromARGB(255, 97, 183, 245),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Get Started",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ])
              ],
            )),
      ),
    );
  }
}
