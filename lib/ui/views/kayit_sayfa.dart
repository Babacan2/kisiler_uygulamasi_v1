import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/main.dart';
import 'package:kisiler_uygulamasi/ui/cubit/kayitsayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfAd = TextEditingController();
  var tfTel = TextEditingController();



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
                context.read<KayitSaydaCubit>().kaydet(tfAd.text, tfTel.text);
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
