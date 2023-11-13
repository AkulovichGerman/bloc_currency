class Currency {
  int? curID;
  String? date;
  String? curAbbreviation;
  int? curScale;
  String? curName;
  double? curOfficialRate;

  Currency(
      {this.curID,
      this.date,
      this.curAbbreviation,
      this.curScale,
      this.curName,
      this.curOfficialRate});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      curID: json['Cur_ID'],
      date: json['Date'],
      curAbbreviation: json['Cur_Abbreviation'],
      curScale: json['Cur_Scale'],
      curName: json['Cur_Name'],
      curOfficialRate: json['Cur_OfficialRate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Cur_ID'] = curID;
    data['Date'] = date;
    data['Cur_Abbreviation'] = curAbbreviation;
    data['Cur_Scale'] = curScale;
    data['Cur_Name'] = curName;
    data['Cur_OfficialRate'] = curOfficialRate;
    return data;
  }
}
