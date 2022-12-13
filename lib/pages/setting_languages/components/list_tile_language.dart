import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListTileLanguage extends StatefulWidget {
  const ListTileLanguage({
    Key? key,
    required this.title,
    required this.languageCode,
    required this.isShowIconDone,
    required this.onTapListTile,
  }) : super(key: key);

  final String title;
  final String languageCode;
  final bool isShowIconDone;
  final VoidCallback onTapListTile;

  @override
  State<ListTileLanguage> createState() => _ListTileLanguageState();
}

class _ListTileLanguageState extends State<ListTileLanguage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(" ${widget.languageCode} ${widget.isShowIconDone}");

    return InkWell(
      onTap: _onTap,
      child: ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: widget.isShowIconDone == true
            ? const Icon(
                Icons.done_outline_rounded,
                size: 16,
              )
            : const SizedBox(),
      ),
    );
  }

  void _onTap() {
    setState(() {
      context.setLocale(Locale(widget.languageCode));
    });
    widget.onTapListTile();
  }
}
