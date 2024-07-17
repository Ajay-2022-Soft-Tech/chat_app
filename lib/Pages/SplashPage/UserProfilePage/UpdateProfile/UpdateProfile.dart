import 'package:flutter/material.dart';

import '../../../../Widget/PrimaryButton.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(children: [
                Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Personal Info",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Ajay Kumar",
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Email id",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "admine@gmail.com",
                            prefixIcon: Icon(
                              Icons.alternate_email_rounded,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Phone Number",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "0237647324",
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              btnName: "Save",
                              icon: Icons.save,
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}