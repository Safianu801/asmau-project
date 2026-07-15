import 'package:first_project/screens/analytics_screen.dart';
import 'package:first_project/screens/billing_settings_screen.dart';
import 'package:first_project/screens/my_account_screeen.dart';
import 'package:first_project/screens/order_screen.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Center(
          child: Text("Account",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
        ),
        leading: Icon(Icons.flag_sharp),
        actions: [
        Icon(Icons.notifications,size: 28,
        ),Padding(padding: EdgeInsetsGeometry.only(right: 15))
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 18,vertical: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("My Profile",
              style: TextStyle(
               fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
               ),
              ),

              SizedBox(height: 16,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(9),
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [

                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Image.network("https://picsum.photos/800/450",
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                      
                      SizedBox(width: 10,),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text("Eva Williams",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                           ),
                          ),

                          Text("Premium",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 135,),

                      IconButton(onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Text("SHOPPING",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
               ),
              ),

              SizedBox(height: 10,),
              
              Column(
                children: [
                  AccountTile(
                      title: "Your Orders",
                      icon: Icons.shopping_cart_checkout,
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => OrdersScreen(),
                         ),
                        );
                    },
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Text(
                "ACCOUNT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              
              SizedBox(height: 10,),
              
              Column(
                children: [
                  
                  AccountTile(
                      title: "My Account",
                      icon: Icons.person,
                    onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>
                                MyAccountScreen(),
                            ),
                        );
                    },
                    backgroundColor: Colors.white60,
                  ),

                  AccountTile(
                      title: "Address Book",
                      icon: Icons.location_on_outlined,
                    onTap: () {},
                    backgroundColor: Colors.white60,
                  ),

                  AccountTile(
                      title: "Shopping Preferences",
                      icon: Icons.shopping_bag_outlined,
                    onTap: () {},
                    backgroundColor: Colors.white60,
                  ),

                  AccountTile(
                      title: "Billing Settings",
                      icon: Icons.credit_card_outlined,
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BillingSettingsScreen(),
                          ),
                        );
                    },
                    backgroundColor: Colors.white60,
                  ),

                  AccountTile(
                      title: "Analytics",
                      icon: Icons.show_chart_outlined,
                    onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>
                              AnalyticsScreen(),
                         ),
                        );
                    },
                    backgroundColor: Colors.white60,
                  ),

                  AccountTile(
                      title: "Help & Support",
                      icon: Icons.help_outline,
                    onTap: () {},
                    backgroundColor: Colors.white60,
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Text(
                "APPLICATION",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87
                ),
              ),

              SizedBox(height: 10,),

              Column(
                children: [

                  AccountTile(
                      title: "System Settings",
                      icon: Icons.settings_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color backgroundColor;
  
  const AccountTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
    this.backgroundColor = Colors.white60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(padding: EdgeInsetsGeometry.symmetric(
          horizontal: 4,
          vertical: 14,
          ),
          child: Row(
            children: [

              Icon(
                icon,
                size: 21,
                color: Colors.black87,
              ),

              SizedBox(width: 18,),

              Expanded(child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
                ),
               )
              ),

              trailing ??
            const Icon(
              Icons.chevron_right,
              color: Colors.black87,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
