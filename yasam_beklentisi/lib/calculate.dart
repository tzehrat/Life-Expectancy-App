import 'package:yasam_beklentisi/userData.dart';

class Calculate {
  UserData _userData;
  Calculate(this._userData);

  double calculate() {
    double result;
    result = 90 + _userData.exercize - _userData.smokedCigarette;
    result = result + (_userData.height / _userData.weight);
    if (_userData.seciliGender == 'FEMALE') {
      return result + 3;
    } else {
      return result;
    }
  }
}
