// ignore_for_file: unused_element
import 'dart:io';
import 'package:clone_telegram/screens/pengaturan/qr.dart';
import 'package:clone_telegram/model/pengaturan.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

final ImagePicker _picker = ImagePicker();
File? file;

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  final ImagePicker imagePicker = ImagePicker();

  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    setState(() {
      file = File(image!.path);
    });
    return file;
  }

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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 86, 163, 226),
                  pinned: true,
                  expandedHeight: width * 0.55,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    titlePadding: const EdgeInsets.only(bottom: 15, left: 40),
                    title: _isShrink ? _appUserPhoto(context) : null,
                    background: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (file == null)
                              ? const NetworkImage(
                                  'https://picsum.photos/seed/girl/200/300')
                              : FileImage(File(file!.path)) as ImageProvider,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                              bottom: 10,
                            ),
                            child: Text(
                              "Saya Aslinya Ultramen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              "Online",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: _isShrink
                      ? [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 5),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                      : [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 5),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Qr()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.zero,
              width: width,
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _akun(context),
                  const Divider(color: Colors.transparent),
                  _pengaturan(context),
                  const Divider(color: Colors.transparent),
                  _premium(context),
                  const Divider(color: Colors.transparent),
                  _bantuan(context),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: const Text(
                      "Telegram untuk Android v8.8.4 (2711) store bundled arm64-v8a",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, -0.4),
            child: FractionallySizedBox(
              widthFactor: .3,
              child: _isShrink
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 27,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo_outlined),
                          color: Colors.grey.withOpacity(0.6),
                          onPressed: () {
                            takePhoto(ImageSource.gallery);
                          },
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

//* Area Widget */
Widget _appUserPhoto(context) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: (file == null)
            ? const NetworkImage('https://picsum.photos/seed/girl/200/300')
            : FileImage(File(file!.path)) as ImageProvider,
      ),
      title: const Text(
        "Saya Aslinya Ultraman",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        "online",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget _akun(context) {
  final width = MediaQuery.of(context).size.width;

  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        padding: EdgeInsets.all(width * 0.05),
        color: themeNotifier.isDark
            ? const Color.fromARGB(255, 29, 31, 31)
            : Colors.white,
        width: width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Akun",
              style: TextStyle(
                color: Color.fromARGB(255, 75, 169, 247),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "+62 821 39xxxxxx",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ketuk untuk ganti nomor telepon",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "@YogaBayuAP",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "username",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "Ajg",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Bio",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _header(context) {
  final width = MediaQuery.of(context).size.width;
  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        color: themeNotifier.isDark
            ? const Color.fromARGB(255, 51, 51, 51)
            : const Color.fromARGB(255, 0, 0, 0),
        height: width * 0.35,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.qr_code,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 27,
                backgroundImage:
                    NetworkImage('https://picsum.photos/seed/girl/200/300'),
              ),
              title: const Text(
                "Y O G A",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "online",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget _pengaturan(context) {
  final width = MediaQuery.of(context).size.width;

  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        padding: EdgeInsets.all(width * 0.05),
        color: themeNotifier.isDark
            ? const Color.fromARGB(255, 29, 31, 31)
            : Colors.white,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pengaturan",
              style: TextStyle(
                color: Color.fromARGB(255, 75, 169, 247),
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyPengaturan.length,
              itemBuilder: (context, index) {
                var _dummyPengaturan = dummyPengaturan[index];
                return ListTile(
                  leading: FaIcon(_dummyPengaturan.ikon),
                  title: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                      ),
                    ),
                    child: Text(_dummyPengaturan.title),
                  ),
                );
              },
            )
          ],
        ),
      );
    },
  );
}

Widget _premium(context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        // margin: EdgeInsets.only(bottom: 50),
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        color: themeNotifier.isDark
            ? const Color.fromARGB(255, 29, 31, 31)
            : Colors.white,
        width: width,
        height: height * 0.08,
        child: const ListTile(
          leading: FaIcon(
            FontAwesomeIcons.star,
            color: Color.fromARGB(255, 138, 43, 226),
          ),
          title: Text("Telegram Premium"),
        ),
      );
    },
  );
}

Widget _bantuan(context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        padding: EdgeInsets.all(width * 0.05),
        color: themeNotifier.isDark
            ? const Color.fromARGB(255, 29, 31, 31)
            : Colors.white,
        height: height * 0.3,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bantuan",
              style: TextStyle(
                color: Color.fromARGB(255, 75, 169, 247),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.commentDots),
              title: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                ),
                child: const Text("Kirim Pertanyaan"),
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.circleQuestion),
              title: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                ),
                child: const Text("Pertanyaan Umum"),
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.shield),
              title: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                ),
                child: const Text("Kebijakan Privasi"),
              ),
            )
          ],
        ),
      );
    },
  );
}
