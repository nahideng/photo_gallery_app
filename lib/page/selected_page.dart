import 'package:flutter/material.dart';
import 'package:photo_gallery_app/custom_design/bottom_container.dart';
import 'package:photo_gallery_app/custom_design/image_container.dart';
import 'package:photo_gallery_app/data/card_data.dart';

class SelectedPage extends StatelessWidget {

  late List<Map<String, String>> cards;
  late int index;
  SelectedPage({
    super.key,
    required this.index,
  }): cards = CardData.cards;

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
              Navigator.pop(context);
            },
            /*child: Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,))),*/
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,))),
          ),
        ),
        title: Text(cards[index]["AlbumName"]!,style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [],
            iconColor: Colors.white,
            iconSize: 30,
          )
        ],

      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return  portraitWidget(context, orientation);
            } else {
              return landscapeWidget(context, orientation);
            }
          },
        ),
      ),
    );
  }

  // create Portraite Widget
  Widget portraitWidget(BuildContext context, Orientation orientation) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                imageContainer(
                  cards,
                  index,
                  fromHome: false,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 325,
                  margin: const EdgeInsets.all(10),
                  boxShadow: BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 35,
                    offset: const Offset(5, 12),
                    blurStyle: BlurStyle.normal,
                  ),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.00, vertical: 10.00),
                  child: Text(
                    cards[index]["AlbumHeader"]!,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.00, vertical: 10.00),
                  child: Text(
                    cards[index]["AlbumDescription"]!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.00),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 51,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 15,
                          backgroundColor: const Color(0xFF2CAB00),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        child: const Text("See More")),
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Suggestions",
                    style: TextStyle(
                      color: const Color(0xFF2CAB00),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                bottomContainer(
                    orientation: orientation,
                    context: context,
                    containerLabel: "Dawn",
                    containerImage:
                    "https://images.pexels.com/photos/1008737/pexels-photo-1008737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                ),
                bottomContainer(
                    orientation: orientation,
                    context: context,
                    containerLabel: "Leaves",
                    containerImage:
                    "https://images.pexels.com/photos/1687341/pexels-photo-1687341.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                ),
              ],
            )
          ],
        ));
  }

  //  create Landscape Widget
  Widget landscapeWidget(BuildContext context, Orientation orientation) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: imageContainer(
                cards,
                index,
                fromHome: false,
                width: MediaQuery.of(context).size.width * 0.35,
                height: 298,
                margin: const EdgeInsets.only(top: 15.00, left: 20.00),
                boxShadow: BoxShadow(
                  color: Colors.black.withOpacity(0.50),
                  spreadRadius: 0,
                  blurRadius: 35,
                  offset: const Offset(5, 12),
                  blurStyle: BlurStyle.normal,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.00, vertical: 20.00),
                        child: Text(
                          cards[index]["AlbumHeader"]!,
                          style:const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.00, vertical: 00.00),
                        child: Text(
                          cards[index]["AlbumDescription"]!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.00),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 51,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 15,
                                backgroundColor: const Color(0xFF2CAB00),
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              child: const Text("See More")),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 30.00, bottom: 20.00),
                        child: Text(
                          "Suggestions",
                          style: TextStyle(
                            color: const Color(0xFF2CAB00),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          bottomContainer(
                              orientation: orientation,
                              context: context,
                              containerLabel: "Dawn",
                              containerImage:
                              "https://images.pexels.com/photos/1008737/pexels-photo-1008737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                          ),
                          bottomContainer(
                              orientation: orientation,
                              context: context,
                              containerLabel: "Leaves",
                              containerImage:
                              "https://images.pexels.com/photos/1687341/pexels-photo-1687341.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

}