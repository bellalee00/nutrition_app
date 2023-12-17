import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import '/home.dart';
import '/makanan/DetailFood.dart';
import '/makanan/TambahFood.dart';
import '/service/food_service.dart';
import '/model/food_model.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  Stream<List<Food>> getlist() async* {
    List<Food> data = await ApiHelper().listData();
    yield data;
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003ACE),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                'LIST MAKANAN BERKALORI',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: StreamBuilder(
          stream: getlist(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Data Tidak Tersedia'));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3.7),
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Food food = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditFood(food: food),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TransparentImageCard(
                        width: double.infinity,
                        imageProvider: NetworkImage(food.foto),
                        title: Center(
                          child: Text(
                            food.nama,
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        description: Center(
                          child: Text(
                            '${food.kalori} kkal',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TambahFood()));
        },
        foregroundColor: Colors.white,
        hoverColor: Colors.blueAccent,
        backgroundColor: Color.fromARGB(255, 0, 206, 48),
        child: Icon(Icons.add),
      ),
    );
  }
}
