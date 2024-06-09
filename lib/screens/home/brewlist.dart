import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/Brew.dart';
import 'BrewTile.dart';

class BrewList extends StatefulWidget {

  @override
  State<BrewList> createState() => _BrewListState();
}


class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<List<Brew?>?>(context);

    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (context,index){
        return BrewTile(brew: data?[index]);
      },
    );
  }
}
