import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/pages/config.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/viagens.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_application_1/colors.dart';

class HomePage extends StatefulWidget {
  final Usuario user;
  final List<eventos> events;
  final List<carona> ride;
  const HomePage({Key? key, required this.user, required this.events, required this.ride}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async { return false;},
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: paleta,
          title: ImageIcon(
            AssetImage('lib/go3.png'),
            size: 95,
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFillRemaining(
              child: _selectedIndex == 0
                  ? Home(user:widget.user, events : widget.events, ride: widget.ride)
                  : _selectedIndex == 1
                      ? Viagens(user: widget.user, ride: widget.ride)
                      : Config(user:widget.user, events : widget.events),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 300),
            tabBackgroundColor: paleta,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.directions_bus,
                text: 'Minhas Viagens',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Configurações',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _navigateBottomBar,
          ),
        ),
      ),
    );
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
