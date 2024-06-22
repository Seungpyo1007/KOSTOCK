import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('KOSTOCK 이용약관'),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KOSTOCK 이용약관',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '제1조 (목적)\n'
                  '이 약관은 [KOSTOCK] (이하 "회사")가 제공하는 주식 거래 및 관련 서비스(이하 "KOSTOCK")의 이용 조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제2조 (회원의 정의)\n'
                  '"회원"이란 회사의 서비스에 접속하여 이 약관에 따라 회사와 이용 계약을 체결하고, 회사가 제공하는 서비스를 이용하는 고객을 말합니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제3조 (약관의 효력 및 변경)\n'
                  '이 약관은 회원가입 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다. 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경될 경우 그 내용을 회원에게 공지합니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제4조 (회원 가입 신청)\n'
                  '회원 가입을 희망하는 자는 회사가 정한 회원 가입 양식에 따라 회원 정보를 기입한 후 약관에 동의한다는 의사 표시를 함으로써 회원 가입을 신청합니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제5조 (회원의 의무)\n'
                  '회원은 관계 법령, 이 약관의 규정, 이용 안내 및 서비스와 관련하여 회사가 공지한 주의 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안 됩니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제6조 (서비스의 제공 및 변경)\n'
                  '회사는 회원에게 아래와 같은 서비스를 제공합니다:\n'
                  '1. 주식 거래 서비스\n'
                  '2. 주식 관련 정보 제공 서비스\n'
                  '3. 기타 회사가 추가 개발하거나 다른 회사와의 제휴 계약 등을 통해 회원에게 제공하는 일체의 서비스\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제7조 (서비스 이용의 제한 및 중지)\n'
                  '회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스 제공이 불가능한 경우 서비스의 일부 또는 전부를 제한하거나 중지할 수 있습니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제8조 (회원 탈퇴 및 자격 상실)\n'
                  '회원은 언제든지 탈퇴를 요청할 수 있으며, 회사는 즉시 회원 탈퇴를 처리합니다. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원 자격을 제한 및 정지시킬 수 있습니다:\n'
                  '1. 가입 신청 시에 허위 내용을 등록한 경우\n'
                  '2. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자 거래 질서를 위협하는 경우\n'
                  '3. 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제9조 (개인정보의 보호)\n'
                  '회사는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '제10조 (책임의 제한)\n'
                  '회사는 천재지변 등 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 또한, 회사는 회원의 귀책 사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.\n',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.all(Colors.white),
                ),
                Text(
                  '약관에 동의합니다',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
                ),
                child: Text(
                  '닫기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
