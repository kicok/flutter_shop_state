import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/user_products_screen.dart';
import '../screens/orders_screen.dart';
import '../providers/auth.dart';
import '../helpers/custom_rouct.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);

              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (context) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(
                  '/'); //로그아웃 할때 main 로직을태움 : 자동로그인 로직을 실행시켜 문제 없음을 확인 해 예기치 못한 상황을 대비..
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          )
        ],
      ),
    );
  }
}
