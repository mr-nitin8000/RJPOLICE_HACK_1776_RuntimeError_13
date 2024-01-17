import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            image:DecorationImage
              (
                opacity: 0.6,
                image: AssetImage("assets/aboutbg.jpg"),
                fit:BoxFit.cover
            ),

          ),
          child:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: [
                Center(
                  child: Container(

                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x41FFFFFF),
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/kv.png", height: 200,),
                        Padding(
                          padding: EdgeInsets.only(top:30,left:10,right:10),
                          child: Center(

                            child: Text("WELCOME TO KAVACH",style: TextStyle(color: Color(
                                0xFFE3A60F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:10,top:20,right: 10),
                          child: Text(" Your trusted companion for women's safety and empowerment. "
                              "Our mission is to create a world where every woman feels safe, confident, and in control of her personal security."
                              " At Kavach, we believe that every woman deserves the right to live her life to the fullest without fear or hesitation.",
                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                            ,),
                        )

                      ],
                    ),
                  ),
                ),






                Center(
                  child: Container(

                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x41FFFFFF),
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/kv.png", height: 200,),

                        Padding(
                          padding: EdgeInsets.only(left:10,right:10,top:30),
                          child: Center(
                              child: Text("VISION",
                                style: TextStyle(
                                    color: Color(
                                        0xFFE3A60F),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20,left:10,right: 10),
                          child: Text("Our vision is simple yet profound: a world where every woman can move freely, without fear, and with the confidence that her safety is a top priority. We envision a society where women are empowered to live their lives to the fullest, unburdened by the constant worry of their safety.",
                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                            ,),
                        ),

                      ],
                    ),
                  ),
                ),





                Center(
                  child: Container(

                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x41FFFFFF),
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/kv.png",
                          height: 200,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:10,right:10,top:30),
                          child: Center(
                              child: Text("CONTENT",
                                style: TextStyle(
                                    color: Color(
                                        0xFFE3A60F),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20,left:10,right:10),
                          child: Text(" ●  Kavach App: Our cutting-edge mobile application is designed to be your digital guardian. With features like real-time location sharing, emergency alerts, and self-defense tutorials, the Kavach app is your one-stop solution for staying safe.\n\n"
                              " ●  Community Support: We believe that safety is a collective effort. Connect with a community of like-minded individuals who share your concerns and experiences. Share stories, tips, and advice to empower and support one another.\n\n"
                              " ●  Education: Knowledge is power. Access our comprehensive resources on personal safety, self-defense, and legal rights to equip yourself with the knowledge you need to stay safe.",
                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                            ,),
                        ),

                      ],
                    ),
                  ),
                ),




                Center(
                  child: Container(

                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x41FFFFFF),
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/kv.png",
                          height: 200,),
                        Padding(
                          padding: EdgeInsets.only(left:10,right:10,top:30),
                          child: Center(
                            child: Text("OUR TEAM",
                              style: TextStyle(color:Color(
                                  0xFFE3A60F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              )
                              ,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:30,left:10,right:10),
                          child: Center(
                            child: Text("NITIN KUMAWAT\n"
                                "NEHAL JAIN\n"
                                "NIDHI GARG",
                              // Color(0xECFF2781)
                              style: TextStyle(color:Color(0xFFA34DEC),
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                // fontFamily: "cursive"
                              )
                              ,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Text(
                              "  ♡ ThankYou for your love and support ♡",
                              style:TextStyle(color: Color(0xFFFFFFFF))
                          ),
                        )

                      ],
                    ),
                  ),
                ),

              ],
              //Slider Container properties
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 9 / 16,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 0.8,
              ),
            ),
          ),

        ),
      ),
    );
  }
}
