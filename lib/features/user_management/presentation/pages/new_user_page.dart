import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_to_do_app/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_to_do_app/features/auth/presentation/providers/theme_provider.dart';

class NewUserPage extends ConsumerStatefulWidget {
  const NewUserPage({super.key});

  @override
  ConsumerState<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends ConsumerState<NewUserPage> {
  // Controllers with initial data
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  //key del formulario
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _occupationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final textFieldSpace = const SizedBox(height: 25);

    final themeMode = ref.watch(themeProvider);

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
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toogleTheme();
            },
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: themeMode == ThemeMode.light
                            ? Colors.deepPurpleAccent
                            : Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFE0E0E0),
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330', // Imagen de ejemplo
                      ),
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
              textFieldSpace, // Form Fields
              CustomTextField(
                controller: _nameController,
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
                controller: _emailController,
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
              textFieldSpace, // Form Fields
              CustomTextField(
                controller: _phoneController,
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

              textFieldSpace, // Form Fields
              CustomTextField(
                controller: _occupationController,
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

              textFieldSpace, // Form Fields
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
