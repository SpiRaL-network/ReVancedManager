import 'package:json_annotation/json_annotation.dart';
import 'package:revanced_manager/utils/string.dart';

part 'patch.g.dart';

@JsonSerializable()
class Patch {
  Patch({
    required this.name,
    required this.description,
    required this.excluded,
    required this.dependencies,
    required this.compatiblePackages,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
  final String name;
  final String description;
  final bool excluded;
  final List<String> dependencies;
  final List<Package> compatiblePackages;

  Map<String, dynamic> toJson() => _$PatchToJson(this);

  String getSimpleName() {
    return name
        .replaceAll('-', ' ')
        .split('-')
        .join(' ')
        .toTitleCase()
        .replaceFirst('Microg', 'MicroG');
  }
}

@JsonSerializable()
class Package {
  Package({
    required this.name,
    required this.versions,
  });

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
  final String name;
  final List<String> versions;

  Map toJson() => _$PackageToJson(this);
}
