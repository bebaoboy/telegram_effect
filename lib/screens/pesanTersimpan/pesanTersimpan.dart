import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PesanTersimpan extends StatefulWidget {
  const PesanTersimpan({super.key});

  @override
  _PesanTersimpanState createState() => _PesanTersimpanState();
}

class _PesanTersimpanState extends State<PesanTersimpan> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: themeNotifier.isDark
                ? const Color.fromARGB(255, 91, 90, 90)
                : const Color.fromARGB(255, 70, 113, 148),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 58, 147, 220),
                child: Icon(Icons.bookmark_outline),
              ),
              title: Text(
                "Pesan Tersimpan",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.045,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
          body: const ChatScr(),
        );
      },
    );
  }
}

class ChatMess extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMess(
      {super.key, required this.text, required this.animationController});

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.now();

    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return SizeTransition(
          sizeFactor: CurvedAnimation(
              parent: animationController, curve: Curves.easeOut),
          axisAlignment: 0.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: themeNotifier.isDark
                  ? const Color.fromARGB(255, 35, 107, 167)
                  : const Color.fromARGB(255, 205, 243, 176),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  width: 7,
                ),
                Column(
                  children: [
                    const Text(""),
                    Row(
                      children: [
                        Text(
                          "${dt.hour}:${dt.minute}",
                          style: TextStyle(
                            fontSize: 12,
                            color: themeNotifier.isDark
                                ? const Color.fromARGB(255, 185, 185, 185)
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.done,
                          size: 15,
                          color: themeNotifier.isDark
                              ? const Color.fromARGB(255, 80, 171, 246)
                              : Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChatScr extends StatefulWidget {
  const ChatScr({super.key});

  @override
  State<ChatScr> createState() => _ChatScrState();
}

class _ChatScrState extends State<ChatScr> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMess> _messages = [];
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _handleSubmitted(String text) {
    _textController.clear();

    var message = ChatMess(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    // ignore: unused_local_variable
    bool sendMic = false;

    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    sendMic = true;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.7),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor:
                      themeNotifier.isDark ? Colors.black : Colors.white,
                  prefixIcon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Pesan',
                  hintStyle:
                      const TextStyle(fontSize: 20, color: Colors.grey),
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 80, maxWidth: 100),
                  suffixIcon: _textController.text == ''
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.attach_file_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.mic_none_outlined,
                              ),
                              onPressed: () => // MODIFIED
                                  _handleSubmitted(
                                      _textController.text) // MODIFIED
                              ,
                            ),
                          ],
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () => // MODIFIED
                              _handleSubmitted(
                                  _textController.text) // MODIFIED
                          ,
                        ),
                ),
                focusNode: _focusNode,
              ),
            ),
          ],
        );
      },
    );
  }

  // ↓ hold tap position, set during onTapDown, using getPosition() method
  Offset? tapXY;
  // ↓ hold screen size, using first line in build() method
  RenderBox? overlay;
  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        // constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(themeNotifier.isDark
                ? "assets/chat_bg_dark.jpg"
                : "assets/chat_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _messages.isEmpty
                ? Flexible(
                    fit: FlexFit.tight,
                    flex: 9,
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.24),
                      width: width * 0.65,
                      height: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: width * 0.05,
                          ),
                          SizedBox(
                            child: Image.network(
                                "https://www.gambaranimasi.org/data/media/481/animasi-bergerak-bebek-itik-0113.gif"),
                            height: width * 0.2,
                          ),
                          SizedBox(
                            height: width * 0.03,
                          ),
                          Text(
                            "Penyimpanan Awan Anda",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.03,
                            ),
                          ),
                          SizedBox(
                            height: width * 0.03,
                          ),
                          ListTile(
                            leading: Text(
                              "\u2022 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                              ),
                            ),
                            title: Transform.translate(
                              offset: const Offset(-25, 0),
                              child: const Text(
                                "Teruskan Pesan Kesini Untuk Menyimpan",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              "\u2022 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                              ),
                            ),
                            title: Transform.translate(
                              offset: const Offset(-25, 0),
                              child: const Text(
                                "Kirim media dan berkas kesini untuk menyimpan",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              "\u2022 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                              ),
                            ),
                            title: Transform.translate(
                              offset: const Offset(-25, 0),
                              child: const Text(
                                "Akses obrolan dari perangkat apapun",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              "\u2022 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                              ),
                            ),
                            title: Transform.translate(
                              offset: const Offset(-25, 0),
                              child: const Text(
                                "Gunakan Cari untuk menemukan sesuatu",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Text(""),
            // NEW
            Flexible(
              // NEW
              child: ListView.builder(
                // NEW
                padding: const EdgeInsets.all(8.0), // NEW
                reverse: true, // NEW
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTapDown: getPosition,
                      onLongPress: () {
                        //FIX pop up menu
                        showMenu<String>(
                          context: context,
                          position: relRectSize,
                          items: [
                            PopupMenuItem<String>(
                              child: const Text('Delete'),
                              onTap: () {
                                setState(() {
                                  _messages.removeAt(index);
                                });
                              },
                              value: '1',
                            ),
                          ],
                          elevation: 8.0,
                        );
                      },
                      child: _messages[index],
                    ),
                  ],
                ), // NEW
                itemCount: _messages.length, // NEW
              ), // NEW
            ), // NEW

            Container(
              child: _buildTextComposer(), // MODIFIED
            ), // NEW
          ], // NEW
        ),
      );
    });
  }

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY! & const Size(40, 40), overlay!.size);

  // ↓ get the tap position Offset
  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }
}
