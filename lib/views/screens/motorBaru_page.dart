import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/widget/listProduct.dart';
import 'package:simulation_credit/views/widget/dropDownProduct.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import '../cubits/cat_motorbaru_cubit.dart';

class MotorBaruPage extends StatefulWidget {
  const MotorBaruPage({super.key});

  @override
  State<MotorBaruPage> createState() => _MotorBaruPageState();
}

class _MotorBaruPageState extends State<MotorBaruPage> {
  static const String DEFAULT_OPTION = 'Silakan pilih';
  Map<String, String?> _selectedValues = {
    'tipeMotor': DEFAULT_OPTION,
  };
  Map<String, String?> _selectedVarian = {
    'varianMotor': DEFAULT_OPTION,
  };
  List<String> _motorCategories = [];
  List<String> _motorVarian = [];

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
              const ListProduct(),
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
                                if (value != DEFAULT_OPTION) {
                                  _selectedVarian['varianMotor'] = DEFAULT_OPTION; // Reset variant
                                  context.read<VarMotorBaruCubit>().VarianMotorBaru(value);
                                }
                              });
                            },
                            isRequired: true,
                            errorText: null, // Handle errors if needed
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
                          items: _motorVarian.isNotEmpty
                              ? _motorVarian
                              : [DEFAULT_OPTION],
                          onChanged: (value) {
                            if (_selectedValues['tipeMotor'] != DEFAULT_OPTION) {
                              setState(() {
                                _selectedVarian['varianMotor'] = value!;
                              });
                            }
                          },
                          isRequired: true,
                          errorText: null, // Handle errors if needed
                          enabled: _selectedValues['tipeMotor'] != DEFAULT_OPTION, // Enable only if type is selected
                        );
                      },
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