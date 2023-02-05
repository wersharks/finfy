class StockTransaction {
  String? transactionId;
  int? initamt;
  int? finamt;
  int? timestamp;
  int? finalAmt;

  StockTransaction(
      {this.transactionId,
      this.initamt,
      this.finamt,
      this.timestamp,
      this.finalAmt});

  StockTransaction.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    initamt = json['initamt'];
    finamt = json['finamt'];
    timestamp = json['timestamp'];
    finalAmt = json['finalAmt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['initamt'] = this.initamt;
    data['finamt'] = this.finamt;
    data['timestamp'] = this.timestamp;
    data['finalAmt'] = this.finalAmt;
    return data;
  }
}
