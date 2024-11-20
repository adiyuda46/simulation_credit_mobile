import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';

import 'package:simulation_credit/data/models/agrement_model.dart';

import '../cubits/agrement_cubit.dart';

class ListAgrement extends StatefulWidget {
  const ListAgrement({super.key});

  @override
  State<ListAgrement> createState() => _ListAgrementState();
}

class _ListAgrementState extends State<ListAgrement> {
  @override
  void initState() {
    super.initState();
    // Memanggil cubit untuk mengambil daftar agreement saat widget diinisialisasi
    context.read<AgrementCubit>().getListAgrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Agreement",
          style: TextStyle(color: ColorUtil.putih),
        ),
        backgroundColor: ColorUtil.primaryColor,
        centerTitle: true,
      ),
      body: BlocBuilder<AgrementCubit, AgrementState>(
        builder: (context, state) {
          // Menangani state loading
          if (state.agreementResp == null && state.error == null) {
            return Center(child: CircularProgressIndicator());
          }

          // Menangani kesalahan
          if (state.error != null) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }

          // Menampilkan daftar agreement
          final agreements = state.agreementResp!;
          return ListView.builder(
            itemCount: agreements.length,
            itemBuilder: (context, index) {
              final agreement = agreements[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 70,
                      decoration: BoxDecoration(
                        color: ColorUtil.primaryColor,
                        border: Border.all(
                            color: Colors.black, width: 2), // Add border
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)), // Rounded corners
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 300,
                      decoration: BoxDecoration(
                        color: ColorUtil.grey,
                        border: Border.all(
                            color: Colors.black, width: 2), // Add border
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ), // Rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow('Agreement', agreement.agreement),
                            _buildRow('Amount', agreement.amountInstalment),
                            _buildRow('Product', agreement.product),
                            _buildRow('Instalment', agreement.instalment),
                            _buildRow('Due Date', agreement.dueDate),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget _buildRow(String label, dynamic value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 2),
      Text(":"),
      SizedBox(width: 8), // Jarak antara label dan nilai
      Expanded(
        child: Text(
          value.toString(), // Mengonversi nilai menjadi String
          textAlign: TextAlign.end, // Mengatur teks ke kanan
          // style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    ],
  );
}
