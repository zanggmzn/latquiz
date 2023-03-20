import 'package:flutter/material.dart';
import 'package:latkuis_izan2/rental_car.dart';

class HalamanDetailMobil extends StatefulWidget {
  final RentalCar rent;
  const HalamanDetailMobil({Key? key, required this.rent}) : super(key: key);

  @override
  State<HalamanDetailMobil> createState() => _HalamanDetailMobilState();
}

class _HalamanDetailMobilState extends State<HalamanDetailMobil> {
  bool isTersedia = true;
  String ketersediaan = "Tersedia";
  var warna = Colors.blue;
  statusbutton() {
    if (isTersedia == false) {
      return null;
    } else {
      return () {
        String text = " ";
        if (isTersedia == true) {
          setState(() {
            text = "Berhasil Memesan!";
            ketersediaan = "Tidak Tersedia";
            warna = Colors.red;
            isTersedia = false;
          });
        }
        SnackBar snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.rent.brand} ${widget.rent.model}"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 270,
                padding: const EdgeInsets.all(12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(widget.rent.images[0]),
                    Image.network(widget.rent.images[1]),
                    Image.network(widget.rent.images[2])
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.rent.brand + " " + widget.rent.model,
                style: TextStyle(fontSize: 24),
                maxLines: 1,
              ),
              const SizedBox(
                width: 20,
              ),
              Card(
                child: Container(
                  height: 150,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      //biar bertingkat diberi column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Brand            : " + widget.rent.brand,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Model           : " + widget.rent.model,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tahun           : " + widget.rent.year.toString(),
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Bayar Sewa : " +
                                widget.rent.rentalPricePerDay +
                                " /hari",
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Status          : ' + ketersediaan,
                            style: TextStyle(fontSize: 16, color: warna),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 35,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(20),
                    ),
                    onPressed: statusbutton(),
                    child: const Text('Pesan'),
                  )),
              Card(
                child: Container(
                    height: 150,
                    width: 700,
                    margin: EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Deskripsi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.rent.description),
                        ])),
              ),
            ],
          ),
        ));
  }
}
