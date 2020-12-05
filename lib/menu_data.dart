class Store {
  String storeTitle;
  double  rating;
  String image;
  String location;
  String number;
  String review;

  Store(
      {this.storeTitle,
      this.rating,
      this.image,
      this.location,
      this.number,
      this.review});
}

class StoreData {
  int storyLevel = 0;
  List<Store> storeDB = [
    Store(
      //0
      storeTitle: 'Gringos Burrito Grill',
      rating: 1.0,
      image: 'images/Gringos.jpg',
      location: 'Zamalek',
      number: '19734',
      review: 'Good restaurant',
    ),
    Store(
        //1
        storeTitle: 'Mezcal',
        rating: 5,
        image: 'images/mezcal.png',
        location: 'Zamalek',
        number: '19742',
        review: 'Good restaurant'),
    Store(
        //2
        storeTitle: 'Tacos Mexican Food',
        rating: 4,
        image: 'images/tacos.jpg',
        location: 'Maadi',
        number: '19792',
        review: 'Good restaurant'),
    Store(
        //3
        storeTitle: 'El Chico',
        rating: 5,
        image: 'images/elchico.jpeg',
        location: 'Nasr City',
        number: '19233',
        review: 'Good restaurant'),
    Store(
        //4
        storeTitle: 'CaiRoma',
        rating:1,
        image: 'images/cairoma.jpg',
        location: 'Nasr City',
        number: '19242',
        review: 'Good restaurant'),
    Store(
        //5
        storeTitle: 'Osmanly Restaurant',
        rating: 2,
        image: 'images/osmanly.jpeg',
        location: 'Abdeen',
        number: '19432',
        review: 'Good restaurant'),
  ];

  List getData(int level) {
    return [
      storeDB[level].storeTitle,
      storeDB[level].rating,
      storeDB[level].image,
      storeDB[level].location,
      storeDB[level].number,
      storeDB[level].review
    ];
  }
}
