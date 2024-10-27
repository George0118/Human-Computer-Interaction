import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_app/db/model/photo.dart';
import "package:my_app/db/model/user.dart";
import "package:my_app/db/model/hymettuspathone.dart";
import "package:my_app/db/model/hymettuspathtwo.dart";
import "package:my_app/db/model/parnithapathone.dart";
import "package:my_app/db/model/parnithapathtwo.dart";
import 'dart:developer';
import 'package:my_app/db/model/rating.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mydb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    log(dbPath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY NOT NULL';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final intType = 'INTEGER NOT NULL';
    final doubleType = 'REAL NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUsers (
        ${UserFields.id} $idType,
        ${UserFields.username} $textType,
        ${UserFields.password} $textType,
        ${UserFields.email} $textType,
        ${UserFields.curr} $boolType,
        ${UserFields.fp} $boolType
      );
''');

    await db.execute('''
      CREATE TABLE $tablePP1 (
        ${PP1Fields.id} $idType,
        ${PP1Fields.username} $textType,
        ${PP1Fields.state} $textType
      );
''');

    await db.execute('''
      CREATE TABLE $tablePP2 (
        ${PP2Fields.id} $idType,
        ${PP2Fields.username} $textType,
        ${PP2Fields.state} $textType
      );
''');

    await db.execute('''
      CREATE TABLE $tableHP1 (
        ${HP1Fields.id} $idType,
        ${HP1Fields.username} $textType,
        ${HP1Fields.state} $textType
      );
''');

    await db.execute('''
      CREATE TABLE $tableHP2 (
        ${HP2Fields.id} $idType,
        ${HP2Fields.username} $textType,
        ${HP2Fields.state} $textType
      );
''');

    await db.execute('''
      CREATE TABLE $tablePhotos (
        ${PhotoFields.username} $textType,
        ${PhotoFields.path} $textType,
        ${PhotoFields.photo_name} $textType
      );
''');

    await db.execute('''
      CREATE TABLE $tableRatings (
        ${RatingFields.username} $textType,
        ${RatingFields.path} $textType,
        ${RatingFields.rate} $doubleType
      );
