import 'package:chat_app/Widget/PrimaryButton.dart';
import 'package:flutter/material.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Update Profile'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10)
              ),
              child:Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: Icon(Icons.photo_camera,size: 40,),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              shape: BoxShape.circle

                            ),
                          ),
                          Row(
                            children: [
                              Text("Personal Info",style: TextStyle(fontSize: 14),),
                            ],

                          ),
                          SizedBox(height: 20,),

                          Row(
                            children: [
                              Text("Name",style: TextStyle(fontSize: 16,color: Colors.white))
                            ],

                          ),

                          SizedBox(height: 10,),

                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Ajay Kumar',
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Email",style: TextStyle(fontSize: 16,color: Colors.white))
                            ],

                          ),

                          SizedBox(height: 10,),

                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'example@gmail.com',
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: Icon(Icons.mail),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Phone",style: TextStyle(fontSize: 16,color: Colors.white))
                            ],

                          ),

                          SizedBox(height: 10,),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: '99999999999',
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: Icon(Icons.phone,size: 20,),
                            ),
                          ),
                          SizedBox(height:40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryButton(
                                  btnName: 'Save',
                                  icon: Icons.save,
                                  onTap: (){}
                              ),
                            ],
                          )


                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
