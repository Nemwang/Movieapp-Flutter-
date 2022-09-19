class Movie {
  final String name;
  final String imagepath;
  final String videopath;
  final String category;
  final int year;
  final Duration duration;

  const Movie(
      {required this.name,
      required this.imagepath,
      required this.videopath,
      required this.category,
      required this.year,
      required this.duration});

  static const List<Movie> movies = [
    Movie(
      name: 'Matrix',
      imagepath:
          'https://www.themoviedb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      videopath: 'assets/videos/example.mp4',
      category: 'action',
      year: 1999,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Hitman',
      imagepath:
          'https://upload.wikimedia.org/wikipedia/en/5/57/Hitman2_large.jpg',
      videopath: 'assets/videos/example.mp4',
      category: 'thriller',
      year: 1999,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Harry potter',
      imagepath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNU0FUt3jniqrbiBPkxJVUeURo9t18FxxXgX3P9KMubSgmucGJYPk5OLsoKB8a4uE0P5c&usqp=CAU',
      videopath: 'assets/videos/example.mp4',
      category: 'fantasy',
      year: 1999,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Inception',
      imagepath:
          'https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABUMAaaQ8ziCvrk5d_Qbnak4LLkBujzGwUwK67Ad6XtlBe4gqZbk3lY7iFKg8_Dk1Ipf2Wy0oTeg2w6ik54wRCXQwDcRAgzDa9iLx.jpg?r=9d5',
      videopath: 'assets/videos/example.mp4',
      category: 'Suspense',
      year: 1999,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Lord Of The Rings',
      imagepath:
          'https://static.wikia.nocookie.net/lotr/images/8/87/Ringstrilogyposter.jpg/revision/latest?cb=20210720095933',
      videopath: 'assets/videos/example.mp4',
      category: 'fantasy',
      year: 1999,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Titanic',
      imagepath:
          'https://play-lh.googleusercontent.com/560-H8NVZRHk00g3RltRun4IGB-Ndl0I0iKy33D7EQ0cRRwH78-c46s90lZ1ho_F1so',
      videopath: 'assets/videos/example.mp4',
      category: 'Romance',
      year: 1997,
      duration: Duration(hours: 1, minutes: 45),
    ),
  ];
}
