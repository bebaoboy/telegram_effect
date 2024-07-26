import 'package:clone_telegram/provider/negara.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/screens/tambahAkun/pilihNegara.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahAkun extends StatefulWidget {
  const TambahAkun({super.key});

  @override
  _TambahAkunState createState() => _TambahAkunState();
}

class _TambahAkunState extends State<TambahAkun> {
  final negaraController = TextEditingController();
  final kodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    negaraController.dispose();
    kodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String _negara = Provider.of<NegaraProvider>(context).negara;
    var _icon = Provider.of<NegaraProvider>(context).icon;
    final String _kode = Provider.of<NegaraProvider>(context).kode;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    negaraController.text = "  $_negara";
    kodeController.text = "$_kode    | ";
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          floatingActionButton: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
          body: SizedBox(
            width: width,
            height: height,
            child: ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: width * 0.15,
                    left: width * 0.1,
                    right: width * 0.1,
                  ),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Nomor Telepon Anda",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Mohon konfirmasi kode nefara dan masukkan nomor ponsel Anda",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: negaraController,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Flag.fromCode(
                                _icon == 'ID' || _icon == 'id'
                                    ? FlagsCode.ID
                                    : FlagsCode.RU,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            labelText: 'Negara',
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_right,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const PilihNegara()),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: kodeController,
                          keyboardType: TextInputType.number,
                          // readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Nomor telepon',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.blue,
                            ),
                            Text(
                              "Sinkron Kontak",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
