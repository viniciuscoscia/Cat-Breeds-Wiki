import 'package:cats_database/breeds/data/remote/entity/cat_breeds_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'images_by_breed_response.g.dart';

@JsonSerializable()
class ImagesByBreedResponse  {
	final List<CatBreedsResponse>? breeds;
	final String? id;
	final String? url;
	final double? width;
	final double? height;

	ImagesByBreedResponse(
      this.breeds, this.id, this.url, this.width, this.height);

	factory ImagesByBreedResponse.fromJson(Map<String, dynamic> json) => _$ImagesByBreedResponseFromJson(json);
	Map<String, dynamic> toJson() => _$ImagesByBreedResponseToJson(this);
}