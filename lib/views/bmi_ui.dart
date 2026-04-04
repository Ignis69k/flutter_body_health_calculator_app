import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'คำนวณหาค่าดัชนีมวลกาย (BMI)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/bmi.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),

          Align(alignment: Alignment.centerLeft, child: Text('น้ำหนัก (kg.)')),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'กรุณากรอกน้ำหนัก',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Align(alignment: Alignment.centerLeft, child: Text('ส่วนสูง (cm.)')),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'กรุณากรอกส่วนสูง',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('คำนวณ BMI', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('คำนวณ BMI', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('BMI'),
                Text(
                  '0.00',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text('การแปรผล'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
