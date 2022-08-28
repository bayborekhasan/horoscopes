import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/burc.dart';
import 'package:palette_generator/palette_generator.dart';


class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc ,Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.pink;
  late PaletteGenerator _generator;
  @override
  void initState() {
    // TODO: implement initState 
    super.initState();
    appbarRenginiBul();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi+ ' Burcu ve özellikleri'),
              centerTitle: true,
              background: Image.asset(widget.secilenBurc.burcBuyukResim,
            fit: BoxFit.cover),),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1),),
            ),
          )
        ],
      )
    );
  }

  void appbarRenginiBul() async{
    _generator= await PaletteGenerator.fromImageProvider(AssetImage( widget.secilenBurc.burcBuyukResim));
    appbarRengi= _generator.dominantColor!.color;
    setState(() {

    });
    print(appbarRengi);
  }
}