''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(String username, String password) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
          username: "", password: "", email: "", curr: false, fp: false);
    }
  }

  Future<bool> isFirstUser() async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
    );

    if (maps.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<User> readUsername(String username) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.username} = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
          username: "", password: "", email: "", curr: false, fp: false);
    }
  }

  Future<User> readEmail(String email) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.email} = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
          username: "", password: "", email: "", curr: false, fp: false);
    }
  }

  Future<User> readCurr() async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.curr} = ?',
      whereArgs: [1],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
          username: "", password: "", email: "", curr: false, fp: false);
    }
  }

  Future<User> readFPUser() async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.fp} = ?',
      whereArgs: [1],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
          username: "", password: "", email: "", curr: false, fp: false);
    }
  }

  Future<int> setCurrUser(User user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [user.username, user.password],
    );
  }

  Future<List<User>> readCurrUsers() async {
    final db = await instance.database;

    List<User> curr_users = [];

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.curr} = ?',
      whereArgs: [1],
    );

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        curr_users.add(User.fromJson(maps[i]));
      }
    }
    return curr_users;
  }

  Future setCurrUserstonormal(List<User> users) async {
    final db = await instance.database;
    for (int i = 0; i < users.length; i++) {
      User user = User(id: users[i].id, username: users[i].username, password: users[i].password, 
                      email: users[i].email, curr: false, fp: users[i].fp);
      await setCurrUser(user);
    }
  }

  Future deleteUser(String username, String password) async {
    final db = await instance.database;

    await db.delete(
      tableUsers,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );

    await db.delete(
      tablePhotos,
      where: '${PhotoFields.username} = ?',
      whereArgs: [username],
    );

    await db.delete(
      tableRatings,
      where: '${RatingFields.username} = ?',
      whereArgs: [username],
    );

    await db.delete(
      tableHP1,
      where: '${HP1Fields.username} = ?',
      whereArgs: [username],
    );

    await db.delete(
      tableHP2,
      where: '${HP2Fields.username} = ?',
      whereArgs: [username],
    );

    await db.delete(
      tablePP1,
      where: '${PP1Fields.username} = ?',
      whereArgs: [username],
    );

    await db.delete(
      tablePP2,
      where: '${PP2Fields.username} = ?',
      whereArgs: [username],
    );
  }

  Future<PP1forUser> createPP1forUser(PP1forUser p) async {
    final db = await instance.database;

    final id = await db.insert(tablePP1, p.toJson());
    log("Added parnitha path 1 for user (future paths)");
    return p.copy(id: id);
  }

  Future<PP2forUser> createPP2forUser(PP2forUser p) async {
    final db = await instance.database;

    final id = await db.insert(tablePP2, p.toJson());
    return p.copy(id: id);
  }

  Future<HP1forUser> createHP1forUser(HP1forUser p) async {
    final db = await instance.database;

    final id = await db.insert(tableHP1, p.toJson());
    return p.copy(id: id);
  }

  Future<HP2forUser> createHP2forUser(HP2forUser p) async {
    final db = await instance.database;

    final id = await db.insert(tableHP2, p.toJson());
    return p.copy(id: id);
  }

  Future<int> updPP1(PP1forUser p) async {
    final db = await instance.database;

    return db.update(
      tablePP1,
      p.toJson(),
      where: '${PP1Fields.username} = ?',
      whereArgs: [p.username],
    );
  }

  Future<int> updPP2(PP2forUser p) async {
    final db = await instance.database;

    return db.update(
      tablePP2,
      p.toJson(),
      where: '${PP2Fields.username} = ?',
      whereArgs: [p.username],
    );
  }

  Future<int> updHP1(HP1forUser p) async {
    final db = await instance.database;

    return db.update(
      tableHP1,
      p.toJson(),
      where: '${HP1Fields.username} = ?',
      whereArgs: [p.username],
    );
  }

  Future<int> updHP2(HP2forUser p) async {
    final db = await instance.database;

    return db.update(
      tableHP2,
      p.toJson(),
      where: '${HP2Fields.username} = ?',
      whereArgs: [p.username],
    );
  }

  Future<PP1forUser> readPP1state(User user) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePP1,
      columns: PP1Fields.values,
      where: '${PP1Fields.username} = ?',
      whereArgs: [user.username],
    );

    if (maps.isNotEmpty) {
      log("found PP1 for user");
      return PP1forUser.fromJson(maps.first);
    } else {
      return PP1forUser(username: "", state: "");
    }
  }

  Future<PP2forUser> readPP2state(User user) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePP2,
      columns: PP2Fields.values,
      where: '${PP2Fields.username} = ?',
      whereArgs: [user.username],
    );

    if (maps.isNotEmpty) {
      return PP2forUser.fromJson(maps.first);
    } else {
      return PP2forUser(username: "", state: "");
    }
  }

  Future<HP1forUser> readHP1state(User user) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHP1,
      columns: HP1Fields.values,
      where: '${HP1Fields.username} = ?',
      whereArgs: [user.username],
    );

    if (maps.isNotEmpty) {
      return HP1forUser.fromJson(maps.first);
    } else {
      return HP1forUser(username: "", state: "");
    }
  }

  Future<HP2forUser> readHP2state(User user) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHP2,
      columns: HP2Fields.values,
      where: '${HP2Fields.username} = ?',
      whereArgs: [user.username],
    );

    if (maps.isNotEmpty) {
      return HP2forUser.fromJson(maps.first);
    } else {
      return HP2forUser(username: "", state: "");
    }
  }

  Future<Photo> save(Photo p) async {
    final db = await instance.database;
    log("added photo to database with path " +
        p.path.toString() +
        " and username " +
        p.username);
    await db.insert(tablePhotos, p.toJson());
    return p.copy();
  }

  Future<List<Photo>> getPhotos(String username, String path) async {
    final db = await instance.database;
    List<Photo> photos = [];

    final maps = await db.query(
      tablePhotos,
      columns: PhotoFields.values,
      where: '${PhotoFields.username} = ? AND ${PhotoFields.path} = ?',
      whereArgs: [username, path],
    );

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(Photo.fromJson(maps[i]));
      }
    }
    return photos;
  }

  Future<Rating> readRating(String username, String path) async {
    final db = await instance.database;

    final maps = await db.query(
      tableRatings,
      columns: RatingFields.values,
      where: '${RatingFields.username} = ? AND ${RatingFields.path} = ?',
      whereArgs: [username, path],
    );

    if (maps.isNotEmpty) {
      return Rating.fromJson(maps.first);
    } else {
      return Rating(username: "", path: "", rate: -1);
    }
  }

  Future<List<Rating>> readRatingforPath(String path) async {
    final db = await instance.database;

    final result = await db.query(
      tableRatings,
      columns: RatingFields.values,
      where: '${RatingFields.path} = ?',
      whereArgs: [path],
    );

    return result.map((json) => Rating.fromJson(json)).toList();
  }

  Future<int> updRating(Rating r) async {
    final db = await instance.database;

    return db.update(
      tableRatings,
      r.toJson(),
      where: '${RatingFields.username} = ? AND ${RatingFields.path} = ?',
      whereArgs: [r.username, r.path],
    );
  }

  Future<Rating> createRating(Rating r) async {
    final db = await instance.database;

    final id = await db.insert(tableRatings, r.toJson());
    return r.copy();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
