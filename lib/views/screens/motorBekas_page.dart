import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/views/cubits/simulasi_cubit.dart';
import 'package:simulation_credit/views/cubits/submit_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/product.dart';
import 'package:simulation_credit/views/widget/listProduct.dart';
import 'package:simulation_credit/views/widget/dropDownProduct.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import 'package:simulation_credit/views/widget/result_simulasai.dart';
import '../../core/injection/injection.dart';
import '../cubits/cat_morotBekas_cubit.dart';
import '../cubits/cat_motorbaru_cubit.dart';
import '../cubits/price_motorBekas_cubit.dart';
import '../cubits/price_motorbaru_cubit.dart';
import '../cubits/var_motorBekas_cubit.dart';
import '../widget/listProductForm.dart';

class MotorBekasPage extends StatefulWidget {
  const MotorBekasPage({super.key});

  @override
  State<MotorBekasPage> createState() => _MotorBekasPageState();
}

class _MotorBekasPageState extends State<MotorBekasPage> {
  // global variable
  static const String DEFAULT_OPTION = 'Silakan pilih';
  Map<String, String?> _selectedValues = {
    'tipeMotor': DEFAULT_OPTION,
  };
  Map<String, String?> _selectedVarian = {
    'varianMotor': DEFAULT_OPTION,
  };
  List<String> _motorCategories = [];
  List<String> _motorVarian = [];
  String _motorPrice = ""; // Make this nullable to represent no price
  String selectedJangkaWaktu =
      'Silakan pilih'; // Inisialisasi dengan pilihan awal
  String selectedUangMuka = 'Silakan pilih';
  int? selectedUangMukaValue; // Untuk menyimpan nilai Uang Muka sebagai integer
  int?
      selectedJangkaWaktuValue; // Untuk menyimpan nilai Jangka Waktu sebagai integer
  int? priceInInt;
  String typeProduct = "MOTOR BEKAS";

