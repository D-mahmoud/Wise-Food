import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wisefood/screens/Edit_Store.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:wisefood/widgets/admin_store_item.dart';
import 'package:wisefood/widgets/drawer.dart';

class AdminPage extends StatelessWidget {
  static const routeName = '/user-stores';

  Future<void> _refreshStores(BuildContext context) async {
    await Provider.of<Stores>(context, listen: false)
        .fetchAndSetStores(filterByUser: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Stores'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).pushNamed(EditStore.routeName);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditStore()),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<Object>(
          future: _refreshStores(context),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshStores(context),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Consumer<Stores>(
                        builder: (context, storesData, child) =>
                            ListView.builder(
                          itemCount: storesData.items.length,
                          itemBuilder: (_, i) => Column(
                            children: [
                              Text(storesData.items[i].id),
                              AdminStoreItem(
                                storesData.items[i].id,
                                storesData.items[i].storeTitle,
                                storesData.items[i].number,

                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
