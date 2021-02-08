import 'package:flutter/material.dart';

class CuisinePage extends StatefulWidget {
  @override
  __CuisinePageState createState() => __CuisinePageState();
}

class __CuisinePageState extends State<CuisinePage> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          ///adding search bar here
          title: !isSearch
              ? Text('Cuisines')
              : TextField(
                  decoration:
                      InputDecoration(hintText: 'Search For Cusines Here'),
                ),
          actions: <Widget>[
            isSearch
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        this.isSearch = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        this.isSearch = true;
                      });
                    })
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                'Choose from our wide range of cusines',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {},
                  child: Text(
                    'Indian',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'Chinese',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'Italian',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'Oriental',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'Mexican',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

///////

//class Stores with ChangeNotifier {
//static const baseUrl =
//"https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/";

//List<Store> _storeDB = [];
//String authToken;
//String userId;

//Stores(this.authToken, this.userId, this._storeDB);
//List<Store> get items {
//return [..._storeDB];
//}

//List<Store> get favoriteItems {
//return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
//}

//Store findById(String id) {
//return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
//

//Future<void> fetchAndSetStores({bool filterByUser =false}) async {
// final filterString =
//  filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';
//const url =
//'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
//var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
//try {
//final response = await http.get(url);
//final dbData = json.decode(response.body) as Map<String, dynamic>;

// final List<Store> loadedStores = [];
//dbData.forEach((storeId, data) {
//loadedStores.add(Store(
//storeTitle: data['storeTitle'],
//rating: data['rating'],
//location: data['location'],
//number: data['number'],
//image: data['image'],
//));
// });
//_storeDB = loadedStores;
//notifyListeners();
//} catch (error) {
//throw (error);
// }
//}

//  Future<void> addStore(Store store) async {
//   final url = '$baseUrl/stores.json?auth=$authToken';

//    try{
//final response= await http.post(url,
//       body: json.encode({
//       'storeTitle': store.storeTitle,
//     // 'rating': store.rating,
//   'location': store.location,
// 'number': store.number,
//'image': store.image,
//}),
//);

//   final newStore = Store(
//     storeTitle: store.storeTitle,
// rating: store.rating,
//   location: store.image,
// number: store.number,
// image: store.image,
//id: json.decode(response.body)['name']);

//      _storeDB.add(newStore);
//    notifyListeners();
//}
//).catchError
//catch(error) {
//print(error);
//throw error;
// }
//);
//}

//  Future<void> updateStore(int id, Store newStore) async {
// final url =
//     'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores/$id.json';

// final storeIndex = _storeDB.indexWhere((store) => store.id == id);
// if (storeIndex >= 0) {
//   await http.patch(url,
//       body: json.encode({
//         'id': newStore.id,
//         'storeTitle': newStore.storeTitle,
//         'rating': newStore.rating,
//         'location': newStore.location,
//         'number': newStore.number,
//         'image': newStore.image,
//       }));
//   _storeDB[storeIndex] = newStore;
//   notifyListeners();
// }
//final strIndex = _storeDB.indexWhere((str) => str.id == id);
//if (strIndex >= 0) {
//final url = '$baseUrl/stores/$id.json?auth=$authToken';
// await http.patch(url,
//   body: json.encode({
//  'id': newStore.id,
// 'storeTitle': newStore.storeTitle,
//   'rating': newStore.rating,
// 'location': newStore.location,
//      'number': newStore.number,
//    'image': newStore.image,
//}));
// _storeDB[strIndex] = newStore;
// notifyListeners();
//} else {
//print('...');
//}
//}
//delete na2sa

//  void receiveToken(Auth auth, List<Store> items) {
//   authToken = auth.token;
// userId = auth.userId;
//  print('Products receiveToken, userId: $userId');
//_storeDB = items;
//}
//}

//class Stores with ChangeNotifier {
//static const baseUrl =
//"https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/";

//List<Store> _storeDB = [];
//String authToken;
//String userId;

//Stores(this.authToken, this.userId, this._storeDB);
//List<Store> get items {
//return [..._storeDB];
//}

//List<Store> get favoriteItems {
//return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
//}

//Store findById(String id) {
//return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
//

//Future<void> fetchAndSetStores({bool filterByUser =false}) async {
// final filterString =
//  filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';
//const url =
//'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
//var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
//try {
//final response = await http.get(url);
//final dbData = json.decode(response.body) as Map<String, dynamic>;

// final List<Store> loadedStores = [];
//dbData.forEach((storeId, data) {
//loadedStores.add(Store(
//storeTitle: data['storeTitle'],
//rating: data['rating'],
//location: data['location'],
//number: data['number'],
//image: data['image'],
//));
// });
//_storeDB = loadedStores;
//notifyListeners();
//} catch (error) {
//throw (error);
// }
//}

//  Future<void> addStore(Store store) async {
//   final url = '$baseUrl/stores.json?auth=$authToken';

//    try{
//final response= await http.post(url,
//       body: json.encode({
//       'storeTitle': store.storeTitle,
//     // 'rating': store.rating,
//   'location': store.location,
// 'number': store.number,
//'image': store.image,
//}),
//);

//   final newStore = Store(
//     storeTitle: store.storeTitle,
// rating: store.rating,
//   location: store.image,
// number: store.number,
// image: store.image,
//id: json.decode(response.body)['name']);

//      _storeDB.add(newStore);
//    notifyListeners();
//}
//).catchError
//catch(error) {
//print(error);
//throw error;
// }
//);
//}

//  Future<void> updateStore(int id, Store newStore) async {
// final url =
//     'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores/$id.json';

// final storeIndex = _storeDB.indexWhere((store) => store.id == id);
// if (storeIndex >= 0) {
//   await http.patch(url,
//       body: json.encode({
//         'id': newStore.id,
//         'storeTitle': newStore.storeTitle,
//         'rating': newStore.rating,
//         'location': newStore.location,
//         'number': newStore.number,
//         'image': newStore.image,
//       }));
//   _storeDB[storeIndex] = newStore;
//   notifyListeners();
// }
//final strIndex = _storeDB.indexWhere((str) => str.id == id);
//if (strIndex >= 0) {
//final url = '$baseUrl/stores/$id.json?auth=$authToken';
// await http.patch(url,
//   body: json.encode({
//  'id': newStore.id,
// 'storeTitle': newStore.storeTitle,
//   'rating': newStore.rating,
// 'location': newStore.location,
//      'number': newStore.number,
//    'image': newStore.image,
//}));
// _storeDB[strIndex] = newStore;
// notifyListeners();
//} else {
//print('...');
//}
//}
//delete na2sa

//  void receiveToken(Auth auth, List<Store> items) {
//   authToken = auth.token;
// userId = auth.userId;
//  print('Products receiveToken, userId: $userId');
//_storeDB = items;
//}
//}

//class Stores with ChangeNotifier {
//static const baseUrl =
//"https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/";

//List<Store> _storeDB = [];
//String authToken;
//String userId;

//Stores(this.authToken, this.userId, this._storeDB);
//List<Store> get items {
//return [..._storeDB];
//}

//List<Store> get favoriteItems {
//return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
//}

//Store findById(String id) {
//return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
//

//Future<void> fetchAndSetStores({bool filterByUser =false}) async {
// final filterString =
//  filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';
//const url =
//'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
//var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
//try {
//final response = await http.get(url);
//final dbData = json.decode(response.body) as Map<String, dynamic>;

// final List<Store> loadedStores = [];
//dbData.forEach((storeId, data) {
//loadedStores.add(Store(
//storeTitle: data['storeTitle'],
//rating: data['rating'],
//location: data['location'],
//number: data['number'],
//image: data['image'],
//));
// });
//_storeDB = loadedStores;
//notifyListeners();
//} catch (error) {
//throw (error);
// }
//}

//  Future<void> addStore(Store store) async {
//   final url = '$baseUrl/stores.json?auth=$authToken';

//    try{
//final response= await http.post(url,
//       body: json.encode({
//       'storeTitle': store.storeTitle,
//     // 'rating': store.rating,
//   'location': store.location,
// 'number': store.number,
//'image': store.image,
//}),
//);

//   final newStore = Store(
//     storeTitle: store.storeTitle,
// rating: store.rating,
//   location: store.image,
// number: store.number,
// image: store.image,
//id: json.decode(response.body)['name']);

//      _storeDB.add(newStore);
//    notifyListeners();
//}
//).catchError
//catch(error) {
//print(error);
//throw error;
// }
//);
//}

//  Future<void> updateStore(int id, Store newStore) async {
// final url =
//     'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores/$id.json';

// final storeIndex = _storeDB.indexWhere((store) => store.id == id);
// if (storeIndex >= 0) {
//   await http.patch(url,
//       body: json.encode({
//         'id': newStore.id,
//         'storeTitle': newStore.storeTitle,
//         'rating': newStore.rating,
//         'location': newStore.location,
//         'number': newStore.number,
//         'image': newStore.image,
//       }));
//   _storeDB[storeIndex] = newStore;
//   notifyListeners();
// }
//final strIndex = _storeDB.indexWhere((str) => str.id == id);
//if (strIndex >= 0) {
//final url = '$baseUrl/stores/$id.json?auth=$authToken';
// await http.patch(url,
//   body: json.encode({
//  'id': newStore.id,
// 'storeTitle': newStore.storeTitle,
//   'rating': newStore.rating,
// 'location': newStore.location,
//      'number': newStore.number,
//    'image': newStore.image,
//}));
// _storeDB[strIndex] = newStore;
// notifyListeners();
//} else {
//print('...');
//}
//}
//delete na2sa

//  void receiveToken(Auth auth, List<Store> items) {
//   authToken = auth.token;
// userId = auth.userId;
//  print('Products receiveToken, userId: $userId');
//_storeDB = items;
//}
//}

//class Stores with ChangeNotifier {
//static const baseUrl =
//"https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/";

//List<Store> _storeDB = [];
//String authToken;
//String userId;

//Stores(this.authToken, this.userId, this._storeDB);
//List<Store> get items {
//return [..._storeDB];
//}

//List<Store> get favoriteItems {
//return _storeDB.where((storeTitle) => storeTitle.isFavorite).toList();
//}

//Store findById(String id) {
//return _storeDB.firstWhere((storeTitle) => storeTitle.id == id);
//

//Future<void> fetchAndSetStores({bool filterByUser =false}) async {
// final filterString =
//  filterByUser ? 'orderBy="ownerId"&equalTo="$userId"' : '';
//const url =
//'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores.json';
//var url = '$baseUrl/stores.json?auth=$authToken&$filterString';
//try {
//final response = await http.get(url);
//final dbData = json.decode(response.body) as Map<String, dynamic>;

// final List<Store> loadedStores = [];
//dbData.forEach((storeId, data) {
//loadedStores.add(Store(
//storeTitle: data['storeTitle'],
//rating: data['rating'],
//location: data['location'],
//number: data['number'],
//image: data['image'],
//));
// });
//_storeDB = loadedStores;
//notifyListeners();
//} catch (error) {
//throw (error);
// }
//}

//  Future<void> addStore(Store store) async {
//   final url = '$baseUrl/stores.json?auth=$authToken';

//    try{
//final response= await http.post(url,
//       body: json.encode({
//       'storeTitle': store.storeTitle,
//     // 'rating': store.rating,
//   'location': store.location,
// 'number': store.number,
//'image': store.image,
//}),
//);

//   final newStore = Store(
//     storeTitle: store.storeTitle,
// rating: store.rating,
//   location: store.image,
// number: store.number,
// image: store.image,
//id: json.decode(response.body)['name']);

//      _storeDB.add(newStore);
//    notifyListeners();
//}
//).catchError
//catch(error) {
//print(error);
//throw error;
// }
//);
//}

//  Future<void> updateStore(int id, Store newStore) async {
// final url =
//     'https://wise-food-default-rtdb.europe-west1.firebasedatabase.app/stores/$id.json';

// final storeIndex = _storeDB.indexWhere((store) => store.id == id);
// if (storeIndex >= 0) {
//   await http.patch(url,
//       body: json.encode({
//         'id': newStore.id,
//         'storeTitle': newStore.storeTitle,
//         'rating': newStore.rating,
//         'location': newStore.location,
//         'number': newStore.number,
//         'image': newStore.image,
//       }));
//   _storeDB[storeIndex] = newStore;
//   notifyListeners();
// }
//final strIndex = _storeDB.indexWhere((str) => str.id == id);
//if (strIndex >= 0) {
//final url = '$baseUrl/stores/$id.json?auth=$authToken';
// await http.patch(url,
//   body: json.encode({
//  'id': newStore.id,
// 'storeTitle': newStore.storeTitle,
//   'rating': newStore.rating,
// 'location': newStore.location,
//      'number': newStore.number,
//    'image': newStore.image,
//}));
// _storeDB[strIndex] = newStore;
// notifyListeners();
//} else {
//print('...');
//}
//}
//delete na2sa

//  void receiveToken(Auth auth, List<Store> items) {
//   authToken = auth.token;
// userId = auth.userId;
//  print('Products receiveToken, userId: $userId');
//_storeDB = items;
//}
//}
