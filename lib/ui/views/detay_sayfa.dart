import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisi_rehber_uygulamasi/data/entity/kisiler.dart';
import 'package:kisi_rehber_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  TextEditingController tfKisiAdi = TextEditingController();
  TextEditingController tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişiler"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(hintText: "Kisi Ad"),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: "Kisi Tel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<DetaySayfaCubit>().guncelle(
                        widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
                  },
                  child: Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
