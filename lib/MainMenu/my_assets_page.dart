import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAssetsPage extends StatelessWidget {
  const MyAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: const TabBar(
                indicatorColor: Colors.red,
                tabs: [
                  Tab(text: 'MY 자산'),
                  Tab(text: 'MY 페이지'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MyAssetsTab(),
                  MyPageTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAssetsTab extends StatelessWidget {
  const MyAssetsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '계좌번호',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('총 손익', style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text('+132,700원', style: TextStyle(color: Colors.red, fontSize: 18)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('총 매입', style: TextStyle(color: Colors.white)),
                      Text('1,156,000원', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('총 평가', style: TextStyle(color: Colors.white)),
                      Text('1,288,700원', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('실현 손익', style: TextStyle(color: Colors.white)),
                      Text('0원', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('종목명', style: TextStyle(color: Colors.white)),
                      Text('삼성전자', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('매입가', style: TextStyle(color: Colors.white)),
                      Text('68,000', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('현재가', style: TextStyle(color: Colors.white)),
                      Text('75,700', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('보유수량', style: TextStyle(color: Colors.white)),
                      Text('17', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('평가손익', style: TextStyle(color: Colors.white)),
                      Text('+132,700원', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPageTab extends StatelessWidget {
  const MyPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile_image.png'), // 이미지 경로
            ),
            const SizedBox(height: 10),
            Text(
              user?.displayName ?? 'Anonymous',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user != null ? user.email ?? 'No Email' : 'No Email',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('기본정보', style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('이름', style: TextStyle(color: Colors.grey)),
                      Text(user?.displayName ?? 'Anonymous', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('이메일', style: TextStyle(color: Colors.grey)),
                      Text(user != null ? user.email ?? 'No Email' : 'No Email', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('UID', style: TextStyle(color: Colors.grey)),
                      Text(user?.uid ?? 'No UID', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('문의', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            const Text('탈퇴하기', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
