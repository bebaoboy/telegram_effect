import 'package:flutter/material.dart';

class Unduhan extends StatefulWidget {
  const Unduhan({super.key});

  @override
  _UnduhanState createState() => _UnduhanState();
}

class _UnduhanState extends State<Unduhan> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: width,
          height: width * 0.06,
          color: Colors.grey.withOpacity(0.15),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Terkini",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Hapus Semua",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage("https://picsum.photos/200/300?random=1"),
            ),
          ),
          title: Text("Jujtsu Kaisen Movie"),
          subtitle: Text("3.6 GB."),
        ),
        const ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage("https://picsum.photos/200/300?random=1"),
            ),
          ),
          title: Text("Jujtsu Kaisen Movie"),
          subtitle: Text("3.6 GB."),
        ),
        const ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage("https://picsum.photos/200/300?random=1"),
            ),
          ),
          title: Text("Jujtsu Kaisen Movie"),
          subtitle: Text("3.6 GB."),
        ),
      ],
    );
  }
}
