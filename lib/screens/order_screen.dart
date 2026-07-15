import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,

          leading: const BackButton(
            color: Colors.black,
          ),

          title: const Text(
            "Your Orders",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            )
          ],

          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Orders"),
              Tab(text: "Returns"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              children: const [

                OrderTile(
                  orderNo: "#481293",
                  amount: "USD \$9,829.00",
                  items: "4 Items",
                  inProgress: true,
                ),

                SizedBox(height: 25),

                OrderTile(
                  orderNo: "#541299",
                  amount: "USD \$11,250.00",
                  items: "5 Items",
                  inProgress: true,
                ),

                SizedBox(height: 25),

                OrderTile(
                  orderNo: "#481292",
                  amount: "USD \$9,829.00",
                  items: "4 Items",
                  inProgress: false,
                  date: "Jul 26, at 3:00 PM",
                ),

                SizedBox(height: 25),

                OrderTile(
                  orderNo: "#481276",
                  amount: "USD \$11,250.00",
                  items: "5 Items",
                  inProgress: false,
                  date: "Mar 1, at 7:00 PM",
                ),

                SizedBox(height: 25),

                OrderTile(
                  orderNo: "#518927",
                  amount: "USD \$1,890.00",
                  items: "2 Items",
                  inProgress: false,
                  date: "Apr 25, at 3:00 AM",
                ),
              ],
            ),

            const Center(
              child: Text("No Returns"),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderTile extends StatelessWidget {
  final String orderNo;
  final String amount;
  final String items;
  final bool inProgress;
  final String? date;

  const OrderTile({
    super.key,
    required this.orderNo,
    required this.amount,
    required this.items,
    required this.inProgress,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                orderNo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                items,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),

        StatusWidget(
          inProgress: inProgress,
          date: date,
        ),
      ],
    );
  }
}


class StatusWidget extends StatelessWidget {
  final bool inProgress;
  final String? date;

  const StatusWidget({
    super.key,
    required this.inProgress,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Icon(
              inProgress
                  ? Icons.access_time
                  : Icons.check,
              color: Colors.blue,
              size: 20,
            ),

            const SizedBox(width: 6),

            Text(
              inProgress
                  ? "In Progress"
                  : "Delivered",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        if (inProgress)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 4),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: index < 3
                      ? Colors.blue
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        else
          Text(
            date ?? "",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}
