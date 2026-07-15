import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool agreeTerms = true;
  bool receiveOffers = true;

  final TextEditingController firstNameController =
  TextEditingController(text: "Eva");

  final TextEditingController lastNameController =
  TextEditingController(text: "Williamson");

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  String selectedCountry = "United States";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              Row(
                children: [

                  Expanded(
                    child: Column(
                      children: const [

                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 8),

                        Divider(
                          color: Colors.blue,
                          thickness: 3,
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: const [

                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 11),

                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              buildLabel("First Name"),
              buildTextField(
                controller: firstNameController,
                hint: "First Name",
              ),

              const SizedBox(height: 20),

              buildLabel("Last Name"),
              buildTextField(
                controller: lastNameController,
                hint: "Last Name",
              ),

              const SizedBox(height: 20),

              buildLabel("Email Address"),
              buildTextField(
                controller: emailController,
                hint: "Your Email",
                suffix: const Icon(Icons.email_outlined),
              ),

              const SizedBox(height: 20),

              buildLabel("Country or Region"),

              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    isExpanded: true,
                    items: const [

                      DropdownMenuItem(
                        value: "United States",
                        child: Row(
                          children: [
                            Text("🇺🇸"),
                            SizedBox(width: 10),
                            Text("United States"),
                          ],
                        ),
                      ),

                      DropdownMenuItem(
                        value: "Nigeria",
                        child: Row(
                          children: [
                            Text("🇳🇬"),
                            SizedBox(width: 10),
                            Text("Nigeria"),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildLabel("Password"),
              buildTextField(
                controller: passwordController,
                hint: "Password",
                obscure: true,
              ),

              const SizedBox(height: 18),

              buildSwitchTile(
                text:
                "By registering, you agree with our\nTerms, Privacy Policy.",
                value: agreeTerms,
                onChanged: (v) {
                  setState(() {
                    agreeTerms = v;
                  });
                },
              ),

              const SizedBox(height: 12),

              buildSwitchTile(
                text:
                "Sign up for early sale access plus new arrivals and promotions.",
                value: receiveOffers,
                onChanged: (v) {
                  setState(() {
                    receiveOffers = v;
                  });
                },
              ),

              const SizedBox(height: 30),

              Row(
                children: [

                  socialButton(
                    Colors.pink.shade50,
                    "G",
                    Colors.red,
                  ),

                  const SizedBox(width: 12),

                  socialButton(
                    Colors.blue.shade50,
                    "f",
                    Colors.blue,
                  ),

                  const SizedBox(width: 12),

                  socialButton(
                    Colors.black87,
                    "APp",
                    Colors.white,
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget buildSwitchTile({
    required String text,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),

        CupertinoSwitch(
          value: value,
          activeColor: Colors.blue,
          onChanged: onChanged,
        )
      ],
    );
  }

  Widget socialButton(
      Color bgColor, String text, Color textColor) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

