//https://youtu.be/Mn254cnduOY?t=15570

import 'package:flutter/material.dart';

//https://youtu.be/Mn254cnduOY?t=15724
extension ToListView<T> on Iterable<T> {
  Widget toListView() => IterableListView(iterable: this);
}

class IterableListView<T> extends StatelessWidget {
  final Iterable<T> iterable;
  const IterableListView({super.key, required this.iterable});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: iterable.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            iterable.elementAt(index).toString(),
          ),
        );
      },
    );
  }
}
