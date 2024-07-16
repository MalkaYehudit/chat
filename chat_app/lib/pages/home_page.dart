import 'package:flutter/material.dart';
import '../components/my_appbarr.dart';
import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {


 HomePage();



  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title:'User',
        actions: [],
      ),
      drawer: MyDrawer(),

    );
  }
}