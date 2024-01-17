import 'package:flutter/material.dart';
import 'package:proui/ColorApp.dart';
class Awarezone extends StatefulWidget {
  const Awarezone({super.key});

  @override
  State<Awarezone> createState() => _AwarezoneState();
}

class _AwarezoneState extends State<Awarezone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("Awarezone",
        style: TextStyle(
          color: canvasColor
        ),
        ),
      ),
      backgroundColor: Color(0xFFD58FE5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: [
            SizedBox(height:40,width: 1000,),
            Container(
              //padding: EdgeInsets.only(left: 10,right: 10),
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      //SizedBox(width:10,),
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 370,

                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:20,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            SizedBox(height: 20,),
                            Image.asset('assets/Awarezone/img_12.png',width: 300,height: 150,),
                            SizedBox(height: 20,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("We're not just women, we're people too.",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            // SizedBox(height: 10,),
                            //Text("Women have the right to work, vote, and live.",style: TextStyle(color: Colors.white,fontSize:20),),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("Feminism is about equal rights for women.",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 10,right: 10),
                              child:Text("Don’t hit me; I am not your property.",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            // SizedBox(height: 10,),
                            // Text("Nature is not a place to visit, it is home."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 20,),
                            // Row(
                            //   children: [
                            //     SizedBox(width: 100,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            //     SizedBox(width: 20,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),



            SizedBox(height: 20,),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            Container(
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      // SizedBox(height:30,),
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 350,
                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:40,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),


                            SizedBox(height: 20),
                            Image.asset('assets/Awarezone/img_8.png',width: 500,height:150,),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 10),
                              child:  Text("Feminists respect individual, informed choices and believe there shouldn't be a double standard in judging a person. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 10),
                              child:Text(" Women and men are far from playing on the same field.",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            // // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // SizedBox(height: 10,),
                            // Row(
                            //   children:[
                            //     SizedBox(width: 100,),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // SizedBox(width: 20,),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            //   ],
                            //   ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            // ),

            SizedBox(height:10),
            Container(
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      //  SizedBox(width:10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 350,
                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:20,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            SizedBox(height: 20,),
                            Image.asset('assets/Awarezone/img_9.png',height: 150,),
                            SizedBox(height: 10,),
                            Text("Equality in decision making ",style: TextStyle(color: Colors.white,fontSize:20),),
                            SizedBox(height: 10,),
                            Padding(
                              padding:EdgeInsets.only(left: 10,right: 25),
                              child:Text("Equal access to education",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 60),
                              child: Text("Equality in economic and social freedom  ",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            //SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // SizedBox(height: 10,),
                            // Text("Nature is not a place to visit, it is home."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            //SizedBox(height: 20,),
                            //   Row(
                            //     children:[
                            //       SizedBox(width: 100,),
                            //   ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            //       SizedBox(width: 20,),
                            //   ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            // ],
                            //   ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),


            SizedBox(height:20,width: 1000,),
            Container(
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      //SizedBox(width:10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 350,
                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:20,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            SizedBox(height: 20),
                            Image.asset('assets/Awarezone/img_3.png',width: 300,height: 150,),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("They'll tell you you're too loud,that you need to wait your turn and ask the right people for permission. Do it anyway",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("There is no limit to what we, as women, can accomplish.",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            //SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // //SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // SizedBox(height: 10,),
                            // Text("Nature is not a place to visit, it is home."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            //SizedBox(height: 20,),
                            // Row(
                            //   children: [
                            //     SizedBox(width: 100,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            //     SizedBox(width: 20,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            //   ],
                            //)
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),

            SizedBox(height:20,width: 1000,),
            Container(
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      //SizedBox(width:10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 350,
                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:30,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            SizedBox(height: 20),
                            Image.asset('assets/Awarezone/img_11.png',width: 300,height: 150,),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("They have the right to live free from violence and discrimination",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:Text("To enjoy the highest attainable standard of physical and mental health",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            //SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // //SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. ",style: TextStyle(color: Colors.white,fontSize:20),),
                            // SizedBox(height: 10,),
                            // Text("Nature is not a place to visit, it is home."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 20,),
                            // Row(
                            //   children: [
                            //     SizedBox(width: 100,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            //     SizedBox(width: 20,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),




            SizedBox(height:20,width: 1000,),
            Container(
              height:380,
              width:390,
              child:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Row(
                    children: [
                      //SizedBox(width:10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 350,
                        width: 390,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow:[
                            BoxShadow(
                                blurRadius:20,
                                color: Colors.pink
                            ),
                          ],
                          color:Colors.black,
                        ),
                        child: Column(
                          children: [
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            // ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //   backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            SizedBox(height: 10),
                            Image.asset('assets/Awarezone/img_2.png',width: 300,height: 150,),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 10,right: 80),
                              child:Text("Right to work",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 10,right: 30),
                              child:Text("Right to Livelihood",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 40),
                              child:Text("Right against Exploitation",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            SizedBox(height: 10,),
                            Padding(padding: EdgeInsets.only(left: 90),
                              child:Text("Right to Life and Personal Liberty ",style: TextStyle(color: Colors.white,fontSize:20),),
                            ),
                            // SizedBox(height: 10,),
                            // Text("Nature is not a place to visit, it is home."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 10,),
                            // Text("Adopt the pace of nature. Her secret is patience."),
                            // SizedBox(height: 20,),
                            // Row(
                            //   children: [
                            //     SizedBox(width: 100,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.purple),),),
                            //     SizedBox(width: 20,),
                            //     ElevatedButton(onPressed: (){},child: Text("button"),style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.blue),),),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),


          ],
        ),
      ),
    );
  }
}

