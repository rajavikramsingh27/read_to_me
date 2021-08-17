import 'package:flutter/material.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:drag_and_drop_gridview/drag.dart';
import 'package:drag_and_drop_gridview/gridorbiter.dart';



class Gridview extends StatefulWidget {
  const Gridview({key}) : super(key: key);

  @override
  _GridviewState createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  List<String> _imageUris = [
    "https://images.pexels.com/photos/4466054/pexels-photo-4466054.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/4561739/pexels-photo-4561739.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/4507967/pexels-photo-4507967.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/4321194/pexels-photo-4321194.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1053924/pexels-photo-1053924.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/1144687/pexels-photo-1144687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/2589010/pexels-photo-2589010.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  ];
  int variableSet = 0;
  ScrollController _scrollController;
  double width;
  double height;
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag And drop Plugin'),
      ),
      body: Center(
        child: DragAndDropGridView(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4.5,
          ),
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => Card(
            elevation: 2,
            child: LayoutBuilder(
              builder: (context, costrains) {
                if (variableSet == 0) {
                  height = costrains.maxHeight;
                  width = costrains.maxWidth;
                  variableSet++;
                }
                return GridTile(
                  child: Image.network(
                    _imageUris[index],
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ),
                );
              },
            ),
          ),
          itemCount: _imageUris.length,
          onWillAccept: (oldIndex, newIndex) {
            // Implement you own logic

            // Example reject the reorder if the moving item's value is something specific
            if (_imageUris[newIndex] == "something") {
              return false;
            }
            return true; // If you want to accept the child return true or else return false
          },
          onReorder: (oldIndex, newIndex) {
            final temp = _imageUris[oldIndex];
            _imageUris[oldIndex] = _imageUris[newIndex];
            _imageUris[newIndex] = temp;

            setState(() {});
          },
        ),
      ),
    );

  }
}
