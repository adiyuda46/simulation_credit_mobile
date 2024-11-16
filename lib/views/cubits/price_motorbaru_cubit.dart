import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/price_motorbaru_repository.dart';

class PriceMotorBaruState {
  final PriceMotorBaruResp? priceMotorBaruResp;
  final String error;

  PriceMotorBaruState({this.priceMotorBaruResp, this.error = ''});
}

class PriceMotorBaruInitial extends PriceMotorBaruState {
  PriceMotorBaruInitial() : super(); // Tidak memerlukan argumen
}

@injectable
class PriceMotorBaruCubit extends Cubit<PriceMotorBaruState> {
  final PriceMotorBaruRepository _priceMotorBaruRepository;

  PriceMotorBaruCubit(this._priceMotorBaruRepository) : super(PriceMotorBaruInitial());

  Future<void> priceMotorBaru(String category, String productName) async {
    try {
      final price = await _priceMotorBaruRepository.priceMotorBaru(category, productName);
      final priceMotorBaruResp = PriceMotorBaruResp(message: "Data ditemukan", price: price.price);
      emit(PriceMotorBaruState(priceMotorBaruResp: priceMotorBaruResp));
    } catch (e) {
    emit(PriceMotorBaruState(error: e.toString()));
    }
  }
}