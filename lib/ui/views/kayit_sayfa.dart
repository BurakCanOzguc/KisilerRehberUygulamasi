import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisi_rehber_uygulamasi/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  TextEditingController tfKisiAdi = TextEditingController();
  TextEditingController tfKisiTel = TextEditingController();

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
                    context
                        .read<KayitSayfaCubit>()
                        .kaydet(tfKisiAdi.text, tfKisiTel.text);
                  },
                  child: Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
