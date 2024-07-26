import 'package:clone_telegram/components/skleton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Suara extends StatefulWidget {
  const Suara({super.key});

  @override
  _SuaraState createState() => _SuaraState();
}

class _SuaraState extends State<Suara> {
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
      child: _isLoading
          ? const SuaraSkeleton()
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 100, 162, 213),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: 50,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.arrowDown,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  title: const Text("Pakdhe Owi -> DIskusi Bangsa "),
                  subtitle: Text(
                    "00:5" "$index",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  trailing: Text(
                    "3$index Apr",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class SuaraSkeleton extends StatelessWidget {
  const SuaraSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: ListView.builder(
        itemCount: 10,
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
