// ignore_for_file: library_private_types_in_public_api, unused_field

class AppAssets {
  static _AppImages images = _AppImages();
  static final AppSvgs svgs = AppSvgs();
}

class _AppImages {
  static const String _path = 'assets/images/';

  final String macFrame = '${_path}mac_frame.png';
  final String phoneFrame = '${_path}phone_frame.jpg';
  final String longLogo = '${_path}long_logo.png';
}

class AppSvgs {
  static const String _path = 'assets/';

  final String logo = '${_path}logo.svg';
  final String longLogo = '${_path}long_logo.svg';
  final String instagram = '${_path}instagram.svg';
  final String linkedin = '${_path}linkedin.svg';
  final String github = '${_path}github.svg';
  final String whatsapp = '${_path}whatsapp.svg';
  final String decoration_1 = '${_path}decoration_1.svg';
  final String decoration_2 = '${_path}decoration_2.svg';
}
