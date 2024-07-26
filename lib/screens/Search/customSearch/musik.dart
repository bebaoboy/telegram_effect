import 'package:clone_telegram/components/skleton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Musik extends StatefulWidget {
  const Musik({super.key});

  @override
  _MusikState createState() => _MusikState();
}

class _MusikState extends State<Musik> {
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
          ? const MusikSkeleton()
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    ListTile(
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
                            FontAwesomeIcons.play,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      title: const Text("Counting Star "),
                      subtitle: Text(
                        "Denny Caknan -> Gudang lagu",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                      trailing: Text(
                        "32 Apr",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 45,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 100, 162, 213),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class MusikSkeleton extends StatelessWidget {
  const MusikSkeleton({super.key});

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
