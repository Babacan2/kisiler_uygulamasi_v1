import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository {

  Future<void> kaydet(String kisi_ad, String kisi_Tel) async {
    print("Kişi Kaydet : $kisi_ad - $kisi_Tel");
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_Tel) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - $kisi_Tel");
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

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisiListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Jiyan", kisi_tel: "1111");
    kisiListesi.add(k1);
    return kisiListesi;
  }

  Future<void> sil(int kisi_id) async {
    print("Kişi sil : $kisi_id");
  }


}