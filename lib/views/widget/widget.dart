import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/injection/injection.dart';
// import 'package:simulation_credit/views/cubits/login_cubit.dart';
// import 'package:simulation_credit/views/cubits/register_cubit.dart';
// import 'package:simulation_credit/views/screens/home_page.dart';
// import 'package:simulation_credit/views/screens/list_agrement_page.dart';
// import 'package:simulation_credit/views/screens/register_page.dart';
// import '../../core/utils/colors/colors.dart';
// import '../../core/utils/form/input1.dart';
import '../cubits/agrement_cubit.dart';
import '../screens/list_agrement_page.dart'; // Pa

class InformasiCicilanWidget extends StatefulWidget {
  const InformasiCicilanWidget({Key? key}) : super(key: key);

  @override
  State<InformasiCicilanWidget> createState() => _InformasiCicilanWidgetState();
}

class _InformasiCicilanWidgetState extends State<InformasiCicilanWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          // Navigasi ke halaman ListAgrement
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => getIt<AgrementCubit>(),
                child: const ListAgrement(),
              ),
            ),
          );
        },
        child: Stack(
          children: [
            // Kontainer utama dengan border
            Container(
              height: 120,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue.shade300,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
            ),
            // Header "Informasi Cicilan"
            Container(
              height: 30,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Center(
                child: const Text(
                  'Informasi Cicilan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Konten dengan ikon dan teks
            Positioned(
              top: 50,
              left: 20,
              child: Row(
                children: [
                  Icon(
                    Icons.edit_document,
                    color: Colors.blue.shade500,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'cek agreement',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
