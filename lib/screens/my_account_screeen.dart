import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leadingWidth: 80,

        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        centerTitle: true,

        title: const Text(
          "My Account",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: const [

            SizedBox(height: 15),

            AvatarSection(),

            SizedBox(height: 30),

            ProfileTextField(
              title: "First Name",
              value: "Eva",
            ),

            SizedBox(height: 20),

            ProfileTextField(
              title: "Last Name",
              value: "Williamson",
            ),

            SizedBox(height: 20),

            ProfileTextField(
              title: "Email Address",
              value: "eva.williamson@gmail.com",
            ),

            SizedBox(height: 20),

            ProfileTextField(
              title: "Confirm Email Address",
              value: "eva.williamson@gmail.com",
            ),

            SizedBox(height: 20),

            CountryDropdown(),

            SizedBox(height: 20),

            PhoneField(),

            SizedBox(height: 20),

            ProfileTextField(
              title: "Date of Birth",
              value: "14 / 05 / 1993",
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Stack(
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundImage:
              AssetImage("assets/images/avatar.jpg"),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),

        const SizedBox(height: 18),

        const Text(
          "Your User Avatar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          "File smaller than 10MB and at least 44x44px.",
          style: TextStyle(color: Colors.grey.shade600),
        ),

        Text(
          "Supporting formats are JPG or PNG.",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}



class ProfileTextField extends StatelessWidget {
  final String title;
  final String value;

  const ProfileTextField({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          initialValue: value,

          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF6F7FB),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}



class CountryDropdown extends StatelessWidget {
  const CountryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Country or Region",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),

          decoration: BoxDecoration(
            color: const Color(0xffF6F7FB),
            borderRadius: BorderRadius.circular(12),
          ),

          child: const Row(
            children: [

              Text(
                "🇺🇸",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(width: 12),

              Text(
                "United States",
                style: TextStyle(fontSize: 16),
              ),

              Spacer(),

              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        )
      ],
    );
  }
}



class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Phone Number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          initialValue: "+1 (823) 239 - 2934 - 23",

          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 14, right: 10),
              child: Text(
                "🇺🇸",
                style: TextStyle(fontSize: 22),
              ),
            ),

            prefixIconConstraints:
            const BoxConstraints(minWidth: 50),

            filled: true,
            fillColor: const Color(0xffF6F7FB),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
          ),
        )
      ],
    );
  }
}