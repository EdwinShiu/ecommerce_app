class BigCategoryList {

  List<BigCategory> _categories;
  int bigCategoryIndex, categoryIndex;

  BigCategoryList(this._categories);

  factory BigCategoryList.fromJsonList(List categoriesListInJson) {
    //print("categoriesListInJson " + categoriesListInJson.toString() + " " + categoriesListInJson.runtimeType.toString());
    List<BigCategory> temp = List<BigCategory>.from(categoriesListInJson.map((bigCategory) {
      if (bigCategory["categoryList"] == null) {
        return BigCategory(name: null, categories: [Category(name: null, subCategories: [SubCategory(name: null, number: null)])]);
      }
      return BigCategory(
        name: bigCategory["name"].toString(),
        categories: List<Category>.from(bigCategory["categoryList"].map((category) {
          if (category["categoryList"] == null) {
            return Category(name: null, subCategories: [SubCategory(name: null, number: null)]);
          }
          return Category(
            name: category["name"].toString(),
            subCategories: List<SubCategory>.from(category["categoryList"].map((subCategory) {
              return SubCategory(
                name: subCategory["name"].toString(),
                number: subCategory["numberOfProducts"].toString(),
              );
            })),
          );
        })),
      );
    }));
    return BigCategoryList(temp);
  }

  List<BigCategory> get bigCategory => _categories;

  List<SubCategory> get subCategoryList {
    if (bigCategoryIndex == null || categoryIndex == null) {
      return null;
    }
    return _categories[bigCategoryIndex].categories[categoryIndex].subCategories;
  }

  String toString() {
    String temp = "List:\n";
    for(final element in _categories) {
      temp += element.toString();
    }
    return temp;
  }

}

class BigCategory {

  final String name;
  final List<Category> categories;

  BigCategory({this.name, this.categories});

  @override
  String toString() {
    String temp = "Big Category Name: $name\n";
    for (int i = 0; i < categories.length; i++) {
      temp += "$i: " + categories[i].toString();
    }
    return temp;
  }
}

class Category {
  final String name;
  final List<SubCategory> subCategories;

  Category({this.name, this.subCategories});

  @override
  String toString() {
    String temp = "Category Name: $name\n";
    for (int i = 0; i < subCategories.length; i++) {
      temp += "$i: " + subCategories[i].toString();
    }
    return temp;
  }

}

class SubCategory {
  final String name;
  final String number;

  SubCategory({this.name, this.number});

  int get numberOfProduct {
    return int.parse(number);
  }

  @override
  String toString() {
    return "Name: $name, numberOfProduct: $number\n";
  }
}