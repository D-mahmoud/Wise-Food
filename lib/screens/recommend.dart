import 'package:flutter/material.dart';

import 'package:wisefood/widgets//stores/stores_grid.dart';
import 'package:wisefood/widgets/drawer.dart';

import 'package:wisefood/providers/stores.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorites,
  all,
}

class RecommendPage extends StatefulWidget {
  RecommendPage(this._userName);
  final _userName;

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = true;
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Stores>(context).fetchAndSetStores().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          ///search bar by using textfields
          title: !isSearch
              ? Text('Hello ${widget._userName}! ')
              : TextField(
                  decoration:
                      InputDecoration(hintText: 'Search For Restaurants Here'),
                ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.all,
                ),
              ],
            ),
            isSearch
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        isSearch = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        isSearch = true;
                      });

                      //search here
                    })
          ]),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StoresGrid(_showOnlyFavorites),
    );
  }
}
