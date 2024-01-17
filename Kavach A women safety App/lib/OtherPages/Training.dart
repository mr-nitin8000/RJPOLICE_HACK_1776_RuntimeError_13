import 'package:flutter/material.dart';
class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return SelfTraining();
  }
}
class SelfTraining extends StatefulWidget {
  const SelfTraining({super.key});

  @override
  State<SelfTraining> createState() => _SelfTrainingState();
}

class _SelfTrainingState extends State<SelfTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xFFEECFEE),
            body:
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:30,left:10,right:10),
                    child: Container(
                      height:500,
                      width:500,

                      decoration: BoxDecoration(
                          color: Color(0xF21D1DC9),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(6.0, 6.0))
                          ],
                          borderRadius:  BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0))

                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, 4.0))
                              ],
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/Training/self1.jpg"),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top:20,right:40),
                              child: Text("Self Defence : AATMA SURAKSHA HAI JRURI",style: TextStyle(color: Colors.white,
                                  fontSize: 15,fontWeight: FontWeight.bold ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top:10),
                            child: Text(" ~ Dedicated To All The Womens",style: TextStyle(color:Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top:20,left:10),
                              child: Text("Self Defence is the act of defending oneself, "
                                  "one's property or someone else from physical harm. "
                                  "Self Defence has an important role in the life of women. "
                                  "Self Defence is a skill which every woman should acquire to make their own and others live safer on a daily basis or whenever the situation requires.",
                                style:TextStyle(color:Colors.white) ,))


                        ],
                      ),

                    ),
                  ),



                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 150,
                              width:150,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 2.0,
                                      offset: Offset(5.0, 5.0))
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top:10,left:10),
                                child: Text("Major Points\n"
                                    "⇥ Domestic Violence\n"
                                    "⇥ Rape\n"
                                    "⇥ Insult\n"
                                    "⇥ Discrimination\n"
                                    "⇥ Sexual Assaults\n"
                                    "⇥ Torture"
                                  ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(height: 50,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                              height: 200,
                              width:215,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0,
                                        offset: Offset(5.0, 5.0))
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/Training/self2.jpg")
                                  )
                              )

                          ),
                        ),

                      ],
                    ),
                  ),



                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(top:0,bottom:20),
                              child: Container(
                                height: 170,
                                width:200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset(5.0, 5.0))
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage("assets/Training/no.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),

                              ),
                            ),
                            SizedBox(height: 0,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                            height: 150,
                            width:150,
                            decoration: BoxDecoration(
                              color: Color(0xEC460386),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purple,
                                    blurRadius: 2.0,
                                    offset: Offset(3.0, 3.0))
                              ],

                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left:10),
                                child: Text("✕  NO MEANS NO\n\n"
                                    "✕  MAY BE MEANS NO\n\n"
                                    "✕  SOMETIMES YES ALSO MEAN NO"
                                  ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),


                          ),
                        ),

                      ],
                    ),
                  ),




                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height:205,
                      width: 310,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87,
                                blurRadius: 2.0,
                                offset: Offset(5.0,5.0)
                            )
                          ],
                          borderRadius:  BorderRadius.only(topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0))
                      ),

                      child: Column(
                        children: [
                          Container(
                            height:200,
                            width:300,
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 2.0,
                                  offset: Offset(4.0,4.0),
                                ),

                              ],


                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/Training/n.jpg"),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Container(
                      height:450,
                      width: 360,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),

                          image: DecorationImage(
                              image: AssetImage("assets/Training/w.png"),
                              fit: BoxFit.cover

                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xEC460386),
                                blurRadius: 1.0,
                                offset: Offset(6.0,6.0)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top:350,left:10),
                        child: Text("DON'T STOP UNTIL YOU REACH YOUR DESTINATION",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        ),),
                      ),
                    ),
                  ),




                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 150,
                              width:150,
                              decoration: BoxDecoration(
                                color: Color(0xFF052D3A),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.cyan,
                                      blurRadius: 2.0,
                                      offset: Offset(4.0, 4.0))
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top:20,left:10),
                                child: Text("“ Self defense is not just a set of techniques,"
                                    " it's a state of mind that begins with the belief that you are worth defending ”"
                                  ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(height: 50,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                              height: 200,
                              width:215,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0,
                                        offset: Offset(5.0, 5.0))
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/Training/m.jpg")
                                  )
                              )

                          ),
                        ),

                      ],
                    ),
                  ),





                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(top:0,bottom:20),
                              child: Container(
                                height: 170,
                                width:200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset(5.0, 5.0))
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage("assets/Training/o.png"),
                                      fit: BoxFit.cover,
                                    )
                                ),

                              ),
                            ),
                            SizedBox(height: 0,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                            height: 150,
                            width:150,
                            decoration: BoxDecoration(
                              color: Color(0xFF62D70B),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xF20C0C65),
                                    blurRadius: 2.0,
                                    offset: Offset(3.0, 3.0))
                              ],

                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left:10),
                                child: Text(" ' Think and Implement Being girl is not the Curse ' "
                                  ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                      fontSize: 20),),
                              ),
                            ),


                          ),
                        ),

                      ],
                    ),
                  ),







                  Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 150,
                              width:150,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 2.0,
                                      offset: Offset(5.0, 5.0))
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top:10,left:10),
                                child: Text( " There’s Only One Basic Principle Of Self-Defense. "
                                    "You Must Apply The Most Effective Weapon, As Soon As Possible,"
                                    " To The Most Vulnerable Target."
                                  ,style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(height: 50,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                              height: 200,
                              width:215,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0,
                                        offset: Offset(5.0, 5.0))
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/Training/f.jpg"),
                                      fit:BoxFit.cover
                                  )
                              )

                          ),
                        ),

                      ],
                    ),
                  ),




                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Container(
                      height:450,
                      width: 360,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),

                          image: DecorationImage(
                              image: AssetImage("assets/Training/t.jpg"),
                              fit: BoxFit.cover

                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xF2ECEC12),
                                blurRadius: 1.0,
                                offset: Offset(6.0,6.0)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top:370,left:10),
                        child: Center(
                          child: Text("KAR  HAR  MAIDAN  FATEH",style: TextStyle(
                            color: Colors.yellow,
                            fontSize:25,
                            fontWeight: FontWeight.bold,

                          ),),
                        ),
                      ),
                    ),
                  ),





                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(top:0,bottom:20),
                              child: Container(
                                height: 170,
                                width:200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset(5.0, 5.0))
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage("assets/Training/h.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),

                              ),
                            ),
                            SizedBox(height: 0,)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Container(
                            height: 150,
                            width:150,
                            decoration: BoxDecoration(
                                color: Color(0xFF62D70B),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xEC460386),
                                      blurRadius: 2.0,
                                      offset: Offset(4.0, 4.0))
                                ],
                                image: DecorationImage(
                                    image:AssetImage("assets/Training/g.jpg"),
                                    fit: BoxFit.cover
                                )

                            ),



                          ),
                        ),

                      ],
                    ),
                  ),





                ],
              ),
            )
        );
  }
}
