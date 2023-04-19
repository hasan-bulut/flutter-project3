import 'package:flutter/material.dart';

class Yemekler {
  int yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  double yemek_fiyat;
  Yemekler(
      this.yemek_id, this.yemek_adi, this.yemek_resim_adi, this.yemek_fiyat);
}

class YemekPage extends StatefulWidget {
  const YemekPage({super.key});

  @override
  State<YemekPage> createState() => _YemekPageState();
}

class _YemekPageState extends State<YemekPage> {
  Future<List<Yemekler>> getYemekler() async {
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(1, "Köfte", "kofte.png", 15.99);
    var y2 = Yemekler(2, "Ayran", "ayran.png", 2.0);
    var y3 = Yemekler(3, "Fanta", "fanta.png", 3.0);
    var y4 = Yemekler(4, "Makarna", "makarna.png", 14.99);
    var y5 = Yemekler(5, "Kadayıf", "kadayif.png", 8.50);
    var y6 = Yemekler(1, "Baklava", "baklava.png", 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: getYemekler(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context, index) {
                var yemek = yemekListesi[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetayPage(yemek: yemek),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset(
                            "assets/yemek_resimler/${yemek.yemek_resim_adi}",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${yemek.yemek_adi}",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "${yemek.yemek_fiyat} \u{20BA}",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
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

class DetayPage extends StatefulWidget {
  Yemekler yemek;
  DetayPage({super.key, required this.yemek});

  @override
  State<DetayPage> createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.yemek.yemek_adi,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                "assets/yemek_resimler/${widget.yemek.yemek_resim_adi}"),
            Text(
              "${widget.yemek.yemek_fiyat} \u{20BA}",
              style: TextStyle(color: Colors.blue, fontSize: 48),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("SİPARİŞ VER"),
                  onPressed: () {
                    print("${widget.yemek.yemek_adi} sipariş verildi");
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
