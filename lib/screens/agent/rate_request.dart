import 'package:cargo_admin/app/shared_components/responsive_builder.dart';
import 'package:cargo_admin/constants.dart';
import 'package:cargo_admin/screens/agent/rate_request_details.dart';
import 'package:cargo_admin/widgets/logo.dart';
import 'package:cargo_admin/widgets/my_border_widget.dart';
import 'package:cargo_admin/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class RateRequest extends StatelessWidget {
  const RateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: (ResponsiveBuilder.isMobile(context)
            ? AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.truck,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Rate Request'),
                  ],
                ),
              )
            : null),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Center(
            //   child: Logo(),
            // ),
            if (!ResponsiveBuilder.isMobile(context))
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  kPrimaryColor.withOpacity(0.3),
                  kPrimaryColor.withOpacity(0.6),
                  kPrimaryColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    const Text(
                      'Rate Request',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                  ],
                ),
              ),

            Center(
              child: SizedBox(
                height: size.height * .4,
                width: ResponsiveBuilder.isMobile(context)
                    ? double.infinity
                    : size.width * 0.5,
                child: MyBorderWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PrimaryButton(
                        buttonText: 'Sea Rate Request',
                        icon: FontAwesomeIcons.ship,
                        onPressed: () {
                          Get.to(() => const RateRequestDetails(
                              appBarTitle: 'Sea Rate Request'));
                        },
                      ),
                      PrimaryButton(
                        buttonText: 'Air Rate Request',
                        icon: FontAwesomeIcons.plane,
                        onPressed: () {
                          Get.to(() => const RateRequestDetails(
                              appBarTitle: 'Air Rate Request'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
