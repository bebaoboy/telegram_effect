import 'package:clone_telegram/components/skleton.dart';
import 'package:flutter/material.dart';

class Berkas extends StatefulWidget {
  const Berkas({super.key});

  @override
  _BerkasState createState() => _BerkasState();
}

class _BerkasState extends State<Berkas> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: ListView(
        children: [
          _isLoading ? const BerkasSkeleton() : const BerkasData(),
        ],
      ),
    );
  }
}

class BerkasSkeleton extends StatelessWidget {
  const BerkasSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: ListView.builder(
        itemCount: dataBerkas.length,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Skleton(
              width: 50,
            ),
            title: Skleton(
              width: 100,
            ),
            subtitle: Skleton(
              width: 50,
            ),
            trailing: Skleton(
              width: 20,
              height: 10,
            ),
          );
        },
      ),
    );
  }
}

class BerkasData extends StatelessWidget {
  const BerkasData({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: ListView.builder(
        itemCount: dataBerkas.length,
        itemBuilder: (context, index) {
          var _berkasdata = dataBerkas[index];
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("${_berkasdata.image}$index"),
              ),
            ),
            title: Text(_berkasdata.title),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.download,
                  color: Colors.blue,
                  size: 15,
                ),
                Text(_berkasdata.subtitle),
              ],
            ),
            trailing: Text(_berkasdata.jam),
          );
        },
      ),
    );
  }
}

class BerkasModel {
  final String image, title, subtitle, jam;

  BerkasModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.jam,
  });
}

List<BerkasModel> get dataBerkas => _databerkas;

List<BerkasModel> _databerkas = [
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
  BerkasModel(
    image: "https://picsum.photos/200/300?random=",
    title: "ScreenShot_1.png",
    subtitle: "151,1 KB . xxxx -> Flutter Indonesia",
    jam: "18:00",
  ),
];
