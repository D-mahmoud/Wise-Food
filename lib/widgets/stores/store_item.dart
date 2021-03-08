import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/models/store.dart';
import 'package:wisefood/providers/auth.dart';
import 'package:wisefood/screens/store_detail.dart';

class StoreItem extends StatelessWidget {
   
  static const routeName = 'store-item';
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context, listen: false);

    final authData = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print(store.storeTitle);
            Navigator.pushNamed( 
              context,
              StoreDetail.routeName,
              arguments: store.id,
            );
          },
          child: Image.network(
            store.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.green[200],
          leading: Consumer<Store>(
            builder: (ctx, store, _) => IconButton(
              icon: Icon(
                store.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                store.toggleFavoriteStatus(authData.token, authData.userId);
              },
            ),
          ),
          title: Text(
            store.storeTitle,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
