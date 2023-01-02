
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';


void main(){
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Task'),
        ),
        
        body: Container(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  showAlertDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.orange,
                  width: 1
                )
              ),
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("A Wing",),
                          Text("Nallasopara West"),
                          Text("Maharashtra")
                        ],
                      ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Visitor No. 11",),
                          Text("2022-05-21 12:18:56"),
                          Text("Guest")
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        
                        child: Image.network("https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                        fit: BoxFit.cover,),
                        
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                        
                      //   // children: [
                      //   //   margin : EdgeInsets.all(25),
                      //   //   child : FlatButton( 
                      //   //      child: Text("Delete"),
                      //   //      Color : Colors.Colors.black,
                      //   //      textColor : Colores.White,
                      //   //      onPressed : (){}
                      //   //     ),
                      //   //           ],
                      // ),
                      TextButton.icon(onPressed: (){}, icon: Icon(Icons.add , size : 18), label: Text("Delete"))
                    ],
                  ),
                  
                ),
              );
            },
          ),
        )

      ),
    );
  }

  showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = FlatButton(  
    child: Text("OK"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  

  // Create button  
  Widget insertBtn = FlatButton(  
    child: Text("Insert"),  
    onPressed: () {  
    
    },  
  ); 
  

  Widget delBtn = FlatButton(
    child: Text("Delete"),
    onPressed: (){

  },
   );
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Hello! You can Edit"),  
    content: Text("Click On Edit Button to Edit this Data"),  
    actions: [  
      okButton, 
      insertBtn ,
      delBtn

    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
  }
}
// class Address{
//   String addLine1;
//   String addLine2;
//   String addLine3;

//   Address({ 
//     required this.addLine1 , 
//     required this.addLine2 , 
//     required this.addLine3  
//     });

//   // Map<String, dynamic?> toJson() {

    // "addLine1" : addLine1; 
    // "addLine2" : addLine2; 
    // "addLine3" : addLine3

//   }

// Future<Address> fromJson(json) async {
//   return Address (
//     addLine1: json['addLine1'] ,
//     addLine2: json['addLine2'] ,
//     addLine3: json['addLine3']
//   );

// }
// Future<Map<String, dynamic>> toJson() async {
//   var addLine1;
//   var addLine2;
//   var addLine3;
//   return{'addLine1' : addLine1 , 'addLine2' : addLine2 , 'addLine3' : addLine3};

// }