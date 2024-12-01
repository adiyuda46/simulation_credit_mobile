import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/colors/colors.dart';
import '../cubits/accountDetails_cubit.dart'; // Ensure this import matches your project structure

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    super.initState();
    // Memanggil cubit untuk mengambil detail akun saat widget diinisialisasi
    context.read<AccountDetailCubit>().getAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: ColorUtil.putih),
        ),
        backgroundColor: ColorUtil.primaryColor,
        centerTitle: true,
      ),
      body: BlocBuilder<AccountDetailCubit, AccountDetails>(
        builder: (context, state) {
          if (state.error != null) {
            // Display error message if there is an error
            return Center(
              child: Text(
                state.error!,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (state.detailAccountModel == null) {
            // Show loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          }

          // Display account details when available
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${state.detailAccountModel!.name}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Email: ${state.detailAccountModel!.email}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Phone: ${state.detailAccountModel!.phone}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
