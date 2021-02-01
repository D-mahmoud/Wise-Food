import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:wisefood/widgets/store_item.dart';

import 'package:wisefood/providers/stores.dart';
import './store_item.dart';

class StoresGrid extends StatelessWidget {
  final bool showFavs;

  StoresGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final storesData = provider.Provider.of<Stores>(context);
    final stores = showFavs ? storesData.favoriteItems : storesData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: stores.length,
      itemBuilder: (ctx, i) => provider.ChangeNotifierProvider.value(
        value: stores[i],
        child: StoreItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
