import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/core/widgets/app_icon_button.dart';

class MainScreen extends StatefulWidget {
  static const location = "/notes/";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("data"),
        AppIconButton(onPressed: () {}, child: Icon(Icons.search)),
      ],
    );
  }
}
