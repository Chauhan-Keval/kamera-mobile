import 'package:flutter/material.dart';

class CreatePlaylistSheet extends StatefulWidget {
  final Function(String, bool) onCreate;

  const CreatePlaylistSheet({
    super.key,
    required this.onCreate,
  });

  @override
  State<CreatePlaylistSheet> createState() =>
      _CreatePlaylistSheetState();
}

class _CreatePlaylistSheetState extends State<CreatePlaylistSheet> {
  final controller = TextEditingController();
  bool isPrivate = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("New Playlist",
              style: TextStyle(fontSize: 20)),

          const SizedBox(height: 20),

          TextField(
            controller: controller,
            decoration:
            const InputDecoration(hintText: "Playlist Name"),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _btn("Private", true),
              const SizedBox(width: 10),
              _btn("Public", false),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                  ),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(

                  onPressed: () {
                    widget.onCreate(
                        controller.text, isPrivate);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xFF1677FF),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Create",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btn(String text, bool value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPrivate = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isPrivate == value
                ? Colors.blue.shade50
                : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}