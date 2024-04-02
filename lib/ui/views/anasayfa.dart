import 'package:flutter/material.dart';
import 'package:kisi_rehber_uygulamasi/data/kisiler.dart';
import 'package:kisi_rehber_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisi_rehber_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async {
    print("Kişi Ara : $aramaKelimesi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ? const Text("Ara") : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    aramaYapiliyorMu = true;
                  },
                  icon: Icon(Icons.search)),
        ],
      ),
      body: ElevatedButton(
          onPressed: () {
            var kisi = Kisiler(kisi_id: 1, kisi_ad: "Deniz", kisi_tel: "1111");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetaySayfa(
                          kisi: kisi,
                        ))).then((value) {
              print("Anasayfaya Dönüldü");
            });
          },
          child: Text("Detay")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KayitSayfa()))
              .then((value) {
            print("Anasayfaya Dönüldü");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
    //ilk
  }
}
