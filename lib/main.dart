import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'name': 'توريد مياه التحلية', 'image': 'images/whater.webp'},
    {'name': 'خدمات الصرف الصحي', 'image': 'images/srfshy.jpg'},
    {'name': 'كمبروسير', 'image': 'images/comprser.jpg'},
    {'name': 'نقل مخلفات', 'image': 'images/nql.jpeg'},
    {'name': 'تغسيل خزانات', 'image': 'images/clean.jpeg'},
    {'name': 'عزل الخزانات', 'image': 'images/3zl.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // جعل الخلفية شفافة لتظهر الصورة
        elevation: 10.0,
        shadowColor: Colors.black54,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image:
                  AssetImage('images/bsaasic.jpeg'), //احذف حرف التاني من بيسك
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' ' //نص اسم البرنامج,
              ,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '' //مكان اسم الترحيب
              ,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.menu, color: const Color.fromARGB(255, 16, 16, 16)),
            onPressed: () {
              // هنا زر الاعدادات او اي ايقونه تانيه
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                  'images/aah2024-12-06 181718.png'), // مجلد asset لازم تكون مضافه الصور
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.9), // تطبيق تأثير شفاف للصورة
                BlendMode.dstATop,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    // هنا  ضفت خلفيتين عشان تكون اوضح
                    image: DecorationImage(
                      image:
                          AssetImage('images/ayah back.png'), //الخلفيه الاولي
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('images/ayah back.png'), //الخلفيه الثانيه
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(
                16.0), // هنا تكبير الصور و تصغيرها في الرئيسيه
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NextPage(serviceName: services[index]['name']!),
                      ),
                    );
                  },
                  child: Card(
                    color: Color.fromARGB(146, 246, 248, 249),
                    elevation: 4.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              services[index]['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Center(
                                  child: Text(
                                    'لا يمكن تحميل الصورة',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            services[index]['name']!,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String serviceName;

  NextPage({required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(serviceName),
        centerTitle: true, // جعل العنوان في النص
      ),
      body: Center(
        child: Text(
          'هذه صفحة خاصة بـ $serviceName',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
