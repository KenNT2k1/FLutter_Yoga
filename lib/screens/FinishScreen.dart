import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Congratulations!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text(
                "YOU HAVE DONE IT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(height: 30),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(125),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/yoga3.jpeg"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoItem("121", "KCal"),
                  const SizedBox(width: 40),
                  _buildInfoItem("35", "Minutes"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    onPressed: () {},
                    label: "Do it Again",
                    color: Colors.green,
                  ),
                  _buildActionButton(
                    onPressed: () {},
                    label: "Share",
                    color: Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                color: Colors.blueGrey,
                height: 170,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color.fromARGB(255, 49, 201, 15),
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({required VoidCallback onPressed, required String label, required Color color}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
