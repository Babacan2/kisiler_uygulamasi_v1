import 'package:flutter/material.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfAd = TextEditingController();
  var tfTel = TextEditingController();

  Future<void> kaydet(String kisi_ad, String kisi_Tel) async {
    print("Kişi Kaydet : $kisi_ad - $kisi_Tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfAd,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfTel,decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                kaydet(tfAd.text, tfTel.text);
              }
                  , child: Text("Kaydet")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
