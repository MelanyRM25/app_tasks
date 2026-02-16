import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_text_field.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  // Controllers with initial data
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  //key del formulario
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          // Ensure icon is visible on the background. Theme might have white text/icon on purple background logic,
          // but here we are on scaffold background.
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFE0E0E0),
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330', // Imagen de ejemplo
                    ),
                  ),

                  // 2. El Botón de Edición posicionado
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        print("Abrir cámara o galería");
                        // Aquí llamarías a tu función para elegir imagen
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Borde blanco para resaltar
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                "PERSONAL INFO",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              // Form Fields
              CustomTextField(
                controller: nameController,
                obscureText: false,
                hintText: 'Enter full name',
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                label: "Full name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20, width: double.infinity),

              CustomTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Enter email',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                label: "Email",
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
              const SizedBox(height: 20),

              CustomTextField(
                controller: phoneController,
                obscureText: false,
                hintText: 'Enter phone number',
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                label: "Phone number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 8) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              CustomTextField(
                controller: occupationController,
                obscureText: false,
                hintText: 'Enter occupation',
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                label: "Occupation",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your occupation';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 50),
              CustomElevatedButton(
                text: 'Save Changes',
                icon: const Icon(Icons.check_circle),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid");
                  }
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
