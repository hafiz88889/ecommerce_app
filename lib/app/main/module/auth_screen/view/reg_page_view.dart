import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_bloc.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_event.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_state.dart';
import 'package:ecommerce_app/app/route/app_path.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegPageView extends StatefulWidget {
  const RegPageView({Key? key}) : super(key: key);

  @override
  State<RegPageView> createState() => _RegPageViewState();
}

class _RegPageViewState extends State<RegPageView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeTos = false;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreeTos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept Terms & Conditions')),
      );
      return;
    }

    setState(() => _loading = true);
    context.read<AuthBloc>().add(
      AuthSignUpEvent(
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
        email: _emailController.text.trim(),
      ),
    );
    setState(() => _loading = false);
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticate) {
            context.push(Routes.HOME_PAGE_VIEW);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _nameController,
                          label: 'Full name',
                          hint: 'John Doe',
                          validator: (s) => (s == null || s.trim().length < 3)
                              ? 'Enter a valid name'
                              : null,
                          prefix: Icons.person,
                        ),
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'you@example.com',
                          validator: (s) =>
                              (s == null ||
                                  !RegExp(
                                    r"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                                  ).hasMatch(s))
                              ? 'Enter a valid email'
                              : null,
                          prefix: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'At least 8 characters',
                          validator: (s) => (s == null || s.length < 8)
                              ? 'Password must be at least 8 characters'
                              : null,
                          prefix: Icons.lock,
                          obscureText: _obscurePassword,
                          suffix: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _confirmController,
                          label: 'Confirm password',
                          hint: 'Retype password',
                          validator: (s) => (s != _passwordController.text)
                              ? 'Passwords do not match'
                              : null,
                          prefix: Icons.lock_outline,
                          obscureText: _obscurePassword,
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Checkbox(
                              value: _agreeTos,
                              onChanged: (v) =>
                                  setState(() => _agreeTos = v ?? false),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _agreeTos = !_agreeTos),
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(color: Colors.black87),
                                    children: [
                                      TextSpan(text: 'I agree to the '),
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        if (state is AuthLoading)
                          CircularProgressIndicator()
                        else
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: _loading ? null : _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                              ),
                              child: _loading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),

                        const SizedBox(height: 18),

                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                'or continue with',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _socialButton(
                              icon: Icons.facebook,
                              label: 'Facebook',
                              onTap: () {},
                            ),
                            _socialButton(
                              icon: Icons.g_mobiledata,
                              label: 'Google',
                              onTap: () {},
                            ),
                            _socialButton(
                              icon: Icons.apple,
                              label: 'Apple',
                              onTap: () {},
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                context.push(Routes.LOGIN_VIEW);
                              },
                              child: const Text('Sign in'),
                            ),
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
      ),
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
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
