import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/price_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/price_mp_repository.dart';

class PriceMpState {
  final PriceMotorBaruResp? priceMotorBaruResp;
  final String error;

  PriceMpState({this.priceMotorBaruResp, this.error = ''});
}

class PriceMpInitial extends PriceMpState {
  PriceMpInitial() : super(); // Tidak memerlukan argumen
}

@injectable
class PriceMpCubit extends Cubit<PriceMpState> {
  final PriceMpRepository _priceMpRepository;

  PriceMpCubit(this._priceMpRepository) : super(PriceMpInitial());

  Future<void> priceMp(String category, String productName) async {
    try {
      final price = await _priceMpRepository.priceMp(category, productName);
      final priceMotorBaruResp = PriceMotorBaruResp(message: "Data ditemukan", price: price.price);
      emit(PriceMpState(priceMotorBaruResp: priceMotorBaruResp));
    } catch (e) {
    emit(PriceMpState(error: e.toString()));
    }
  }
}