import 'package:flutter/material.dart';

class Filmler {
  int film_id;
  String film_adi;
  String film_resim_adi;
  double film_fiyat;

  Filmler(
    this.film_id,
    this.film_adi,
    this.film_resim_adi,
    this.film_fiyat,
  );
}

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  Future<List<Filmler>> getFilmler() async {
    var filmlerListesi = <Filmler>[];

    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 15.99);
    var f2 = Filmler(2, "Django", "django.png", 9.99);
    var f3 = Filmler(3, "Inception", "inception.png", 7.99);
    var f4 = Filmler(4, "Interstellar", "interstellar.png", 21.99);
    var f5 = Filmler(5, "The Hateful Eight", "thehatefuleight.png", 5.99);
    var f6 = Filmler(6, "The Pianist", "thepianist.png", 17.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: getFilmler(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3.5),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context, index) {
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(film: film),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                              "assets/film_resimler/${film.film_adi}"),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}

class DetaySayfa extends StatefulWidget {
  Filmler film;
  DetaySayfa({super.key, required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.film.film_adi,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/film_resimler/${widget.film.film_resim_adi}"),
            Text(
              "${widget.film.film_fiyat} \u{20BA}",
              style: TextStyle(color: Colors.blue, fontSize: 48),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("KİRALA"),
                  onPressed: () {
                    print("${widget.film.film_adi} kiralandı");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
