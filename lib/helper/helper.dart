// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../global/global.dart';
import '../modals/modals.dart';

class QuotesDBHelper {
  QuotesDBHelper._();

  static final QuotesDBHelper quotesDBHelper = QuotesDBHelper._();

  final String dbname = 'data.db';
  final String tableName = 'quotes';
  final String colQuotes = 'id';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?tags=happiness";
  Future<List<Map<String, dynamic>>?> fetchAllQuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);

      Quotes? quotes = Quotes.fromJson(json: decodeData);

      List getAll = quotes.allQuotes.map((e) => e['content']).toList();
      getAll.map((e) async {
        await QuotesDBHelper.quotesDBHelper.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.all = await db!.rawQuery(query);

      return Global.all;
    }
    return null;
  }
}

class LifeQuotesDBHelper {
  LifeQuotesDBHelper._();

  static final LifeQuotesDBHelper lifeQuotesDBHelper = LifeQuotesDBHelper._();

  final String dbname = 'data2.db';
  final String tableName = 'quotes2';
  final String colQuotes = 'id2';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?tags=life";
  Future<List<Map<String, dynamic>>?> fetchAllLifeQuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      LifeQuotes? lifeQuotes = LifeQuotes.fromJson(json: decodeData);

      List getAll = lifeQuotes.lifeQuotes.map((e) => e['content']).toList();
      getAll.map((e) async {
        await LifeQuotesDBHelper.lifeQuotesDBHelper.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.lifeQuotes = await db!.rawQuery(query);

      return Global.lifeQuotes;
    }
    return null;
  }
}

class LoveQuotesDBHelper {
  LoveQuotesDBHelper._();

  static final LoveQuotesDBHelper loveQuotesDBHelper = LoveQuotesDBHelper._();

  final String dbname = 'data3.db';
  final String tableName = 'quotes3';
  final String colQuotes = 'id3';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?tags=love";
  Future<List<Map<String, dynamic>>?> fetchAllLoveQuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      LoveQuotes? loveQuotes = LoveQuotes.fromJson(json: decodeData);

      List getAll = loveQuotes.loveQuotes.map((e) => e['content']).toList();
      getAll.map((e) async {
        await LoveQuotesDBHelper.loveQuotesDBHelper.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.loveQuotes = await db!.rawQuery(query);

      return Global.loveQuotes;
    }
    return null;
  }
}

class SuccessQuotesDBHelper {
  SuccessQuotesDBHelper._();

  static final SuccessQuotesDBHelper successQuotesDBHelper =
      SuccessQuotesDBHelper._();

  final String dbname = 'data4.db';
  final String tableName = 'quotes4';
  final String colQuotes = 'id4';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?tags=success";
  Future<List<Map<String, dynamic>>?> fetchAllSuccessQuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      SuccessQuotes? successQuotes = SuccessQuotes.fromJson(json: decodeData);

      List getAll =
          successQuotes.successQuotes.map((e) => e['content']).toList();
      getAll.map((e) async {
        await SuccessQuotesDBHelper.successQuotesDBHelper.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.successQuotes = await db!.rawQuery(query);

      return Global.successQuotes;
    }
    return null;
  }
}

class AuthorQuotesDBHelper1 {
  AuthorQuotesDBHelper1._();

  static final AuthorQuotesDBHelper1 authorquotesDBHelper1 =
      AuthorQuotesDBHelper1._();

  final String dbname = 'data5.db';
  final String tableName = 'quotes5';
  final String colQuotes = 'id5';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?author=Albert-einstein";
  Future<List<Map<String, dynamic>>?> fetchAllAuthor1QuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      AuthorQuotes1? authorQuotes1 = AuthorQuotes1.fromJson(json: decodeData);

      List getAll =
          authorQuotes1.authorQuotes1.map((e) => e['content']).toList();
      getAll.map((e) async {
        await AuthorQuotesDBHelper1.authorquotesDBHelper1.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.authorQuotes1 = await db!.rawQuery(query);

      return Global.authorQuotes1;
    }
    return null;
  }
}

class AuthorQuotesDBHelper2 {
  AuthorQuotesDBHelper2._();

  static final AuthorQuotesDBHelper2 authorquotesDBHelper2 =
      AuthorQuotesDBHelper2._();

  final String dbname = 'data6.db';
  final String tableName = 'quotes6';
  final String colQuotes = 'id6';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?author=Eckhart Tolle";
  Future<List<Map<String, dynamic>>?> fetchAllAuthor2QuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      AuthorQuotes2? authorQuotes2 = AuthorQuotes2.fromJson(json: decodeData);

      List getAll =
          authorQuotes2.authorQuotes2.map((e) => e['content']).toList();
      getAll.map((e) async {
        await AuthorQuotesDBHelper2.authorquotesDBHelper2.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.authorQuotes2 = await db!.rawQuery(query);

      return Global.authorQuotes2;
    }
    return null;
  }
}

class AuthorQuotesDBHelper3 {
  AuthorQuotesDBHelper3._();

  static final AuthorQuotesDBHelper3 authorQuotesDBHelper3 =
      AuthorQuotesDBHelper3._();

  final String dbname = 'data7.db';
  final String tableName = 'quotes7';
  final String colQuotes = 'id7';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?author=William Shakespeare";
  Future<List<Map<String, dynamic>>?> fetchAllAuthor3QuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      AuthorQuotes3? authorQuotes3 = AuthorQuotes3.fromJson(json: decodeData);

      List getAll =
          authorQuotes3.authorQuotes3.map((e) => e['content']).toList();
      getAll.map((e) async {
        await AuthorQuotesDBHelper3.authorQuotesDBHelper3.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.authorQuotes3 = await db!.rawQuery(query);

      return Global.authorQuotes3;
    }
    return null;
  }
}

class AuthorQuotesDBHelper4 {
  AuthorQuotesDBHelper4._();

  static final AuthorQuotesDBHelper4 authorQuotesDBHelper4 =
      AuthorQuotesDBHelper4._();

  final String dbname = 'data8.db';
  final String tableName = 'quotes8';
  final String colQuotes = 'id8';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbname);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colQuotes TEXT);";
      await db.execute(query);
    });
  }

  Future<void> insertRecord({required String sent}) async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;
    if (isInserted == false) {
      String query = "INSERT INTO $tableName ($colQuotes)VALUES(?);";
      List args = [sent];
      await db!.rawInsert(query, args);
    }
    prefs.setBool(tableName, true);
  }

  final String URL = "https://quotable.io/quotes?author=Tony Robbins";
  Future<List<Map<String, dynamic>>?> fetchAllAuthor4QuotesData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      AuthorQuotes4? authorQuotes4 = AuthorQuotes4.fromJson(json: decodeData);

      List getAll =
          authorQuotes4.authorQuotes4.map((e) => e['content']).toList();
      getAll.map((e) async {
        await AuthorQuotesDBHelper4.authorQuotesDBHelper4.insertRecord(sent: e);
      }).toList();

      await initDB();
      String query = "SELECT * FROM $tableName";

      Global.authorQuotes4 = await db!.rawQuery(query);

      return Global.authorQuotes4;
    }
    return null;
  }
}
