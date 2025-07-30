import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  var tfController = TextEditingController();

  Future<void> ara(String aramaKelimesi) async {
    print("Kişi Ara : $aramaKelimesi");
  }

  Future<List<Kisiler>> kisileriYukle() async {
   var kisiListesi = <Kisiler>[];
   var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
   var k2 = Kisiler(kisi_id: 2, kisi_ad: "Aslı", kisi_tel: "2222");
   var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
   kisiListesi.add(k1);
   kisiListesi.add(k2);
   kisiListesi.add(k3);
   return kisiListesi;
  }

  Future<void> sil(int kisi_id) async {
    print("Kişi sil : $kisi_id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.teal),
        titleTextStyle: TextStyle(color: Colors.teal, fontSize: 30),
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonuc){
          ara(aramaSonuc);
          },
        ) :
        Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
          }, icon: Icon(Icons.cancel)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
          future: kisileriYukle(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              var kisilerListesi = snapshot.data;
              return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context,indeks) {
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi,)))
                          .then((value){
                        print("Anasayfaya dönüldü");
                      });
                    },
                    child: Card(
                      color: Colors.teal,
                      child: SizedBox(height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(kisi.kisi_ad,style: const TextStyle(fontSize: 20),),
                                  Text(kisi.kisi_tel)
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("${kisi.kisi_ad} Silinsin mi ?"),
                                        action: SnackBarAction(
                                            label: "Evet",
                                            onPressed: (){
                                              sil(kisi.kisi_id);
                                            },)
                                    ),
                                );
                            }, icon: const Icon(Icons.clear,color: Colors.black54,))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else {
              return const Center();
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
                .then((value){
                  print("Anasayfaya dönüldü");
            });
          },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
