import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/price_motorBekas_repository.dart';
import 'package:simulation_credit/data/repositories/price_motorbaru_repository.dart';

class PriceMotorBekasState {
  final PriceMotorBaruResp? priceMotorBaruResp;
  final String error;

  PriceMotorBekasState({this.priceMotorBaruResp, this.error = ''});
}

class PriceMotorBekasInitial extends PriceMotorBekasState {
  PriceMotorBekasInitial() : super(); // Tidak memerlukan argumen
}

@injectable
class PriceMotorBekasCubit extends Cubit<PriceMotorBekasState> {
  final PriceMotorBekasRepository _priceMotorBekasRepository;

  PriceMotorBekasCubit(this._priceMotorBekasRepository) : super(PriceMotorBekasInitial());

  Future<void> priceMotorBekas(String category, String productName) async {
    try {
      final price = await _priceMotorBekasRepository.priceMotorBekas(category, productName);
      final priceMotorBaruResp = PriceMotorBaruResp(message: "Data ditemukan", price: price.price);
      emit(PriceMotorBekasState(priceMotorBaruResp: priceMotorBaruResp));
    } catch (e) {
    emit(PriceMotorBekasState(error: e.toString()));
    }
  }
}