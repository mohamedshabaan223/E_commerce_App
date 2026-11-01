import 'package:flutter/material.dart';
import 'package:nti5/onboarding3.dart';

void main() {runApp( Onboarding2());}

class Onboarding2 extends StatefulWidget{
  const Onboarding2({super.key});
  @override
  State<Onboarding2> createState() => _MyAppState();
}
class  _MyAppState extends State<Onboarding2> {
     Widget buildDots(int activePageIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = index == (activePageIndex - 1);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: isActive ? 20 : 6, 
          decoration: BoxDecoration(
            color: isActive
                ? const Color.fromARGB(255, 182, 161, 122)
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
        backgroundColor: Colors.black,     
        body:SafeArea(child:
        SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Color.fromARGB(255, 182, 161, 122),
                    ),
                    SizedBox(width: 6,),
                    Text("LUXE",
                    style: TextStyle(color: Color.fromARGB(255, 182, 161, 122))
                    ),
                    Spacer(),
                    TextButton(onPressed: (){
                      
                    },
                     child: Text("skip",
                     style: TextStyle(color: Colors.white),)
                     )

                  ],
                ),
                 SizedBox(height: 10,),
                Image.network("images/Hero Artifact Showcase(1).png",
                width: 600,
                height: 400,
                fit:BoxFit.cover),
                SizedBox(height: 14,),
                Text("Exclusive Offers",
                style: TextStyle(color: Colors.white,fontSize: 20),),

                 Text("Grab daily deals and discounts",
                style: TextStyle(color: Color.fromARGB(255, 170, 165, 157),fontSize: 13),),
                  const SizedBox(height: 15),

                  buildDots(2),

                  const SizedBox(height: 15),


                MaterialButton(
                  color: Color.fromARGB(255, 182, 161, 122),
                  textColor: Color.fromARGB(255, 60, 46, 17),
                  minWidth: double.infinity,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Onboarding2()));
                  },

                child: Text("Next"),)



              ],
            ),
            )



        )
        ),
      )
       );
    }
  }