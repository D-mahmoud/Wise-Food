import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/store.dart';

class StoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context, listen: false);

    //print('ProductItem built again');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(
            //   ProductDetailScreen.routeName,
            //   arguments: product.id,
            // );
          },
          // child: Image.network(
          //   product.imageUrl,
          //   fit: BoxFit.cover,
          // ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Store>(
            builder: (ctx, store, _) => IconButton(
              icon: Icon(
                store.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                store.toggleFavoriteStatus();
              },
            ),
          ),
          // title: Text(
          //   store.storeTitle,
          //   textAlign: TextAlign.center,
          // ),
        ),
      ),
    );
  }
}
