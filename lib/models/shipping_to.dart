class ShippingTo {
  int id;
  String addressTxtRow1;
  String addressTxtRow2;
  String addressTxtRow3;
  bool active = false;

  ShippingTo({
    this.id,
    this.addressTxtRow1,
    this.addressTxtRow2,
    this.addressTxtRow3,
    this.active,
  });

  factory ShippingTo.fromJson(Map<String, dynamic> json) {
    return ShippingTo(
      id: json['id'],
      addressTxtRow1: json['str_1'],
      addressTxtRow2: json['str_2'],
      addressTxtRow3: json['str_3'],
      active: json['active'],
    );
  }
}
