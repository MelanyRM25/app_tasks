import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_to_do_app/features/user_management/presentation/pages/new_user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variable para obtener el tamaño alto y ancho del dispositivo

  //controlador
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscureText = true; // si es v rdadero eocult al acontraseña

  @override
  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Manager'), centerTitle: true),
      //Cuerpo de aplicacion
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              const Text(
                'Hello there',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                ' Stay organized and productive today ',
                style: TextStyle(fontSize: 19, color: Colors.deepPurpleAccent),
              ),
              const SizedBox(height: 40),

              CustomTextField(
                controller: emailIdController,
                hintText: 'Enter your email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                suffixIcon: const Icon(
                  Icons.person,
                  color: Colors.deepPurpleAccent,
                ),
                label: "User ID or Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18, width: double.infinity),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: obscureText,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                label: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 170),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 28),
              CustomElevatedButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewUserPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.deepPurpleAccent,
                        height: 10,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR CONTINUE WITH",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.deepPurpleAccent,
                        height: 10,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata),
                    label: Text("Google"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.apple),
                    label: Text("Apple"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.deepPurpleAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
