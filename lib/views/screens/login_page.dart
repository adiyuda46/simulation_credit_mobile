import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/injection/injection.dart';
import 'package:simulation_credit/views/cubits/login_cubit.dart';
import 'package:simulation_credit/views/cubits/register_cubit.dart';
import 'package:simulation_credit/views/screens/home_page.dart';
import 'package:simulation_credit/views/screens/register_page.dart';
import '../../core/utils/colors/colors.dart';
import '../../core/utils/form/input1.dart'; // Pastikan import ini benar

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("LOGIN SUKSES")),
            );
            // Navigasi ke HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.of(context).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? 'Login failed')),
            );
            if (state.error == 'Invalid credentials') {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Nomor HP atau password salah.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                    ),
                  ],
                ),
              );
            }
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 56, 30, 36),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logobaf.png', // Ganti dengan nama gambar Anda
                    width: 233, // Sesuaikan ukuran
                    height: 201,
                  ),
                  const SizedBox(height: 57),
                  PrimaryInput(
                      controller: _phoneController,
                      labelText: "Nomor Hanphone Aktif",
                      obscureText: false,
                      icon: Icons.phone),
                  const SizedBox(height: 28),
                  PrimaryInput(
                      controller: _passwordController,
                      labelText: "Password",
                      obscureText: true,
                      icon: Icons.lock),
                  const SizedBox(height: 145),
                  ElevatedButton(
                    onPressed: () {
                      final phone = _phoneController.text;
                      final password = _passwordController.text;

                      // Validasi input
                      if (phone.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter both phone and password'),
                          ),
                        );
                        return;
                      }

                      // Panggil metode login dari AuthCubit
                      context.read<AuthCubit>().login(phone, password);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorUtil.primaryColor,
                      onPrimary: ColorUtil.putih,
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  const Text("Belum punya akun BAF Mobile?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => getIt<RegisterCubit>(),
                            child: const RegisterPage(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorUtil
                          .putih, // Gunakan backgroundColor alih-alih primary
                      foregroundColor: ColorUtil
                          .text, // Gunakan foregroundColor alih-alih onPrimary
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorUtil.text, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('daftar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
