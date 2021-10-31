import 'package:json_annotation/json_annotation.dart';

part 'cat_breeds_response.g.dart';

@JsonSerializable()
class CatBreedsResponse {
  final String? name;
  final WeightResponse? weight;
  final String? id;
  @JsonKey(name: "cfa_url")
  final String? cfaUrl;
  @JsonKey(name: "vetstreet_url")
  final String? vetstreetUrl;
  @JsonKey(name: "vcahospitals_url")
  final String? vcahospitalsUrl;
  final String? temperament;
  final String? origin;
  @JsonKey(name: "country_codes")
  final String? countryCodes;
  @JsonKey(name: "country_code")
  final String? countryCode;
  final String? description;
  @JsonKey(name: "life_span")
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  @JsonKey(name: "alt_names")
  final String? altNames;
  final int? adaptability;
  @JsonKey(name: "affection_level")
  final int? affectionLevel;
  @JsonKey(name: "child_friendly")
  final int? childFriendly;
  @JsonKey(name: "dog_friendly")
  final int? dogFriendly;
  @JsonKey(name: "energy_level")
  final int? energyLevel;
  final int? grooming;
  @JsonKey(name: "health_issues")
  final int? healthIssues;
  final int? intelligence;
  @JsonKey(name: "shedding_level")
  final int? sheddingLevel;
  @JsonKey(name: "social_needs")
  final int? socialNeeds;
  @JsonKey(name: "stranger_friendly")
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  @JsonKey(name: "suppressed_tail")
  final int? suppressedTail;
  @JsonKey(name: "short_legs")
  final int? shortLegs;
  @JsonKey(name: "wikipedia_url")
  final String? wikipediaUrl;
  final int? hypoallergenic;
  @JsonKey(name: "reference_image_id")
  final String? referenceImageId;
  final ImageResponse? image;

  CatBreedsResponse({
      this.name,
      this.weight,
      this.id,
      this.cfaUrl,
      this.vetstreetUrl,
      this.vcahospitalsUrl,
      this.temperament,
      this.origin,
      this.countryCodes,
      this.countryCode,
      this.description,
      this.lifeSpan,
      this.indoor,
      this.lap,
      this.altNames,
      this.adaptability,
      this.affectionLevel,
      this.childFriendly,
      this.dogFriendly,
      this.energyLevel,
      this.grooming,
      this.healthIssues,
      this.intelligence,
      this.sheddingLevel,
      this.socialNeeds,
      this.strangerFriendly,
      this.vocalisation,
      this.experimental,
      this.hairless,
      this.natural,
      this.rare,
      this.rex,
      this.suppressedTail,
      this.shortLegs,
      this.wikipediaUrl,
      this.hypoallergenic,
      this.referenceImageId,
      this.image});

  factory CatBreedsResponse.fromJson(Map<String, dynamic> json) => _$CatBreedsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatBreedsResponseToJson(this);
}

@JsonSerializable()
class WeightResponse {
  final String? imperial;
  final String? metric;

  WeightResponse({this.imperial, this.metric});

  factory WeightResponse.fromJson(Map<String, dynamic> json) => _$WeightResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeightResponseToJson(this);
}

@JsonSerializable()
class ImageResponse {
  final String? id;
  final int? width;
  final int? height;
  final String? url;

  ImageResponse({this.id, this.width, this.height, this.url});
  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}