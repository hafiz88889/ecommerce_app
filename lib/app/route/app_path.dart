abstract class Routes{
  Routes._();
  static const INITIAL= _path.INITIAL;
  static const SPLASH_SCREEN= _path.SPLASH_SCREEN;
  static const REG_SCREEN= _path.REG_SCREEN;
  static const LOGIN_VIEW= _path.LOGIN_VIEW;
}

abstract class _path{
  _path._();
  static const INITIAL="/";
  static const SPLASH_SCREEN="/splash_screen";
  static const REG_SCREEN="/reg_screen";
  static const LOGIN_VIEW="/login_view";
}