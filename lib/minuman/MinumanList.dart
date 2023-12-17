import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:nutrition_app/home.dart';
import '/minuman/TambahDrink.dart';
import '/service/drink_service.dart';
import '/model/drink_model.dart';
import 'DetailDrink.dart';

class DrinkList extends StatefulWidget {
  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  Stream<List<Drink>> getlist() async* {
    List<Drink> data = await ApiHelper().listData();
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
                'LIST MINUMAN BERKALORI',
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
                  Drink drink = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditDrink(drink: drink)));
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TransparentImageCard(
                          width: double.infinity,
                          imageProvider: NetworkImage(drink.foto),
                          title: Center(
                            child: Text(
                              drink.nama,
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          description: Center(
                            child: Text(
                              '${drink.kalori} kkal',
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
              context, MaterialPageRoute(builder: (context) => TambahDrink()));
        },
        foregroundColor: Colors.white,
        hoverColor: Colors.blueAccent,
        backgroundColor: Color.fromARGB(255, 0, 206, 48),
        child: Icon(Icons.add),
      ),
    );
  }
}
