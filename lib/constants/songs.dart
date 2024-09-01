class Song {
  final String albumCoverImagePath;
  final String title;
  final String album;
  final String artist;
  final String genre;
  final String year;
  final String audioFilePath;

  const Song(
      {required this.albumCoverImagePath,
      required this.title,
      required this.album,
      required this.artist,
      required this.genre,
      required this.year,
      required this.audioFilePath});
}

const mysterySong = Song(
    year: "????",
    genre: "????????",
    artist: "????????",
    album: "????????",
    title: "????????",
    albumCoverImagePath: "assets/mystery.jpg",
    audioFilePath: "");

const songlist = [
  Song(
      album: "STYLEY! Vol. 2",
      genre: "J-Pop",
      year: "2021",
      artist: "PSYQUI",
      title: "就寝御礼",
      albumCoverImagePath: "assets/Styley! Vol 2.png",
      audioFilePath: "assets/songs/PSYQUI - 就寝御礼.flac"),
  Song(
      albumCoverImagePath: "assets/cachorro-irado.jpg",
      title: "metamorphosis",
      album: "Denshi Disco Mitsurin",
      artist: "Dirty Androids, punipuni denki",
      genre: "Electronic, Pop",
      year: "2020",
      audioFilePath: "assets/songs/01_03_変身 (feat. Dirty Androids).flac"),
  Song(
      album: "Archive Vol. 2",
      genre: "EDM, Lofi",
      year: "2024",
      artist: "Nor/Aice Room",
      title: "Luv U",
      albumCoverImagePath: "assets/cachorro-irado.jpg",
      audioFilePath: "assets/songs/Aice room(Nor) - Luv U.flac"),
  Song(
      albumCoverImagePath: "assets/cachorro-irado.jp",
      title: "Flyme",
      album: "Flyme",
      artist: "Sugawara Kei",
      genre: "Pop",
      year: "2020",
      audioFilePath: "assets/songs/01_01_フライミ_菅原圭.wav")
  // Song(
  //     albumCoverImagePath: "assets/akinapossibility.jpg",
  //     title: "Blue Misty Rain",
  //     album: "Possibility",
  //     artist: "Akina Nakamori",
  //     genre: "J-Pop",
  //     year: "1984"),
  // Song(
  //     albumCoverImagePath: "assets/akinaprologue.jpg",
  //     title: "Bon Voyage",
  //     album: "Prologue",
  //     artist: "Akina Nakamori",
  //     genre: "J-Pop",
  //     year: "1982"),
  // Song(
  //     albumCoverImagePath: "assets/akinacd87.jpeg",
  //     title: "Tango Noir",
  //     album: "CD '87",
  //     artist: "Akina Nakamori",
  //     genre: "J-Pop",
  //     year: "1987"),
  // Song(
  //     albumCoverImagePath: "assets/chisatomite.jpg",
  //     title: "ALONE",
  //     album: "Mite",
  //     artist: "Chisato Moritaka",
  //     genre: "J-Pop",
  //     year: "1988"),
  // Song(
  //     albumCoverImagePath: "assets/chisatothemoritaka.jpg",
  //     title: "Get Smile",
  //     album: "The Moritaka",
  //     artist: "Chisato Moritaka",
  //     genre: "J-Pop",
  //     year: "1991"),
  // Song(
  //     albumCoverImagePath: "assets/meiko303east60thst.jpg",
  //     title: "Daybreak in N.Y.",
  //     album: "303 E. 60TH ST.",
  //     artist: "Meiko Nakahara",
  //     genre: "J-Pop",
  //     year: "1987"),
  // Song(
  //     albumCoverImagePath: "assets/meikopuzzle.jpg",
  //     title: "PUZZLE",
  //     album: "PUZZLE",
  //     artist: "Meiko Nakahara",
  //     genre: "J-Pop",
  //     year: "1987"),
  // Song(
  //     albumCoverImagePath: "assets/meikorussianroulette.jpg",
  //     title: "Russian Roulette",
  //     album: "Russian Roulette",
  //     artist: "Meiko Nakahara",
  //     genre: "J-Pop",
  //     year: "1985"),
  // Song(
  //     albumCoverImagePath: "assets/mihoonnaninaare.jpg",
  //     title: "Typhoon",
  //     album: "Onna ni Naare",
  //     artist: "Miho Morikawa",
  //     genre: "J-Pop",
  //     year: "1987"),
  // Song(
  //     albumCoverImagePath: "assets/oginomekaigaraterasu.jpg",
  //     title: "JOANNA",
  //     album: "Kaigara Terasu",
  //     artist: "Yōko Oginome",
  //     genre: "J-Pop",
  //     year: "1985"),
  // Song(
  //     albumCoverImagePath: "assets/oginomeraspberrywind.jpg",
  //     title: "LAZY DANCE",
  //     album: "Raspberry Wind",
  //     artist: "Yōko Oginome",
  //     genre: "J-Pop",
  //     year: "1986"),
  // Song(
  //     albumCoverImagePath: "assets/oginomevergeoflove.jpg",
  //     title: "Postcard from Paris",
  //     album: "Verge of Love",
  //     artist: "Yōko Oginome",
  //     genre: "J-Pop",
  //     year: "1988"),
  // Song(
  //     albumCoverImagePath: "assets/yoshieaishuu.png",
  //     title: "Bay Area Hotel",
  //     album: "Aishuu",
  //     artist: "Yoshie Kashiwabara",
  //     genre: "J-Pop",
  //     year: "1987"),
  // Song(
  //     albumCoverImagePath: "assets/yoshieharunanoni.jpg",
  //     title: "Dial 117",
  //     album: "Haru na no ni",
  //     artist: "Yoshie Kashiwabara",
  //     genre: "J-Pop",
  //     year: "1983"),
  // Song(
  //     albumCoverImagePath: "assets/yuicrystaleyes.jpg",
  //     title: "Sayonara December",
  //     album: "Crystal Eyes",
  //     artist: "Yui Asaka",
  //     genre: "J-Pop",
  //     year: "1986"),
  // Song(
  //     albumCoverImagePath: "assets/yuimelodyfair.jpg",
  //     title: "Moon Train",
  //     album: "MELODY FAIR",
  //     artist: "Yui Asaka",
  //     genre: "J-Pop",
  //     year: "1989"),
  // Song(
  //     albumCoverImagePath: "assets/yuipresent.jpg",
  //     title: "STAR",
  //     album: "Present",
  //     artist: "Yui Asaka",
  //     genre: "J-Pop",
  //     year: "1987"),
];
