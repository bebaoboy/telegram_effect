import 'dart:math';
import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200; // set controller on scrolling
  final bool _show = true;
  Duration duration = const Duration(milliseconds: 300);

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Random random = Random();
    int randomInt = random.nextInt(100);
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          floatingActionButton: AnimatedSlide(
            duration: duration,
            offset: _show ? Offset.zero : const Offset(0, 2),
            child: AnimatedOpacity(
              duration: duration,
              opacity: _show ? 1 : 0,
              child: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Colors.blue[300],
                child: const Icon(Icons.person_add_alt_1_sharp),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: themeNotifier.isDark
                ? const Color.fromARGB(255, 91, 90, 90)
                : const Color.fromARGB(255, 70, 113, 148),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text("Kontak"),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.sort_outlined),
              ),
            ],
          ),
          body: RawScrollbar(
            controller: _scrollController,
            thumbColor: Colors.grey,
            thickness: 6,
            thumbVisibility: true,
            child: ListView(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                const ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                  leading: Icon(
                    Icons.person_add_alt,
                    size: 28,
                  ),
                  title: Text("Undang Teman"),
                ),
                const ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                  leading: Icon(
                    Icons.pin_drop_outlined,
                    size: 28,
                  ),
                  title: Text("Cari Pengguna Sekitar"),
                ),
                Container(
                  width: width,
                  height: 28,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(174, 158, 158, 158).withOpacity(0.1),
                  ),
                  child: Text(
                    "Urutan Berdasarkan waktu terlihat",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.8),
                    ),
                  ),
                ),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "online", true),
                _kontakItem("user$randomInt", "terlihat pada 18.40", false),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _kontakItem(String title, String subtitle, bool isOnline) {
  Random random = Random();
  int randomInt = random.nextInt(100);

  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      backgroundImage:
          NetworkImage("https://picsum.photos/200/300?random=$randomInt"),
      backgroundColor: Colors.transparent,
    ),
    title: Text(
      title,
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        color: isOnline ? Colors.blue : Colors.grey,
      ),
    ),
  );
}
