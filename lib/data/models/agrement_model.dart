class AgreementResp {
  final String agreement;
  final int amountInstalment;
  final String product;
  final String instalment;
  final String dueDate;

  AgreementResp({
    required this.agreement,
    required this.amountInstalment,
    required this.product,
    required this.instalment,
    required this.dueDate,
  });

  factory AgreementResp.fromJson(Map<String, dynamic> json) {
    return AgreementResp(
      agreement: json['AGREMENT'],
      amountInstalment: json['AMOUNT_INSTALMENT'],
      product: json['PRODUCT'],
      instalment: json['INSTALMENT'],
      dueDate: json['DUE_DATE'],
    );
  }
}