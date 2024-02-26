class Dishes {
  static List<Map<String, String>> dish = [
    {'name': 'Burger', 'imgUrl': 'burger.png', 'price': '600'},
    {'name': 'Biryani', 'imgUrl': 'biryani.png', 'price': '400'},
    {'name': 'Chinees', 'imgUrl': 'chinees.png', 'price': '600'},
    {'name': 'Sandwich', 'imgUrl': 'sandwich.png', 'price': '300'},
    {'name': 'Pizza', 'imgUrl': 'pizza.png', 'price': '900'},
    {'name': 'Cake', 'imgUrl': 'cake.png', 'price': '1100'},
    {'name': "Roll", 'imgUrl': 'roll.png', 'price': '200'},
    {'name': 'Pasta', 'imgUrl': 'pasta.png', 'price': '700'},
    {'name': 'Ice Cream', 'imgUrl': 'icecream.png', 'price': '400'}
  ];
  static Map<String, List> highlightedItems = {
    'hottest': [
      {'name': 'Burger', 'imgUrl': 'burger.png', 'price': '600'},
      {'name': 'Biryani', 'imgUrl': 'biryani.png', 'price': '400'},
      {'name': 'Chinees', 'imgUrl': 'chinees.png', 'price': '600'},
      {'name': 'Pizza', 'imgUrl': 'pizza.png', 'price': '900'}
    ],
    'popular': [
      {'name': 'Pizza', 'imgUrl': 'pizza.png', 'price': '900'},
      {'name': 'Cake', 'imgUrl': 'cake.png', 'price': '1100'},
      {'name': "Roll", 'imgUrl': 'roll.png', 'price': '200'},
      {'name': 'Pasta', 'imgUrl': 'pasta.png', 'price': '700'}
    ],
  };
}
