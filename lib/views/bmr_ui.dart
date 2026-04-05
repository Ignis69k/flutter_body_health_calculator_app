import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  //int _gender = 1; // 1 = ชาย, 2 = หญิง
  
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String bmrValue = '0.00';
  String gender = 'ชาย';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5F8), // Light pinkish background tone
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text(
                'คำนวณหาอัตราการเผาผลาญที่\nร่างกายต้องการ (BMR)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/bmr.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'เพศ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() { gender = 'ชาย'; });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: gender == 'ชาย' ? Colors.blue[100] : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: gender == 'ชาย' ? Colors.blue[100]! : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'ชาย',
                            style: TextStyle(
                              color: gender == 'ชาย' ? Colors.blue[800] : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() { gender = 'หญิง'; });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: gender == 'หญิง' ? Colors.pink[100] : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: gender == 'หญิง' ? Colors.pink[100]! : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'หญิง',
                            style: TextStyle(
                              color: gender == 'หญิง' ? Colors.pink[800] : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 15),
              const Text(
                'น้ำหนัก (kg.)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: weightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรอกน้ำหนักของคุณ',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              const Text(
                'ส่วนสูง (cm.)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: heightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรอกส่วนสูงของคุณ',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              const Text(
                'อายุ (ปี)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรอกอายุของคุณ',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if(weightCtrl.text.isEmpty || heightCtrl.text.isEmpty || ageCtrl.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  double weight = double.parse(weightCtrl.text);
                  double height = double.parse(heightCtrl.text);
                  int age = int.parse(ageCtrl.text);

                  double bmr = 0;
                  if(gender == 'ชาย'){
                    bmr = 66.5 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
                  }else{
                    bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
                  }
                  setState(() {
                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF75B25), // deep orange
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'คำนวณ BMR',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    weightCtrl.clear();
                    heightCtrl.clear();
                    ageCtrl.clear();
                    gender = 'ชาย';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB5AFB6), // grey color matching image
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'ล้างข้อมูล',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFCBE7CE), // Light green matching image
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    const Text(
                      'BMR',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    Text(
                      bmrValue,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEA3B3B), // Red tone
                      ),
                    ),
                    const Text(
                      'kcal/day',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
