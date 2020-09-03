// Temporary Storage of App Data
import 'package:flutter/cupertino.dart';

import './product.dart';

class FavouriteNotifier extends ChangeNotifier{
  List<ItemList> _favouriteList = [];

  List<ItemList> get getFavouriteList => _favouriteList;

  void addFavouriteItem(ItemList itemList) {
    if (_favouriteList.indexOf(itemList) == -1) {
      _favouriteList.add(itemList);
    }
    notifyListeners();
    //print(_favouriteList);
  }

  void removeFavouriteItem(ItemList itemList) {
    _favouriteList.remove(itemList);
    notifyListeners();
    //print(_favouriteList);
  }

  void toggleFavouriteItem(ItemList itemList) {
    if (_favouriteList.indexOf(itemList) == -1) {
      _favouriteList.add(itemList);
      print("add");
    }
    else {
      _favouriteList.remove(itemList);
      print("removed");
    }
    notifyListeners();
  }

  int getLength() {
    return _favouriteList.length;
  }

  bool isInFav(ItemList itemlist) {
    if (_favouriteList.indexOf(itemlist) != -1) {
      return true;
    }
    return false;
  }

}




const List<List<Map>> categoryImage = [[{'imagePath': 'assets/images/Television_01.png', 'itemName': 'Televisions'},
                                        {'imagePath': 'assets/images/SoundBar_01.png', 'itemName': 'Home Theater & Sound Bars'},
                                        {'imagePath': 'assets/images/BluRay_01.png', 'itemName': 'Blu-Ray Disc & DVD Players'}],
                                       [{'imagePath': 'assets/images/Headphones_01.png', 'itemName': 'Headphones'},
                                        {'imagePath': 'assets/images/MP3Player_01.png', 'itemName': 'MP3 Players'},
                                        {'imagePath': 'assets/images/High-ResolutionAudio_01.png', 'itemName': 'High-Resolution Audio'},
                                        {'imagePath': 'assets/images/WirelessSpeakers_01.png', 'itemName': 'Wireless Speakers'},],
                                       [{'imagePath': 'assets/images/Interchangeable-lensCameras_01.png', 'itemName': 'Interchangable-lens Cameras'},
                                        {'imagePath': 'assets/images/Lenses_01.png', 'itemName': 'Lenses'},
                                        {'imagePath': 'assets/images/CompactCameras_01.png', 'itemName': 'Compact Cameras'},],
                                       [{'imagePath': 'assets/images/Smartphones_01.png', 'itemName': 'Smartphones'},
                                        {'imagePath': 'assets/images/SmartphonesAccessories_01.png', 'itemName': 'Accessories'},],
                                       [{'imagePath': 'assets/images/Camcorders_01.png', 'itemName': 'Camcorders'},
                                        {'imagePath': 'assets/images/ActionCamera_01.png', 'itemName': 'Action Cameras'},
                                        {'imagePath': 'assets/images/ProfessionalCamcorders_01.png', 'itemName': 'Professional Camcorders'},],
                                       [{'imagePath': 'assets/images/MemoryCardsSSD_01.png', 'itemName': 'Memory Cards & SSD'},
                                        {'imagePath': 'assets/images/Cables_01.png', 'itemName': 'Cables'},],
                                       [{'imagePath': 'assets/images/FashionEntertainments_01.png', 'itemName': 'Fashion Entertainments'},]
                                      ];
