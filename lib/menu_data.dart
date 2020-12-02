class Store {
  String storeTitle;
  String rating;
  String image;
  String location;
  Store({this.storeTitle, this.rating, this.image, this.location});
}

class StoreData {
  int storyLevel = 0;
  List<Store> storeDB = [
    Store(
        //0
        storeTitle: 'Gringos Burrito Grill',
        rating: '3',
        image: 'images/Gringos.jpg',
        location: 'Zamalek'),
    Store(
        //1
        storeTitle: 'Mezcal',
        rating: '5',
        image: 'images/mezcal.png',
        location: 'Zamalek'),
    Store(
        //2
        storeTitle: 'Tacos Mexican Food',
        rating: '4',
        image: 'images/tacos.jpg',
        location: 'Maadi'),
    Store(
        //3
        storeTitle: 'El Chico',
        rating: "5",
        image: 'images/elchico.jpeg',
        location: 'Nasr City'),
    Store(
        //4
        storeTitle: 'CaiRoma',
        rating: "4",
        image: 'images/cairoma.jpg',
        location: 'Nasr City'),
    Store(
        //5
        storeTitle: 'Osmanly Restaurant',
        rating: "4",
        image: 'images/osmanly.jpeg',
        location: 'Abdeen'),
  ];

  List getData(int level) {
    return [
      storeDB[level].storeTitle,
      storeDB[level].rating,
      storeDB[level].image,
      storeDB[level].location
    ];
  }
}
