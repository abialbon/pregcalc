import 'package:flutter/material.dart';

class Bishop with ChangeNotifier {
  int _positionScore = 0,
      _consistencyScore = 0,
      _effacementScore = 0,
      _dilationScore = 0,
      _stationScore = 0,
      _totalScore = 0;

  int get totalScore => _totalScore;

  void calculateScore() {
    _totalScore = _positionScore +
        _consistencyScore +
        _dilationScore +
        _effacementScore +
        _stationScore;
    notifyListeners();
  }

  void reset() {
    _positionScore = 0;
    _consistencyScore = 0;
    _effacementScore = 0;
    _stationScore = 0;
    _dilationScore = 0;
    calculateScore();
  }

  void setPositionScore(int s) {
    _positionScore = s;
    calculateScore();
  }

  void setConsistencyScore(int s) {
    _consistencyScore = s;
    calculateScore();
  }

  void setEffacementScore(int s) {
    _effacementScore = s;
    calculateScore();
  }

  void setDilationScore(int s) {
    _dilationScore = s;
    calculateScore();
  }

  void setStationScore(int s) {
    _stationScore = s;
    calculateScore();
  }
}
