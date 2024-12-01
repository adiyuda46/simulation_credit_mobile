import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/price_mobil_repository.dart';
import 'package:simulation_credit/data/repositories/price_motorbaru_repository.dart';

class PriceMobilState {
  final PriceMotorBaruResp? priceMotorBaruResp;
  final String error;

  PriceMobilState({this.priceMotorBaruResp, this.error = ''});
}

class PriceMotorBaruInitial extends PriceMobilState {
  PriceMotorBaruInitial() : super(); // Tidak memerlukan argumen
}

@injectable
class PriceMobilCubit extends Cubit<PriceMobilState> {
  final PriceMobilRepository _priceMobilRepository;

  PriceMobilCubit(this._priceMobilRepository) : super(PriceMotorBaruInitial());


  Future<void> priceMobil(String category, String productName) async {
    try {
      final price = await _priceMobilRepository.priceMobil(category, productName);
      final priceMotorBaruResp = PriceMotorBaruResp(message: "Data ditemukan", price: price.price);
      emit(PriceMobilState(priceMotorBaruResp: priceMotorBaruResp));
    } catch (e) {
    emit(PriceMobilState(error: e.toString()));
    }
  }
}