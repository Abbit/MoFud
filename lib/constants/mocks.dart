import 'package:mofud/models/category_model.dart';
import 'package:mofud/models/dish_model.dart';

class AppMocks {
  AppMocks._();

  static final List<Category> categories = [
    Category(
      title: 'Pizza',
      imageUrl:
          'https://foodband.ru/images/catMob2k/wp-content/uploads/2016/09/842-original-1582099275.jpg',
    ),
    Category(
      title: 'Burgers',
      imageUrl:
          'https://i.pinimg.com/originals/12/6c/00/126c00315061c37544409c60931d6bdb.jpg',
    ),
    Category(
      title: 'Chicken',
      imageUrl:
          'https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/crispy-oven-roasted-chicken-leg-quarters-2552969.jpg',
    ),
    Category(
      title: 'Rolls',
      imageUrl:
          'https://kaiten-sushi.ru/image/data/ris/salati/supi/zr/seti/poke/2.jpg',
    ),
    Category(
      title: 'Desserts',
      imageUrl:
          'https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/chocolatebourbonpecanpiecupcak-7a0db1.jpg',
    ),
    Category(
      title: 'Woks',
      imageUrl:
          'https://tosi-bosi.ru/image/cache/catalog/content/03-category/guyakidonkorob-228x228-128x128.jpg',
    ),
    Category(
      title: 'Salads',
      imageUrl:
          'https://readyseteat.com/sites/g/files/qyyrlu501/files/uploadedImages/img_2282_1550.JPEG',
    ),
  ];
  static final List<Dish> dishes = [
    Dish(
      id: 1,
      title: 'Chicken legs',
      price: 4.9,
      subtitle: '',
      imageUrl:
          'https://cdn.momsdish.com/wp-content/uploads/2019/04/Baked-Chicken-Legs-02-scaled.jpg',
      rating: 4.1,
      ratingsCount: 109,
    ),
    Dish(
      id: 2,
      title: 'Pizza',
      price: 4.99,
      subtitle: '',
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/15/2d/23/07/domino-s-pizza.jpg',
      rating: 3.9,
      ratingsCount: 111,
    ),
    Dish(
      id: 3,
      title: 'Cheeseburger',
      price: 0.99,
      subtitle: '',
      imageUrl:
          'https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/2019_df_retail_butter-burger_20912_760x580.jpg?ext=.jpg',
      rating: 4.7,
      ratingsCount: 705,
    ),
    Dish(
      id: 4,
      title: 'California',
      price: 4.3,
      subtitle: 'Rolls',
      imageUrl:
          'https://natashaskitchen.com/wp-content/uploads/2013/10/Sushi-Rice-California-Rolls-Recipe-2-2-500x500.jpg',
      rating: 3.8,
      ratingsCount: 103,
    ),
    Dish(
      id: 5,
      title: 'Dak Gomtang',
      price: 6.5,
      subtitle: 'Korean soup',
      imageUrl:
          'https://www.koreanbapsang.com/wp-content/uploads/2014/02/dak-gomtang.jpg',
      rating: 4.3,
      ratingsCount: 35,
    ),
    Dish(
      id: 6,
      title: 'Caesar',
      price: 2.99,
      subtitle: 'Salad',
      imageUrl:
          'https://www.fifteenspatulas.com/wp-content/uploads/2011/10/Caesar-Salad-Fifteen-Spatulas-3.jpg',
      rating: 4.1,
      ratingsCount: 12,
    ),
    Dish(
      id: 7,
      title: 'Wok with chicken',
      price: 1.99,
      subtitle: '',
      imageUrl:
          'https://www.skinnytaste.com/wp-content/uploads/2018/04/General-Tsos-Chicken-1-4.jpg',
      rating: 4.4,
      ratingsCount: 213,
    ),
  ];
}
