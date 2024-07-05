import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class XsChatbotPage extends StatefulWidget {
  const XsChatbotPage({Key? key}) : super(key: key);

  @override
  _XsChatbotPageState createState() => _XsChatbotPageState();
}

class _XsChatbotPageState extends State<XsChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _chatHistory = []; // 채팅 내역을 저장할 리스트
  bool _isLoading = false; // 데이터를 로딩 중인지 여부
  String _errorMessage = ''; // 에러 메시지

  Future<void> _sendQuery(String query) async {
    setState(() {
      _isLoading = true; // 로딩 상태로 변경
    });

    final url = Uri.parse('https://chatbot-oupmu.run.goorm.site/question');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'action': {'params': {'question': query}}}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final botResponse =
        responseData['template']['outputs'][0]['simpleText']['text'];
        setState(() {
          _chatHistory.insert(0, {'sender': 'User', 'message': query}); // 사용자 질문을 채팅 내역에 추가
          _chatHistory.insert(0, {'sender': 'Bot', 'message': botResponse}); // 챗봇 응답을 채팅 내역에 추가
          _errorMessage = ''; // 에러 메시지 초기화
        });
      } else {
        setState(() {
          _errorMessage = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false; // 로딩 상태 해제
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동엽쌤 Style Chatbot'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.black, // 배경색을 검정색으로 변경
                  child: ListView.builder(
                    reverse: true, // 채팅 내역을 역순으로 표시
                    itemCount: _chatHistory.length,
                    itemBuilder: (context, index) {
                      final message = _chatHistory[index]['message'];
                      final sender = _chatHistory[index]['sender'];
                      final isUser = sender == 'User';

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser ? Colors.blueAccent : Colors.grey[700],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              message!,
                              style: TextStyle(
                                color: Colors.white, // 모든 글씨 색상을 흰색으로 변경
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey), // 채팅 내역과 입력창 구분선
          _buildInputField(),
          if (_errorMessage.isNotEmpty) Text(_errorMessage, style: TextStyle(color: Colors.red)), // 에러 메시지 표시
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 색상을 회색으로 변경
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                filled: true,
                fillColor: Colors.grey[800], // 입력창 배경색을 어두운 회색으로 변경
              ),
              style: TextStyle(color: Colors.white), // 입력 텍스트 색상을 흰색으로 변경
            ),
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white), // 아이콘 색상을 흰색으로 변경
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                _sendQuery(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
