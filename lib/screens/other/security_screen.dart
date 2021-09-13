import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              title: "Security",
              action: false,
            ),
            SizedBox(
              height: getProportionScreenHeight(24.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "Tips for restaurants to reduce their risk of a cyber attack",
                style: TextStyle(fontSize: getProportionScreenWidth(18.0), fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "Upserve talked to cybersecurity experts about how restaurant owners can reduce their risk of a cyber attack.",
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "1. Pay attention to devices connected\n to your wireless network.",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
First, make sure you’re using the latest operating system, as older systems may have security loopholes when not updated. “A lot of devices are still running Windows XP,” Tcherchian says. Next, limit access to those devices with a PIN or passcode and train staff to only use those devices for business. “A lot of times you’ll see employees on the POS device browsing the internet on it,” Tcherchian says. “That’s exactly how a lot of malware gets onto a network.”

""",
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "2. Caution employees about phishing emails",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
The brewery ransomware attack mentioned above resulted from someone downloading an email attachment. “Some criminal organizations, the first thing they’re going to attempt to do is send you a phishing email that infects your computer with malware,” says Keith Jarvis, senior security researcher at global cybersecurity company Secureworks. “The weakest link in most organizations is humans,” he adds. Employees should be on their guard to avoid clicking on suspicious emails or attachments. Devices should have antivirus protection and malware detection software. Jarvis also suggests setting up two-factor authentication for things like vendor payments so it’s harder for crooks to authorize a fraudulent payment.

              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "3. Scrutinize your third-party vendors ",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
Most restaurants work with at least one outside vendor such as an employee payroll service, online ordering app, or loyalty program. “With any sort of third-party vendor that is going to have access to consumer payment information, make sure they’re PCI compliant, that their security measures are equivalent to what would you have,” says Paige Boshell, managing member of Privacy Counsel LLC, a provider of cybersecurity and privacy legal services. The Payment Card Industry Data Security Standard (PCI DSS) is a set of security standards requiring all companies (regardless of size) that receive, process, store or transfer credit card information to do so in a secure environment. For vendors with access to employee information, such as a payroll vendor, find out how that information is stored and protected. By managing third-party access privileges, those vendors can spend more time supporting customers while you can spend less time worrying about security issues.  Also make sure that employees only have access to the information they need. An HR person needs access to payroll and employee information, but a server or bartender likely does not. (Upserve is PCI compliant.)
              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "4. Store passwords securely",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
Never store passwords in a Word document or on paper stored near a computer. Instead, Anton Kioroglo, chief security officer for Security First IT, LLC, an IT management and security firm, recommends using an online password manager such as Dashlane or LastPass. “A password manager will provide logs of people accessing the password information,” he says. “That can … help with who was the last one who went in there before there was a problem.”

              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "5. Background check employees",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
The U.S. moved to EMV technology (credit card chips) a few years ago, while most other countries use the more secure chip and PIN technology. Another difference: in most other countries, restaurants process credit card transactions with a portable terminal at the customers’ table. In the U.S., most restaurant servers take credit cards from customers and process transactions behind the scenes. This is a potential security loophole, because employees acting in bad faith can potentially use a camera phone to snap photo of the credit card for fraudulent use while the credit card is out of sight. “Theoretically, doing something like a background check would help protect against that,” Kioroglo says.
              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "6. Give each server a unique identifier",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
Your POS system should be configured so that each server logs in with a unique identifier. That way, you can track patterns and identify potential bad actors if customers complain about fraudulent credit card use after visiting your restaurant. “You can quickly see going back through the data, if there are employees that pop up more often in cards that are breached,” Kioroglo says.
              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                "7. Use a firewall to separate devices",
                style: TextStyle(
                    fontSize: getProportionScreenWidth(18.0),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8),),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(20),
                horizontal: getProportionScreenWidth(50),
              ),
              child: Text(
                """
A correctly configured firewall can (among other things) keep malware-infected devices from infecting other devices on your network. “Your kiosks never need to print to your main office printer, so they should not be on the same network,” Kioroglo says. “The back-office computer doesn’t need to communicate with the credit card chip reader. Network bifurcation helps significantly.”

PCI compliance and other aspects of cybersecurity can be complicated, so unless you’re a large restaurant brand with a staff person or department dedicated to cybersecurity, you may want to hire an outside firm to help you go beyond the basics outlined above. “The PCI compliance document itself is 400 pages you have to read through, so having a strong partner in this is vital,” Kioroglo says. 
 
              """,
                style: TextStyle(fontSize: getProportionScreenWidth(14.0), fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
