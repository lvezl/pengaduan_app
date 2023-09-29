import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pengaduan_app/models/data_model.dart';

final CollectionReference _data =
    FirebaseFirestore.instance.collection("pengaduan");

class data_controller {
  // add data to fire base
  Future add_data(data_model data) async {
    await _data.doc(data.id).set(data.add_data());
  }

  //update data
  Future update_data(data_model data) async {
    await _data.doc(data.id).update(data.add_data());
  }

  // delete data
  Future delete_data(data_model data) async {
    await _data.doc(data.id).delete();
  }
}
