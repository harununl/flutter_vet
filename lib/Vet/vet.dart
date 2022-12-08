import 'package:flutter/material.dart';

class vetPage extends StatefulWidget{
  const vetPage({Key? key}): super(key:key);

  @override
  State<vetPage> createState()=>_vetPageState();
}

class _vetPageState extends State<vetPage> {





  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,

                padding: EdgeInsets.only( top: 0, ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),

                  )

                ),

                child:Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                    ),


                    Image(image: AssetImage('Images/login3.jpg')),
                    SizedBox(height: 10,),
                    TabBar(
                      indicatorWeight: 5,

                      indicatorColor: Colors.grey,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(

                          text:"Login",

                        ),
                        Tab(
                          text:"Sign-up",

                        ),
                      ],
                    )
                  ],
                ),
              ),


                Container(
                  height: 415,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TabBarView(

                      children:<Widget>[
                        Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),

                              ),
                              onChanged: (String value){

                              },
                              validator:(value){
                                return value!.isEmpty? 'Please enter email'

                                    : null;
                              },

                            ),
                            SizedBox(height: 20,),

                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),

                              ),
                              onChanged: (String value){

                              },
                              validator:(value){
                                return value!.isEmpty? 'Please enter password'

                                    : null;
                              },

                            ),
                            SizedBox(height: 40,),

                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient:const LinearGradient(colors: [Colors.blueGrey,Colors.grey]),
                              ),
                              child: MaterialButton(onPressed: (){},
                                child: Text('Login ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white

                                  ),
                                ),),
                            ),
                            SizedBox(height: 45,),

                            Container(alignment: Alignment.center,
                                child: Text('- OR -',style: TextStyle(color:Colors.grey.shade700, fontSize: 15 , ),)),
                            SizedBox(height: 25,),

                            Container(alignment: Alignment.center,
                                child: Text('Login with',style: TextStyle(color:Colors.grey.shade700, fontSize: 13 ),)),


                            SizedBox(height: 6,),
                            Container(


                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(

                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow:[
                                  BoxShadow(color: Colors.black26,
                                    offset: Offset(0,2),
                                    blurRadius: 6.0,)
                                ],
                                image: DecorationImage(image: AssetImage('Images/google.png')
                                ),


                              ),



                            ),
                          ],
                        ),



                        Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Enter username',
                                prefixIcon: Icon(Icons.supervised_user_circle),
                                border: OutlineInputBorder(),

                              ),
                              onChanged: (String value){

                              },
                              validator:(value){
                                return value!.isEmpty? 'Please enter username'

                                    : null;
                              },

                            ),
                            SizedBox(height: 15,),

                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),

                              ),
                              onChanged: (String value){

                              },
                              validator:(value){
                                return value!.isEmpty? 'Please enter email'

                                    : null;
                              },

                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),

                              ),
                              onChanged: (String value){

                              },
                              validator:(value){
                                return value!.isEmpty? 'Please enter password'

                                    : null;
                              },

                            ),

                            SizedBox(height: 15,),

                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient:const LinearGradient(colors: [Colors.blueGrey,Colors.grey]),
                              ),
                              child: MaterialButton(onPressed: (){},
                                child: Text('Sign Up ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white

                                  ),
                                ),),

                            ),
                            SizedBox(height: 15,),
                            Container(alignment: Alignment.center,
                                child: Text('- OR -',style: TextStyle(color:Colors.grey.shade700, fontSize: 15 , ),)),
                            SizedBox(height: 15,),

                            Container(alignment: Alignment.center,
                                child: Text('Sign Up with',style: TextStyle(color:Colors.grey.shade700, fontSize: 13 ),)),

                            SizedBox(height: 6,),
                            Container(


                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(

                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow:[
                                  BoxShadow(color: Colors.black26,
                                    offset: Offset(0,2),
                                    blurRadius: 6.0,)
                                ],
                                image: DecorationImage(image: AssetImage('Images/google.png')
                                ),


                              ),



                            ),


                          ],
                        )



                  ]),
                ),

            ],


          )

      ),
    );

  }
}


