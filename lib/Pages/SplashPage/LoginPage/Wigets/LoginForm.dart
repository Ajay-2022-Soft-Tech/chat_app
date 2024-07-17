import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/AuthController.dart';
import '../../../../Widget/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthController authController = Get.put(AuthController());
    final RxBool isPasswordHidden = true.obs;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void _login() {
      if (_formKey.currentState?.validate() ?? false) {
        authController.login(emailController.text, passwordController.text);
      } else {
        Get.snackbar("invalid Credentials", "Please enter valid details",backgroundColor: Colors.red[400],snackPosition: SnackPosition.BOTTOM);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          Obx(
                () => TextFormField(
              controller: passwordController,
              obscureText: isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordHidden.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    isPasswordHidden.value = !isPasswordHidden.value;
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Navigate to ForgotPassword page
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 60),
          Obx(
                () => authController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.lightBlue,)
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  onTap: _login,
                  btnName: "LOGIN",
                  icon: Icons.lock_open_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
