import 'package:flutter/material.dart';

import 'package:wisefood/widgets//stores/stores_grid.dart';
import 'package:wisefood/widgets/drawer.dart';

import 'package:wisefood/providers/stores.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class RecommendPage extends StatefulWidget {
  final _userName;
  RecommendPage(this._userName);
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = true;
  bool isSearch = false;

  void initState() {
    super.initState();
  }

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
                  if (selectedValue == FilterOptions.Favorites) {
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
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            isSearch
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        this.isSearch = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        this.isSearch = true;
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
