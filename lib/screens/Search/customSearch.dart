import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/screens/Search/customSearch/berkas.dart';
import 'package:clone_telegram/screens/Search/customSearch/media.dart';
import 'package:clone_telegram/screens/Search/customSearch/musik.dart';
import 'package:clone_telegram/screens/Search/customSearch/obrolan.dart';
import 'package:clone_telegram/screens/Search/customSearch/suara.dart';
import 'package:clone_telegram/screens/Search/customSearch/tautan.dart';
import 'package:clone_telegram/screens/Search/customSearch/unduhan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: themeNotifier.isDark
                  ? const Color.fromARGB(255, 57, 56, 56)
                  : Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
              actions: [
                const SizedBox(
                  width: 70,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Cari',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                      ),
                    ),
                  ),
                ),
              ],
              bottom: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                indicatorWeight: 4.5,
                indicatorColor: Color.fromARGB(255, 94, 177, 245),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 15,
                ),
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Obrolan",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Media",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Unduhan",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Tautan",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Berkas",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Musik",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Suara",
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Obrolan(),
                Media(),
                Unduhan(),
                Tautan(),
                Berkas(),
                Musik(),
                Suara(),
              ],
            ),
          ),
        );
      },
    );
  }
}
