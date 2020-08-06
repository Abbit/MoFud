import 'package:mofud/models/food_model.dart';
import 'package:mofud/models/category_model.dart';

final featuredFood = [
  Food(
      'Chicken legs',
      'https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/crispy-oven-roasted-chicken-leg-quarters-2552969.jpg',
      13.30,
      'chickshop',
      4.1,
      109),
  Food(
      'Cheeseburger',
      'https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/2019_df_retail_butter-burger_20912_760x580.jpg?ext=.jpg',
      4.99,
      'M&DC',
      4.7,
      705),
  Food(
      'California',
      'https://i1.wp.com/www.angsarap.net/wp-content/uploads/2018/02/California-Maki-Wide.jpg?fit=1080%2C720&ssl=1',
      4.50,
      'sushi shop',
      3.9,
      111),
];

final foodCategories = [
  Category('Pizza',
      'https://foodband.ru/images/catMob2k/wp-content/uploads/2016/09/842-original-1582099275.jpg'),
  Category('Burgers',
      'https://ipcdn.freshop.com/resize?url=https://images.freshop.com/1898839998484972093/6daed8915024961087631dedbc88919d_large.png&width=256&type=webp&quality=40'),
  Category('Chicken',
      'https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/crispy-oven-roasted-chicken-leg-quarters-2552969.jpg'),
  Category('Sushi',
      'https://kaiten-sushi.ru/image/data/ris/salati/supi/zr/seti/poke/2.jpg'),
  Category('Dessert',
      'https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/chocolatebourbonpecanpiecupcak-7a0db1.jpg'),
  Category('Wok',
      'https://tosi-bosi.ru/image/cache/catalog/content/03-category/guyakidonkorob-228x228-128x128.jpg'),
  Category('Salads',
      'https://readyseteat.com/sites/g/files/qyyrlu501/files/uploadedImages/img_2282_1550.JPEG'),
];

final foodList = [
  Food('Chicken legs', 'url', 13.30, 'chickshop', 4.1, 109),
  Food(
      'Cheeseburger',
      'https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/2019_df_retail_butter-burger_20912_760x580.jpg?ext=.jpg',
      4.99,
      'M&DC',
      4.7,
      705),
  Food('California', 'url', 4.50, 'sushi shop', 3.9, 111),
  Food('Pizza', 'url', 4.50, 'pizzeria', 3.9, 111),
  Food('Soup', 'url', 4.50, 'sushi shop', 3.9, 111),
  Food('Salad Caesar', 'url', 4.50, 'sushi shop', 3.9, 111),
  Food('Wok with chicken', 'url', 4.50, 'sushi shop', 3.9, 111),
  Food('Rice', 'url', 4.50, 'sushi shop', 3.9, 111),
  Food('Fish', 'url', 4.50, 'sushi shop', 3.9, 111),
];
