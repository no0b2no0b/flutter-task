import 'dart:async';
import 'package:first_task/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddressDatabase{
static final AddressDatabase instance = AddressDatabase._init();

  static Database? _database;

  AddressDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database! ;

    _database = await _initDB('address.db') ;
    return _database! ;
  }

  Future<Database> _initDB(String fillPath) async {
    final dbPath  = await getDatabasesPath();
    final path = join(dbPath , fillPath);

    return await openDatabase(path , version:1 ,onCreate : _createDB) ;
  }

  Future _createDB(Database db , int version) async{
    final textType = 'TEXT NOT NULL';

    var tableAddress;
    var AddressFields;
    await db.execute('''
CREATE TABLE $tableAddress(
  ${AddressFields.addLine1} $textType,
    ${AddressFields.addLine2} $textType,
  ${AddressFields.addLine3} $textType
)
''');
  }

  Future<Address> create(Address address) async{
final db = await instance.database;

final addLine1 = await db.insert(tableAddress , address.toJson());
return address.copy(addLine1 : addLine1);

  }

// Future<Address> readAddresss(String addLine1) async{
//   final db = await instance.database ;

//   final maps = await db.query(
//     tableAddress,
//     columns: AddressFields

//   );
// }




  Future close() async{
    final db = await instance.database;

    db.close();
  }
}

// class Address {
//   Map<String, Object?> toJson() {
//     AddressFields.addLine1 : addLine1 ;
//       AddressFields.addLine2 : addLine2 ;
//       AddressFields.addLine3 : addLine3 
//   }
// }









// //OPen the Database
// class DbManager {
//   late Database _database;

//   Future openDb() async {
//     _database = await openDatabase(join(await getDatabasesPath(), "ss.db"),
//         version: 1, onCreate: (Database db, int version) async {
//       await db.execute(
//         "CREATE TABLE model(addLine1 TEXT , addLine2 TEXT , addLine3 TEXT)",
//       );
//     });
//     return _database;
//   }




// //Insert DAta in Database
//   Future insertAddress(Address model) async {
//     await openDb();
//     return await _database.insert('model', model.toJson());
//   }




// //Fetch the data
//   Future<List<Address>> getAddressList() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps = await _database.query('model');

//     return List.generate(maps.length, (i) {
//       return Address(
//           addLine1:maps[i]['addLine1'],
//           addLine2:maps[i]['addLine2'],
//           addLine3:maps[i]['addLine3'],
//          );
//     });
//     // return maps
//     //     .map((e) => Model(
//     //         id: e["id"], fruitName: e["fruitName"], quantity: e["quantity"]))
//     //     .toList();
//   }


// // //Updtae the data
// //   Future<int> updateAddress(Address model) async {
// //     await openDb();
// //     return await _database.update('model', model.toJson(),
// //         where: "addLine1 = ?", whereArgs: [model.addLine1]);
// //   }

//   //Update the database
//   Future<int> updateAddress(Address model) async{
//     await openDb();
//     return await _database.update('model' , model.toJson(),
//     where: "addLine1 = ? " , whereArgs:  [model.addLine1]
//     );
//   } 


// //Delete database
//   Future<void> deleteAddress(Address model) async {
//     await openDb();
//     await _database.delete('model', where: "addLine1", whereArgs: [model.addLine1]);
//   }
// }