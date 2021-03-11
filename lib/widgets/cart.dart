class Food {
  var name;
  var image;
  int count = 1;
  var price;

  updateIncrement() {
    count = count + 1;
  }

  updateDecrement() {
    if (count > 0) {
      count = count - 1;
    }
  }
}

