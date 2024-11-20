class SimulationResp {
  final String cicilanBulanan;
  final String totalBunga;
  final String totalDownPayment;
  final String totalPembayaran;
  final String message;

  SimulationResp({
    required this.cicilanBulanan,
    required this.totalBunga,
    required this.totalDownPayment,
    required this.totalPembayaran,
    required this.message,
  });

  factory SimulationResp.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return SimulationResp(
      cicilanBulanan: data['Cicilan Bulanan'],
      totalBunga: data['Total Bunga'],
      totalDownPayment: data['Total Down Payment'],
      totalPembayaran: data['Total Pembayaran'],
      message: data['message'],
    );
  }
}

class SubmitSimulationResp {
final String Agrement;
 final String message;

  SubmitSimulationResp({required this.Agrement, required this.message});

 factory SubmitSimulationResp.fromJson(Map<String, dynamic> json) {
  final data = json['data'];
  return SubmitSimulationResp(Agrement: data['AgreementNumber'], message: data['Message']);
 }

}