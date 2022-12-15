import 'package:flutter/material.dart';
import 'package:myprice/home/home.dart';
import 'package:myprice/home/profile.dart';
import 'package:myprice/home/setting.dart';

class HomeMainBase extends StatefulWidget {
  const HomeMainBase({key});

  @override
  State<HomeMainBase> createState() => _HomeMainBaseState();
}

class _HomeMainBaseState extends State<HomeMainBase> {
  int _selectedIndex = 0;

  final ScrollController _homeController = ScrollController();

  Widget _listViewBody() {
    return ListView.separated(
        controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.green,
            child: Container(
                color: Colors.amber,
                margin: EdgeInsets.all(5),
                child: InkWell(
                  child: Text(
                    'Items   $index',
                  ),
                  onTap: () => print("The selected is $index poication"),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              thickness: 1,
            ),
        itemCount: 50);
  }

  Widget loadingBody(i) {
    print("selection index is $i");
    if (i == 0) {
      return const HomeWidget();
      // return SettingWidget();
    }
    if (i == 1) {
      return const ProfileWidget();
    }
    if (i == 2) {
      return const SettingWidget();
    } else {
      return _listViewBody();
    }
  }

  var selectedIndesx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Setting Alerts'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
