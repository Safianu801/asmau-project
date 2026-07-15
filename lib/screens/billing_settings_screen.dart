import 'package:flutter/material.dart';

class BillingSettingsScreen extends StatefulWidget {
  const BillingSettingsScreen({super.key});

  @override
  State<BillingSettingsScreen> createState() => _BillingSettingsScreenState();
}

class _BillingSettingsScreenState extends State<BillingSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "Billing Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:16),
            child: CircleAvatar(
              radius:16,
              backgroundColor: Colors.black,
              child: Icon(Icons.person,
                  size:18,
                  color: Colors.white),
            ),
          )
        ],
      ),

      body: ListView(
        children: const [

         BankCardWidget(),

          SizedBox(height:10),

          MonthSection(
            month: "May 2021",
            transactions: [
              TransactionData(
                icon: Icons.shopping_bag_outlined,
                title: "Order Payment",
                date: "May 21 at 8:15 PM",
                amount: "- \$4520.00",
              ),
              TransactionData(
                icon: Icons.credit_card,
                title: "Subscription",
                date: "May 11 at 8:00 AM",
                amount: "- \$2.99",
              ),
            ],
          ),

          MonthSection(
            month: "April 2021",
            transactions: [
              TransactionData(
                icon: Icons.shopping_bag_outlined,
                title: "Order Payment",
                date: "Apr 15 at 9:35 AM",
                amount: "- \$1290.00",
              ),
              TransactionData(
                icon: Icons.credit_card,
                title: "Subscription",
                date: "Apr 11 at 8:00 AM",
                amount: "- \$2.99",
              ),
              TransactionData(
                icon: Icons.shopping_bag_outlined,
                title: "Order Payment",
                date: "Apr 10 at 1:20 PM",
                amount: "- \$1290.00",
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class BankCardWidget extends StatelessWidget {
  const BankCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            color: Colors.black12,
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(Icons.account_balance,color: Colors.red),

              const SizedBox(width:8),

              const Text(
                "Bank of America",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize:18,
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal:12,
                    vertical:5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Main",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height:30),

          const Text(
            "5375   9423   0239   1487",
            style: TextStyle(
              letterSpacing:3,
              fontSize:22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:8),

          const Text(
            "10/24",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height:20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: const [

                  Text(
                    "Vladimir Petrov",
                    style: TextStyle(
                        color: Colors.grey),
                  ),

                  SizedBox(height:4),

                  Text(
                    "\$124,820",
                    style: TextStyle(
                      fontSize:22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Row(
                children: const [

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String date;
  final String amount;

  const TransactionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:14),

      child: Row(

        children: [

          Container(
            width:42,
            height:42,

            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(icon),
          ),

          const SizedBox(width:15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize:16,
                  ),
                ),

                const SizedBox(height:4),

                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
          ),

          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class TransactionData {

  final IconData icon;
  final String title;
  final String date;
  final String amount;

  const TransactionData({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
  });
}

class MonthSection extends StatelessWidget {

  final String month;
  final List<TransactionData> transactions;

  const MonthSection({
    super.key,
    required this.month,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            month,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height:10),

          ...transactions.map(
                (e) => TransactionTile(
              icon: e.icon,
              title: e.title,
              date: e.date,
              amount: e.amount,
            ),
          ),
        ],
      ),
    );
  }
}