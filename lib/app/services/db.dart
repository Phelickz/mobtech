import 'package:mobtech/app/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tableUser = 'users';
final String columnId = '_id';
final String imei = 'imei';
final String? firstName = 'firstName';
final String? lastName = 'lastName';
final String? dob = 'dob';
final String? passportNumber = 'passportNumber';
final String? email = 'email';
final String? photoUrl = 'photoUrl';
final String? deviceName = 'deviceName';
final String? platformType = 'platformType';
final String? latitude = 'latitude';
final String? longitude = 'longitude';

class UserProvider {
  static Database? db;

  UserProvider._();

  static final UserProvider database = UserProvider._();

  Future<Database> get getdatabase async {
    if (db != null) return db!;

    db = await open();
    return db!;
  }

  ///open database
  Future open() async {
    var path = await getDatabasesPath();
    var dbPath = join(path, 'users.db');
    db = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableUser ( 
  $columnId integer primary key autoincrement, 
  $imei text not null,
  $lastName text not null,
  $dob text not null,
  $passportNumber text not null,
  $email text not null,
  $photoUrl text not null,
  $deviceName text not null,
  $platformType text not null,
  $latitude text not null,
  $longitude text not null,
  $firstName text not null)
''');
    });

    print('Database opened');

    return db;
  }

  /// insert the user data into the database
  Future<User> insert(User user) async {
    final database = await getdatabase;
    // await open(path);
    user.id = await database.insert(tableUser, user.toMap());
    return user;
  }

  /// get the data of a user
  Future<User?> getUser(int id) async {
    final database = await getdatabase;
    List<Map> maps = await database.query(tableUser,
        // columns: User().getVariables(),
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  /// get all users
  Future<List<User>?> getAllUsers() async {
    final database = await getdatabase;
    var results = await database.query(
      tableUser,
      // columns: User().getVariables(), 
    );
    List<User> users = [];

    for (int i = 0; i < results.length; i++) {
      var user = User.fromMap(results[i]);
      users.add(user);
    }
    return users;
  }

  /// close the database
  Future close() async => db!.close();
}
