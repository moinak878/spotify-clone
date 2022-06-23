// CRUD done over here
import '../models/category.dart';
class CategoryOperations{
  CategoryOperations._(){} // private constructor - access only within library
  static List<Category> getCategories(){
    return <Category> [
      Category("Top Hits", "https://icons-for-free.com/download-icon-media+music+playlist+radio+social+songs+spotify+icon-1320137109725506614_256.png"),
      Category("Lockdown Love", "https://icons-for-free.com/download-icon-media+music+playlist+radio+social+songs+spotify+icon-1320137109725506614_256.png"),
      Category("Indie Pop", "https://i3.wp.com/filecr.com/wp-content/uploads/2021/06/tuneskit-spotify-converter-for-mac-logo.png"),
      Category("Bollywood", "https://i3.wp.com/filecr.com/wp-content/uploads/2021/06/tuneskit-spotify-converter-for-mac-logo.png"),
    ];
  }
}