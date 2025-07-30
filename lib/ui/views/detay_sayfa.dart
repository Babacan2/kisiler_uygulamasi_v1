import 'package:flutter/material.dart';
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

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_Tel) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - $kisi_Tel");
  }

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
                    guncelle(widget.kisi.kisi_id, tfAd.text, tfTel.text);
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
