import 'package:flutter/material.dart';
import 'package:latkuis_izan2/detail.dart';
import 'package:latkuis_izan2/rental_car.dart';

class HalamanListMobil extends StatelessWidget {
  const HalamanListMobil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rental Mobil"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: rentalCar.length,
        itemBuilder: (BuildContext context, int index) {
          final RentalCar rent = rentalCar[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => HalamanDetailMobil(rent:rent),));
            },
            child: Card(
              elevation: 10, //shadow
              child: Container(
                //ukuran card
                height: MediaQuery.of(context).size.height/4,
                width: 300,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        //ini ukuran foto
                        height: 400, width: 150,
                        child: Image.network(rent.images[0])
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //biar bertingkat diberi column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(
                          rent.brand+" "+rent.model,
                          style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            rent.rentalPricePerDay+" /hari",
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
