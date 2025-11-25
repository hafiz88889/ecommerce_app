import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_event.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_state.dart';
import 'package:ecommerce_app/app/route/app_path.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';


class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeTos = false;
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    // Simulate a network call / registration process
context.read<AuthBloc>().add(AuthLogInEvent(password: _passwordController.text.trim(), email: _emailController.text.trim()));
    setState(() => _loading = false);
_passwordController.clear();
_emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body:BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is AuthAuthenticate){
            context.push(Routes.HOME_PAGE_VIEW);
          }else if(state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        builder: (context, state){
          return  SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Center(
                    child: Text(
                      'LogIn',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'you@example.com',
                          validator: (s) => (s == null || !RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(s)) ? 'Enter a valid email' : null,
                          prefix: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'At least 8 characters',
                          validator: (s) => (s == null || s.length < 8) ? 'Password must be at least 8 characters' : null,
                          prefix: Icons.lock,
                          obscureText: _obscurePassword,
                          suffix: IconButton(
                            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Checkbox(
                              value: _agreeTos,
                              onChanged: (v) => setState(() => _agreeTos = v ?? false),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _agreeTos = !_agreeTos),
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(color: Colors.black87),
                                    children: [
                                      TextSpan(text: 'I agree to the '),
                                      TextSpan(text: 'Terms & Conditions', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 4,
                            ),
                            child: _loading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white)),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Row(
                        //   children: const [
                        //     Expanded(child: Divider()),
                        //     Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 12.0),
                        //       child: Text('or continue with', style: TextStyle(color: Colors.black54)),
                        //     ),
                        //     Expanded(child: Divider()),
                        //   ],
                        // ),

                        const SizedBox(height: 12),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     _socialButton(icon: Icons.facebook, label: 'Facebook', onTap: () {}),
                        //     _socialButton(icon: Icons.g_mobiledata, label: 'Google', onTap: () {}),
                        //     _socialButton(icon: Icons.apple, label: 'Apple', onTap: () {}),
                        //   ],
                        // ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont't have Account"),
                            TextButton(onPressed: () {
                              context.push(Routes.REG_SCREEN);
                            }, child: const Text('Sign Up')),
                          ],
                        ),

                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? Function(String?)? validator,
    IconData? prefix,
    Widget? suffix,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _socialButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
