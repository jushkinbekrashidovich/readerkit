import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

const KEY = "FIRST_TIME_OPEN";

class RatingService {
  late SharedPreferences _preferences;
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> isSecondTimeOpen() async {
    _preferences = await SharedPreferences.getInstance();
    try {
      dynamic _isSecondTime = _preferences.getBool(KEY);
      if (_isSecondTime != null && !_isSecondTime) {
        _preferences.setBool(KEY, false);
        return false;
      } else if (_isSecondTime != null && _isSecondTime) {
        _preferences.setBool(KEY, false);
        return true;
      } else {
        _preferences.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
    try {
      final available = await _inAppReview.isAvailable();
      if (available) {
        _inAppReview.requestReview();
      } else {
        _inAppReview.openStoreListing(
          appStoreId: 'readerkit.readerkit',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
