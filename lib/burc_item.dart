import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscopes/burc_detay.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listeleneBurc;
  const BurcItem({required this.listeleneBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle= Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurcDetay(secilenBurc: listeleneBurc)));

          },
          leading: Image.asset(listeleneBurc.burcKucukResim),
          title: Text(listeleneBurc.burcAdi,
          style: myTextStyle.headline5),

          subtitle: Text(listeleneBurc.burcTarihi,
          style:myTextStyle.subtitle1),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),

        ),
      ),
    );
  }
}
