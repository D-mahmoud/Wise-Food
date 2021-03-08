import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:wisefood/widgets/cusines.dart';

import 'package:wisefood/providers/stores.dart';

class CuisinesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storesData = provider.Provider.of<Stores>(context);
    final stores = storesData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: stores.length,
      itemBuilder: (ctx, i) => provider.ChangeNotifierProvider.value(
        value: stores[i],
        child: CuisinePage(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 10,
      ),
    );
  }
}
