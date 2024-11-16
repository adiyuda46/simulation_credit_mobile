import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/widget/listProduct.dart';
import 'package:simulation_credit/views/widget/dropDownProduct.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import '../cubits/cat_motorbaru_cubit.dart';
import '../cubits/price_motorbaru_cubit.dart';
import '../widget/listProductForm.dart';

class MotorBaruPage extends StatefulWidget {
  const MotorBaruPage({super.key});

  @override
  State<MotorBaruPage> createState() => _MotorBaruPageState();
}

class _MotorBaruPageState extends State<MotorBaruPage> {
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
  String selectedJangkaWaktu = 'Silakan pilih'; // Inisialisasi dengan pilihan awal
  String selectedUangMuka = 'Silakan pilih';
  int? selectedUangMukaValue; // Untuk menyimpan nilai Uang Muka sebagai integer
  int?
      selectedJangkaWaktuValue; // Untuk menyimpan nilai Jangka Waktu sebagai integer

  @override
  void initState() {
    super.initState();
    context.read<CatMotorBaruCubit>().categoryMotorbaru();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motor Baru Yamaha",
          style: TextStyle(color: ColorUtil.putih),
        ),
        centerTitle: true,
        backgroundColor: ColorUtil.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ListProductForm(
                currentPage: 'motorBaru',
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  children: [
                    BlocBuilder<CatMotorBaruCubit, CatMotorBaruState>(
                      builder: (context, state) {
                        if (state is CatMotorBaruInitial) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state.error != null) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.categoryMotorBaruResp != null) {
                          _motorCategories =
                              state.categoryMotorBaruResp!.category;
                          return CustomDropdown(
                            label: "Tipe Motor",
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
                                  context
                                      .read<VarMotorBaruCubit>()
                                      .VarianMotorBaru(value);
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
                    BlocBuilder<VarMotorBaruCubit, VarMotorBaruState>(
                      builder: (context, state) {
                        if (state.error != null) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.varianMotorBaruResp != null) {
                          _motorVarian = state.varianMotorBaruResp!.varian;
                        }
                        return CustomDropdown(
                          label: "Varian Motor",
                          value: _selectedVarian['varianMotor']!,
                          items: _motorVarian,
                          onChanged: (value) {
                            if (_selectedValues['tipeMotor'] !=
                                DEFAULT_OPTION) {
                              setState(() {
                                _selectedVarian['varianMotor'] = value!;
                                _motorPrice =
                                    ""; // Reset price saat varian diubah
                                if (value != DEFAULT_OPTION) {
                                  context
                                      .read<PriceMotorBaruCubit>()
                                      .priceMotorBaru(
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
                    BlocBuilder<PriceMotorBaruCubit, PriceMotorBaruState>(
                      //key: Key( _selectedValues['tipeMotor']?? ""),
                      builder: (context, state) {
                        String displayedPrice =
                            _motorPrice == "" ? "" : _motorPrice;
                        if (state.error.isNotEmpty) {
                          return Center(child: Text('Error: ${state.error}'));
                        } else if (state.priceMotorBaruResp != null &&
                            _selectedVarian['varianMotor'] != DEFAULT_OPTION &&
                            _motorPrice == "") {
                          displayedPrice = state.priceMotorBaruResp!
                              .price; // Mengambil harga dari response
                          print("harga baru update :${displayedPrice}");
                        } else {
                          displayedPrice = "";
                        }

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Harga Motor",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              key: Key("harga-${displayedPrice}"),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorUtil.primaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Rp. ${displayedPrice}',
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
                            items: [
                              
                              '12 bulan',
                              '24 bulan',
                              '36 bulan'
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedJangkaWaktu = value ?? 'Silakan pilih';
                                // Konversi string ke integer, abaikan 'Silakan pilih'
                                selectedJangkaWaktuValue = value == 'Silakan pilih'
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
                            items: [ '10%', '20%', '30%'],
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
              ElevatedButton(
                onPressed: () {
                  // Add logic to calculate installments
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
