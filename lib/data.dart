class DataList {
  //create a list of dummy data
  static List<String> dataList = ['item 1', 'item 2', 'item 3', 'item 4'];

  Future<List<String>> gitListData() async {
    // Simulate a delay of 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    // Return the dataList after the delay
    return dataList;
  }
}
