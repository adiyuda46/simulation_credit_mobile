import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/core/utils/form/button.dart';
import 'package:simulation_credit/core/utils/form/input1.dart';
import 'package:simulation_credit/core/utils/text.dart';
import 'package:simulation_credit/views/cubits/login_cubit.dart';
import 'package:simulation_credit/views/cubits/register_cubit.dart';
import 'package:simulation_credit/views/screens/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _isValidPhone(String phone) {
    final RegExp phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(phone);
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text("Register"),
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == RegisterStatus.authenticated) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(child: Text("LOGIN SUKSES")),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (state.status == RegisterStatus.unauthenticated) {
            Navigator.of(context).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? 'Login failed')),
            );
          }

          // if (state.status == )
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("Hi BAF Friends,", style: TextStyles.h1),
                Text("Yuk Register BAF Mobile!", style: TextStyles.h1),
                Text("Semua Kebutuhan Tersedia di Sini", style: TextStyles.h2),
                const SizedBox(height: 22),
                PrimaryInput(
                    controller: _name,
                    labelText: "Nama Lengkap Kamu",
                    obscureText: false,
                    icon: Icons.person),
                const SizedBox(height: 22),
                PrimaryInput(
                    controller: _phone,
                    labelText: "Nomor Hanphone Aktif",
                    obscureText: false,
                    icon: Icons.phone),
                const SizedBox(height: 22),
                PrimaryInput(
                    controller: _email,
                    labelText: "Email",
                    obscureText: false,
                    icon: Icons.email_rounded),
                const SizedBox(height: 22),
                PrimaryInput(
                    controller: _password,
                    labelText: "Password",
                    obscureText: true,
                    icon: Icons.lock),
                const SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {
                    final name = _name.text;
                    final phone = _phone.text;
                    final email = _email.text;
                    final password = _password.text;

                    // Validate input
                    if (phone.isEmpty ||
                        password.isEmpty ||
                        name.isEmpty ||
                        email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }
                    if (!_isValidPhone(phone)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Nomor telepon harus berupa angka')),
                      );
                      return;
                    }

                    if (!_isValidEmail(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email tidak valid')),
                      );
                      return;
                    }

                    if (!_isValidPassword(password)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Password harus mengandung huruf besar, huruf kecil, angka, dan simbol')),
                      );
                      return;
                    }

                    // Call register method from AuthCubit
                    context.read<RegisterCubit>().register(
                          name,
                          phone,
                          email,
                          password,
                        );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: ColorUtil.primaryColor,
                      onPrimary: ColorUtil.putih,
                      minimumSize: Size(250, 50)),
                  child: Text("Daftar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
