import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vani/componenets/constant.dart';

class TextInputToSign extends StatefulWidget {
  const TextInputToSign({super.key});

  @override
  State<TextInputToSign> createState() => _TextInputToSignState();
}

class _TextInputToSignState extends State<TextInputToSign> {
  final timecontroller = TextEditingController();
  String _text = "";
  String _filteredText = "";
  int _currentLetterIndex = 0;
  bool _isPlaying = false;
  bool _isPaused = false;
  Timer? _timer;

  Future<void> _displayHandSigns() async {
    _isPlaying = true;
    _isPaused = false;
    _timer = Timer.periodic(Duration(milliseconds: time), (Timer timer) {
      setState(() {
        if (!_isPaused) {
          if (_currentLetterIndex < _filteredText.length - 1) {
            _currentLetterIndex++;
          } else {
            timer.cancel();
            _isPlaying = false;
          }
        }
      });
    });
  }

  void _startDisplay() {
    setState(() {
      _filteredText = _text.toUpperCase();
      _currentLetterIndex = 0;
      _isPlaying = false;
      _isPaused = false;
      _timer?.cancel();
    });

    if (_filteredText.isNotEmpty) {
      _displayHandSigns();
    }
  }

  void _pauseOrResume() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _reset() {
    setState(() {
      _currentLetterIndex = 0;
      _isPlaying = false;
      _isPaused = false;
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9CB2E4).withOpacity(0.6),
                  Color(0xFF9CB2E4).withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFDCE4F8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(1.0),
                          offset: Offset(-2, -2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.menu, color: Color(0xFF3B4F7D), size: 24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(-3, -3),
                            ),
                            BoxShadow(
                              color: Color(0xFFBBC3CE).withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            _text = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Text',
                            hintStyle: TextStyle(
                              fontFamily: 'IBMPlexMono',
                              fontSize: 16,
                              color: Color(0xFF3B4F7D),
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      if (_filteredText.isNotEmpty)
                        Container(
                          height: 200,
                          child: Center(
                            child: _buildHandSign(),
                          ),
                        ),
                      SizedBox(height: 20),
                      if (_isPlaying || _currentLetterIndex > 0) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _pauseOrResume,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFF9574CD),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                                elevation: 0,
                              ),
                              child: Text(
                                _isPaused ? 'Resume' : 'Pause',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'IBMPlexMono',
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: _reset,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFF9574CD),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                                elevation: 0,
                              ),
                              child: Text(
                                'Stop',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'IBMPlexMono',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left:29),
                        child: ElevatedButton(
                          onPressed: _startDisplay,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF9574CD),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                            elevation: 0,
                          ),
                          child: Text(
                            'Display Hand Signs',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexMono',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
                Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Change Image Render Speed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3B4F7D),
                                fontFamily: 'IBMPlexMono',
                              ),
                            ),
                            SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 23),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: time.toDouble(),
                      min: 100,
                      max: 2000,
                      onChanged: (double newValue) {
                        setState(() {
                          time = newValue.round();
                          timecontroller.text = time.toString();
                        });
                      },
                    ),
                  ),
                  TextFormField(
                              controller: timecontroller,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              
                            ),
                          ],
                        ),
                      ),
            ],
          ),
        ],
      ),
    
      );
    
  }

  Widget _buildHandSign() {
    if (_currentLetterIndex >= _filteredText.length) return Container();

    String currentCharacter = _filteredText[_currentLetterIndex];

    if (RegExp('[A-Z]').hasMatch(currentCharacter)) {
      return Image.asset(
        'assets/hand_signs/$currentCharacter.jpg', // Ensure you have images named A.jpg, B.jpg, etc.
        fit: BoxFit.contain,
      );
    } else {
      return Container(); // Display an empty container for non-alphabetic characters
    }
  }
}
