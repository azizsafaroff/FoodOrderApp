import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              title: "Privacy policy",
              action: false,
            ),
            SizedBox(
              height: getProportionScreenHeight(24.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(40.0),
              ),
              child: Text(
                """   Each of the restaurants and other locations available through the Service (a “Venue”) has adopted Eat App' proprietary reservation and inventory management system (the “Platform"). The Platform interacts with the Venue to find available reservations, to secure, change or cancel online reservations, and to confirm that reservations were honored. Where reservations are placed directly with a Venue that uses the Platform, or through other third party reservation services that the Venue may use, information about patrons of a Venue (each, a “Guest”) is recorded in (or transferred to) the Platform to assist the Venue in managing the reservation and provide services to such Guest. While an individual Venue’s reservation inventory is accessible to the Platform to perform these functions, other information that may be stored by a Venue (for example, credit card numbers) is not accessible to the Platform. Where a Guest may pay or enter payment information via the Platform (either to hold a reservation, or for services received at a Venue), payment is processed by a third party payment processor such as Stripe and information about that payment is subject to such processor’s policies. Note that in no case does Eat App store credit card or payment information on the System; all such information is held by our third party payment processor(s) or the Venue itself.""",
                style: TextStyle(
                  fontSize: getProportionScreenWidth(14.0),
                  height: getProportionScreenHeight(2.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
