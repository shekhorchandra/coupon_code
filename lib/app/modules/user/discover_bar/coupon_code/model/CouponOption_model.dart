class CouponOption {
  final String? qr;
  final String? upc;

  CouponOption({this.qr, this.upc});

  factory CouponOption.fromMap(Map<String, dynamic> map) {
    return CouponOption(
      qr: map['qr']?.toString(),
      upc: map['upc']?.toString(),
    );
  }
}