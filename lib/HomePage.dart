import 'package:flutter/material.dart';
import 'package:shiori_noodle_stopper/generated/l10n.dart';
import 'package:shiori_noodle_stopper/SoundPlayer.dart';
import 'package:shiori_noodle_stopper/CustomWidget/SmallSizedBox.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:async';

// Pages
import 'package:shiori_noodle_stopper/AboutPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _threeMin = 180;
  final Duration _halfSec = const Duration(milliseconds: 500);
  final _timerPlayer = new SoundPlayer();
  final Image _imgSarashi = new Image(image: AssetImage('assets/img/sarashi.png'));
  final Image _imgNoSarashi = new Image(image: AssetImage('assets/img/no-sarashi.png'));
  final ValueNotifier<Image> _showingImg = new ValueNotifier<Image>(Image(image: AssetImage('assets/img/sarashi.png')));
  final ValueNotifier<String> _timerText = new ValueNotifier<String>('03:00');
  final ValueNotifier<bool> _isRunning = new ValueNotifier<bool>(false);
  final ValueNotifier<int> _selectedSound = new ValueNotifier<int>(0);
  final Color _tickColor = Color(0xFFa54a9a);
  int _noodleTime;
  Timer _timer;

  @override
  void didChangeDependencies() {
    precacheImage(_imgSarashi.image, context);
    precacheImage(_imgNoSarashi.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: _popupMenuHandler,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text(AppLocalizations.of(context).about), value: 0),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 30.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: ValueListenableBuilder(
                    valueListenable: _showingImg,
                    builder: (BuildContext context, Image img, Widget child) {
                      return img;
                    },
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _selectedSound,
                builder: (BuildContext context, int value, Widget child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallSizedBox(
                        child: Checkbox(activeColor: _tickColor, value: value == 0, onChanged: (stat) => _selectedSound.value = 0),
                      ),
                      Text(AppLocalizations.of(context).type1),
                      SmallSizedBox.spacing(),
                      SmallSizedBox(
                        child: Checkbox(activeColor: _tickColor, value: value == 1, onChanged: (stat) => _selectedSound.value = 1),
                      ),
                      Text(AppLocalizations.of(context).type2),
                      SmallSizedBox.spacing(),
                      SmallSizedBox(
                        child: Checkbox(activeColor: _tickColor, value: value == 2, onChanged: (stat) => _selectedSound.value = 2),
                      ),
                      Text(AppLocalizations.of(context).type3),
                      SmallSizedBox.spacing(),
                      SmallSizedBox(
                        child: Checkbox(activeColor: _tickColor, value: value == 3, onChanged: (stat) => _selectedSound.value = 3),
                      ),
                      Text(AppLocalizations.of(context).type4),
                    ],
                  );
                },
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(6.0),
                  color: Color(0xFF85357c),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context).remainingTime,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: ValueListenableBuilder(
                  valueListenable: _timerText,
                  builder: (BuildContext context, String value, Widget child) {
                    return Text(
                      value,
                      style: Theme.of(context).textTheme.headline3,
                    );
                  },
                ),
              ),
              FlatButton(
                onPressed: () => _toggleTimer(),
                color: Color(0xFF44393d),
                textColor: Colors.white,
                padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                child: ValueListenableBuilder(
                  valueListenable: _isRunning,
                  builder: (BuildContext context, bool isRunning, Widget child) {
                    return Text(
                      isRunning ? AppLocalizations.of(context).stop : AppLocalizations.of(context).start,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playCktk() {
    _refreshTimerText();
    if(_noodleTime != 0) {
      _timerPlayer.playCk(_selectedSound.value);
      _timer = new Timer(_halfSec, () {
        _timerPlayer.playTk(_selectedSound.value);
        _timer = new Timer(_halfSec, () {
          --_noodleTime;
          _playCktk();
        });
      });
    } else {
      _timer = new Timer(_halfSec, () {
        _showingImg.value = _imgNoSarashi;
        _timerPlayer.playCompleted();
        _isRunning.value = false;
        Wakelock.disable();
      });
    }
  }

  void _stopTimer() {
    if(_timer.isActive) {
      _timer.cancel();
    }
  }

  void _refreshTimerText() {
    int seconds = _noodleTime%60;
    int minutes = (_noodleTime-seconds)~/60;
    _timerText.value = _parseTime(minutes) + ':' + _parseTime(seconds);
  }

  String _parseTime(int time) {
    return time < 10 ? '0' + time.toString() : time.toString();
  }

  void _toggleTimer() {
    if(_isRunning.value) {
      Wakelock.disable();
      _stopTimer();
    } else {
      Wakelock.enable();
      _noodleTime = _threeMin;
      _refreshTimerText();
      _showingImg.value = _imgSarashi;
      _playCktk();
    }
    _isRunning.value = !_isRunning.value;
  }

  void _popupMenuHandler(int value) {
    switch(value) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      default:
    }
  }
}