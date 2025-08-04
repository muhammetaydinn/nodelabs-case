import '../../generated/assets.gen.dart';

class BonusModel {
  final String icon;
  final String description;
  final String? image;

  const BonusModel({required this.icon, required this.description, this.image});

  static List<BonusModel> getBonusList() {
    return [
      BonusModel(icon: Assets.icons.pngIcons.bonusIconOne.path, description: 'Premium\nHesap'),
      BonusModel(icon: Assets.icons.pngIcons.bonusIconTwo.path, description: 'Daha\nFazla Eşleşme'),
      BonusModel(icon: Assets.icons.pngIcons.bonusIconThree.path, description: 'Öne\nÇıkarma'),
      BonusModel(icon: Assets.icons.pngIcons.bonusIconFour.path, description: 'Daha\nFazla Beğeni'),
    ];
  }
}
