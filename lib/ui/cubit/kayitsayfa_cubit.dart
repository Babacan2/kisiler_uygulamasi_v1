import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class KayitSaydaCubit extends Cubit<void>{
  KayitSaydaCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> kaydet(String kisi_ad, String kisi_Tel) async {
    await krepo.kaydet(kisi_ad, kisi_Tel);
  }

}