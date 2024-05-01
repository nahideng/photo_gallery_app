
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_gallery_app/custom_design/image_container.dart';
import 'package:photo_gallery_app/data/card_data.dart';
import 'package:photo_gallery_app/page/selected_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Map<String, String>> cards;
  late int itemCount;

  @override
  void initState() {
    cards = CardData.cards;
    itemCount = cards.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF2CAB00),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              SystemNavigator.pop();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,))),
          ),
        ),
        title: Text("Photo Gellary",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [],
            iconColor: Colors.white,
            iconSize: 30,
          )
        ],

      ),

      // the body part
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation){
            return gridViewBuilder(orientation);
          },
        ),
      ),
    );
  }

  // Create the gridViewBuilder method
  Widget gridViewBuilder(Orientation orientation) {
    return GridView.builder(
        padding: EdgeInsets.all(15),
        //physics: NeverScrollableScrollPhysics(),
        itemCount:  itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
          childAspectRatio: 1,
        ),
        itemBuilder: (context,index){
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPage(index: index,)));
            },
            child: imageContainer(cards, index),
          );
        }
    );
  }

}
