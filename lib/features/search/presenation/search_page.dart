import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      //TODO:
                    },
                    style: const TextStyle(color: white, fontSize: 18),
                    decoration: const InputDecoration(
                        fillColor: darkGrey,
                        hintText: 'Search news',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((_) => darkGrey)),
                    onPressed: () {},
                    icon: const Icon(Icons.search))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
