import 'package:get/get.dart';
import 'package:myapps/models/model_movie.dart';


class MovieController extends GetxController {
  var movieList = <Movie>[].obs; 

  @override
  void onInit() {
    super.onInit();

    fetchMovies();
  }

  void fetchMovies() {
    var fetchedMovies = [
      Movie(image: 'assets/poster3.jpg', title: "Spiderman: No Way Home", rating: "9.2/10 IMDB"),
      Movie(image: 'assets/poster4.jpg', title: "Spiderman: Far From Home", rating: "8.7/10 IMDB"),
      Movie(image: 'assets/poster5.jpg', title: "The Fall Guy", rating: "8.5/10 IMDB"),
      Movie(image: 'assets/poster15.jpg', title: "Avenger: Infinity War", rating: "9.4/10 IMDB"),
      Movie(image: 'assets/poster18.jpg', title: "Avenger: End Game", rating: "9.7/10 IMDB"),
      Movie(image: 'assets/poster31.jpg', title: "Moving", rating: "9.5/10 IMDB"),

    ];
    movieList.addAll(fetchedMovies);
  }
}
