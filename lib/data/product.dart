class Products {
  final List<CategoryProduct> products;

  Products(this.products);

  factory Products.fromJsonList(List json) {
    //print(json);
    List<CategoryProduct> temp = List<CategoryProduct>.from(json.map((categoryProduct) {
      return CategoryProduct(
        category: categoryProduct["category"],
        itemList: List<ItemList>.from(categoryProduct["productList"].map((items) {
          return ItemList(
            item: List<Item>.from(items["itemList"].map((item) {
              return Item(
                id: item["id"].toString(),
                image: item["image"].toString(),
                price: item["price"].toString(),
                releaseDate: item["releaseDate"].toString(),
                subtitle: item["subtitle"].toString(),
                title: item["title"].toString(),
                stock: int.parse(item["stock"].toString()),
                description: List<String>.from(item["description"]),
                subCategory: List<String>.from(item["subCategory"]),
              );
            })),
          );
        })),
      );
    }));
    return Products(temp);
  }


  @override
  String toString() {
    String temp = "Products\n";
    for (final element in products) {
      temp += element.toString() + "\n";
    }
    return temp;
  }
}

class CategoryProduct {
  final String category;
  final List<ItemList> itemList;

  CategoryProduct({this.category, this.itemList});

  @override
  String toString() {
    String temp = "Category: $category\n";
    for (int i = 0; i < itemList.length; i++) {
      temp += "$i. " + itemList[i].toString() + "\n";
    }
    return temp;
  }
}

class ItemList {
  final List<Item> item;

  ItemList({this.item});

  @override
  String toString() {
    String temp = "Variation: \n";
    for (int i = 0; i < item.length; i++) {
      temp += "$i. " + item[i].toString() + "\n";
    }
    return temp;
  }
}

class Item {
  final String id, image, price, subtitle, title, releaseDate;
  final int stock;
  final List<String> description, subCategory;

  Item({this.id, this.image, this.price, this.subtitle, this.title, this.releaseDate, this.stock, this.description, this.subCategory});

  @override
  String toString() {
    String temp = "id: $id, image: $image, price: $price, subtitle: $subtitle, title: $title, releaseDate: $releaseDate, stock: ${stock.toString()}, description: ${description.toString()}, subCategory: ${subCategory.toString()}\n";
    return temp;
  }
}
