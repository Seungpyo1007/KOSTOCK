import 'package:flutter/material.dart';

class MyAssetsPage extends StatelessWidget {
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
              child: TabBar(
                indicatorColor: Colors.red,
                tabs: [
                  Tab(text: 'MY 자산'),
                  Tab(text: 'MY 페이지'),
                ],
              ),
            ),
            Expanded(
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
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile_image.png'), // 이미지 경로
            ),
            SizedBox(height: 10),
            Text(
              'Z | 존_DY',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '개인회원/일반 투자자',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('기본정보', style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('이름', style: TextStyle(color: Colors.grey)),
                      Text('이선우', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('영문이름', style: TextStyle(color: Colors.grey)),
                      Text('Lee Sunwoo', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('휴대폰번호', style: TextStyle(color: Colors.grey)),
                      Text('010-****-9064', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('이메일', style: TextStyle(color: Colors.grey)),
                      Text('sdh230310@sdh.hs.kr', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('계좌번호', style: TextStyle(color: Colors.grey)),
                      Text('2913-****', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('문의', style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('탈퇴하기', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
