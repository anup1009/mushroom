import 'package:flutter/material.dart';

class mushroomInfo extends StatefulWidget {
  const mushroomInfo({Key? key}) : super(key: key);

  @override
  State<mushroomInfo> createState() => _mushroomInfoState();
}

class _mushroomInfoState extends State<mushroomInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        Text('About Mushrooms',textAlign: TextAlign.center,textScaleFactor: 3,),
        SizedBox(height: 20.0,),
        Text("A mushroom is the reproductive structure produced by some fungi."
            " It is somewhat like the fruit of a plant, except that the 'seeds' "
            "it produces are in fact millions of microscopic spores that form in the"
            " gills or pores underneath the mushroom's cap. The spores blow away into the wind,"
            " or are spread by other means, such as animal feeding."
            " If they land on a suitable substrate (such as wood or soil) spores will "
            "germinate to form a network of microscopic rooting threads (mycelium) "
            "which penetrate into their new food source."
            " Unlike the mushroom, which pops up then passes away quickly,"
            " the mycelium persists, often for many years,"
            " extracting nutrients and sending up its annual crop of mushrooms.",
          textScaleFactor: 1.5,textAlign: TextAlign.justify,),
      ],),
    ),




    );
  }
}
