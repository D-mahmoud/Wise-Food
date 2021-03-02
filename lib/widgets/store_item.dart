import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/models/store.dart';
import 'package:wisefood/providers/auth.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:wisefood/screens/store_detail.dart';

class StoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context, listen: false);
    final storeId = ModalRoute.of(context).settings.arguments as String;
    final authData = Provider.of<Auth>(context, listen: false);
    final loadedStore = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeId);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              StoreDetail.routeName,
              arguments: store.id,
            );
          },
          // child: Image.network(
          //   store.imageUrl,
          //   fit: BoxFit.cover,
          // ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Store>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus(authData.token, authData.userId);
              },
            ),
          ),
          title: Text(
            store.storeTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
