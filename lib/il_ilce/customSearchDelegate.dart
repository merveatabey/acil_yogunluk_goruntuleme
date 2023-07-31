import 'package:acil_servis/il_ilce/hastaneAra.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
}

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context, null);}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return HastaneAra();
  }

  //arama önerileri
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}