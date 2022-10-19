import 'package:flutter_authentication/firstpage.dart';
import 'package:flutter/material.dart';


class textpage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: Container(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1556649102-18d00a0d314f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzB8fG9jZWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
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
                  Text(
                    "The fastest and easiest solution to know your catch!! \n Welcome to Matsyastra.\n Here, you can simply take a picture of your fish with your phone’s camera or upload it  in the app..\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
   
                ],
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => first()));
                    },
                    color: Color.fromARGB(1,229,189,160),
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Jump In, folks!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.black),
                    ),
                  ),
                 
                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
}