  @override
  void initState() {
    super.initState();
    context.read<CatMotorBekasCubit>().categoryMotoBekas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motor Bekas",
          style: TextStyle(color: ColorUtil.putih),
        ),
        centerTitle: true,
        backgroundColor: ColorUtil.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorUtil.putih), // Back button icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductPage()), // Navigate to ProductPage
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ListProductForm(
                currentPage: 'motorBekas',
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  children: [
                    BlocBuilder<CatMotorBekasCubit, CatMotorBekasState>(
                      builder: (context, state) {
                        if (state is CatMotorBaruInitial) {
                          //return Center(child: CircularProgressIndicator());
                          return _buildShimmer();
                        } else if (state.error != null) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.categoryMotorBaruResp != null) {
                          _motorCategories =
                              state.categoryMotorBaruResp!.category;
                          return CustomDropdown(
                            label: "Tipe Motor Bekas",
                            value: _selectedValues['tipeMotor']!,
                            items: _motorCategories.isNotEmpty
                                ? _motorCategories
                                : [DEFAULT_OPTION],
                            onChanged: (value) {
                              setState(() {
                                _selectedValues['tipeMotor'] = value!;
                                _selectedVarian['varianMotor'] =
                                    DEFAULT_OPTION; // Reset varian
                                _motorPrice =
                                    ""; // Reset price saat tipe motor diubah
                                if (value != DEFAULT_OPTION) {
                                  typeProduct = value;
                                  context
                                      .read<VarMotorBekasCubit>()
                                      .VarianMotorBekas(value);
                                }
                              });
                            },
                            isRequired: true,
                            errorText: null,
                            enabled: true,
                          );
                        }
                        return Center(child: Text('No categories found'));
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<VarMotorBekasCubit, VarMotorBekasState>(
                      builder: (context, state) {
                        if (state.error != null) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.varianMotorBaruResp != null) {
                          _motorVarian = state.varianMotorBaruResp!.varian;
                        }
                        return CustomDropdown(
                          label: "Varian Motor Bekas",
                          value: _selectedVarian['varianMotor']!,
                          items: _motorVarian,
                          onChanged: (value) {
                            context
                                .read<SimulasiCubit>()
                                .setSimulationInfo(false);
                            if (_selectedValues['tipeMotor'] !=
                                DEFAULT_OPTION) {
                              setState(() {
                                _selectedVarian['varianMotor'] = value!;
                                _motorPrice =
                                    ""; // Reset price saat varian diubah
                                if (value != DEFAULT_OPTION) {
                                  context
                                      .read<PriceMotorBekasCubit>()
                                      .priceMotorBekas(
                                        _selectedValues['tipeMotor']!,
                                        value,
                                      );
                                }
                              });
                            }
                          },
                          isRequired: true,
                          errorText: null,
                          enabled:
                              _selectedValues['tipeMotor'] != DEFAULT_OPTION,
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<PriceMotorBekasCubit, PriceMotorBekasState>(
                      builder: (context, state) {
                        String displayedPrice =
                            _motorPrice.isEmpty ? "" : _motorPrice;
                        String formattedPrice =
                            ""; // Inisialisasi formattedPrice

                        if (state.error.isNotEmpty) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.priceMotorBaruResp != null &&
                            _selectedVarian['varianMotor'] != DEFAULT_OPTION &&
                            _motorPrice.isEmpty) {
                          displayedPrice = state.priceMotorBaruResp!
                              .price; // Mengambil harga dari response
                          print("harga baru update : $displayedPrice");

                          // Mengonversi displayedPrice menjadi int
                          priceInInt = int.tryParse(
                              displayedPrice.replaceAll(RegExp(r'[^\d]'), ''));

                          // Pastikan untuk memeriksa jika konversi berhasil
                          if (priceInInt != null) {
                            formattedPrice = NumberFormat('#,##0', 'id_ID')
                                .format(priceInInt);
                            print("duit : $priceInInt");
                          } else {
                            print("Gagal mengonversi harga: $displayedPrice");
                          }
                        }

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Harga Motor Bekas",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              key: Key(
                                  "harga-${formattedPrice.isNotEmpty ? formattedPrice : '0'}"),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorUtil.primaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                formattedPrice.isNotEmpty
                                    ? 'Rp. $formattedPrice'
                                    : 'Rp. 0',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            label: 'Jangka Waktu',
                            value: selectedJangkaWaktu,
                            items: ['12 bulan', '24 bulan', '36 bulan'],
                            onChanged: (value) {
                              setState(() {
                                selectedJangkaWaktu = value ?? 'Silakan pilih';
                                // Konversi string ke integer, abaikan 'Silakan pilih'
                                selectedJangkaWaktuValue =
                                    value == 'Silakan pilih'
                                        ? null
                                        : int.parse(value!.split(' ')[0]);
                              });
                            },
                            enabled: true,
                          ),
                        ),
                        const SizedBox(width: 16), // Spacing between dropdowns
                        Expanded(
                          child: CustomDropdown(
                            label: 'Uang Muka',
                            value: selectedUangMuka,
                            items: ['10%', '20%', '30%'],
                            onChanged: (value) {
                              setState(() {
                                selectedUangMuka = value ?? 'Silakan pilih';
                                // Konversi string ke integer, abaikan 'Silakan pilih'
                                selectedUangMukaValue = value == 'Silakan pilih'
                                    ? null
                                    : int.parse(value!.replaceAll('%', ''));
                              });
                            },
                            enabled: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 26),
              BlocBuilder<SimulasiCubit, SimulasiState>(
                builder: (context, state) {
                  if (state.error.isNotEmpty) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else if (state.showSimulationInfo &&
                      state.simulationResp != null &&
                      _selectedVarian['varianMotor'] == 'Silakan pilih') {
                    final response = state.simulationResp!;
                    print("sukses simulasi 2");
                    ElevatedButton(
                      onPressed: () {
                        if (priceInInt != null &&
                            selectedUangMukaValue != null &&
                            selectedJangkaWaktuValue != null) {
                          context.read<SimulasiCubit>().simulasiKredit(
                              priceInInt!,
                              selectedUangMukaValue!,
                              selectedJangkaWaktuValue!);
                        } else {
                          // Tampilkan pesan kesalahan atau lakukan penanganan lain
                          print('Harga tidak valid');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorUtil.primaryColor,
                        onPrimary: ColorUtil.putih,
                        minimumSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Hitung Cicilan'),
                    );
                  } else if (state.showSimulationInfo &&
                      state.simulationResp != null) {
                    final response = state.simulationResp!;
                    return ResultSimulasi(
                      cicilanBulanan: response.cicilanBulanan,
                      totalDownPayment: response.totalDownPayment,
                      dp: selectedUangMuka,
                      tenor: selectedJangkaWaktu,
                      typeProduct: "MOTOR BEKAS",
                      totalAmount: response.totalPembayaran,
                    );
                  }

                  return ElevatedButton(
                    onPressed: () {
                      if (priceInInt != null &&
                          selectedUangMukaValue != null &&
                          selectedJangkaWaktuValue != null) {
                        context.read<SimulasiCubit>().simulasiKredit(
                            priceInInt!,
                            selectedUangMukaValue!,
                            selectedJangkaWaktuValue!);
                      } else {
                        print('Harga tidak valid');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorUtil.primaryColor,
                      onPrimary: ColorUtil.putih,
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Hitung Cicilan'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
