import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Models/product.dart';
import 'package:provider/provider.dart';
import 'farid_tile.dart';

class FaridList extends StatefulWidget {
  @override
  _FaridListState createState() => _FaridListState();
}

class _FaridListState extends State<FaridList> {
  @override
  Widget build(BuildContext context) {
    final farids = Provider.of<List<Product>>(context) ?? [];

    return ListView.builder(
        itemCount: farids != null ? farids.length : 0,
        itemBuilder: (context, index) {
          return FaridTile(farid: farids[index]);
        });
  }
}
