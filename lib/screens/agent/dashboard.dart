import 'package:cargo_admin/constants.dart';
import 'package:cargo_admin/helpers/lists.dart';
import 'package:cargo_admin/providers/auth_provider.dart';
import 'package:cargo_admin/screens/agent/loading_screen.dart';
import 'package:cargo_admin/widgets/logo.dart';
import 'package:cargo_admin/widgets/my_border_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

final uid = FirebaseAuth.instance.currentUser!.uid;

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.laptop),
            SizedBox(width: 10),
            Text('Dashboard'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: user.user == null
          ? const LoadingScreen()
          : ListView(
              children: [
                const Center(child: Logo()),
                MyBorderWidget(
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                        dashboardWidgets.length,
                        (i) => GestureDetector(
                              onTap: () {
                                Get.to(() => dashboardWidgets[i]);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: LinearGradient(
                                              colors: [
                                                kPrimaryColor.withOpacity(0.9),
                                                kPrimaryColor,
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft)),
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                          child: Icon(dashboardIcons[i],
                                              size: 50, color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(dashboardTitles[i]),
                                ],
                              ),
                            )),
                  ),
                )
              ],
            ),
    );
  }
}
