import 'package:mahmoudfawzy_flutter_task/config/resources/image_manger.dart';

enum FeatureIconEnum { clock, rocket, pinned, global, medal }

extension FeaturesIconsExtention on FeatureIconEnum {
  String toSql() {
    switch (this) {
      case FeatureIconEnum.clock:
        return 'clock';
      case FeatureIconEnum.rocket:
        return 'rocket';
      case FeatureIconEnum.pinned:
        return 'pinned';
      case FeatureIconEnum.global:
        return 'global';
      case FeatureIconEnum.medal:
        return 'medal';
    }
  }

  String get imagePath {
    switch (this) {
      case FeatureIconEnum.clock:
        return ImageManger.acuteIcon;
      case FeatureIconEnum.rocket:
        return ImageManger.rocketIcon;
      case FeatureIconEnum.pinned:
        return ImageManger.keepIcon;
      case FeatureIconEnum.global:
        return ImageManger.globeIcon;
      case FeatureIconEnum.medal:
        return ImageManger.workspaceIcon;
    }
  }
}
