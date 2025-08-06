import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/main.dart';
import 'package:kisiler_uygulamasi/ui/cubit/detaysayfa_cubit.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}



class _DetaySayfaState extends State<DetaySayfa> {
  var tfAd = TextEditingController();
  var tfTel = TextEditingController();


  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfAd.text = kisi.kisi_ad;
    tfTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfAd,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfTel,decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                    context.read<DetaySayfaCubit>().guncelle(widget.kisi.kisi_id, tfAd.text, tfTel.text);
              }
                  , child: Text("Güncelle")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
