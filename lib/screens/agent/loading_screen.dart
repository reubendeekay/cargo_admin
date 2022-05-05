import 'package:cargo_admin/app/config/routes/app_pages.dart';
import 'package:cargo_admin/providers/auth_provider.dart';
import 'package:cargo_admin/screens/agent/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () async {
      await Provider.of<AuthProvider>(context, listen: false).getUser(uid);

      Get.toNamed(AppPages.initial);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
