class data_model {
  final id, nama, OPD, jenis, OTP, keluhan;
  data_model(
      {this.id, this.nama, this.OPD, this.jenis, this.OTP, this.keluhan});

  // map data to firebase
  Map<String, dynamic> add_data() {
    return {
      "nama": nama,
      "OPD": OPD,
      "jenis": jenis,
      "OTP": OTP,
      "keluhan": keluhan,
    };
  }
}
