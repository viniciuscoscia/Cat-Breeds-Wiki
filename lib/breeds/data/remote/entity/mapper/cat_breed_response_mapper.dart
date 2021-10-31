import 'package:cats_database/breeds/data/remote/entity/cat_breeds_response.dart';
import 'package:cats_database/breeds/domain/model/cat.dart';
import 'package:cats_database/helpers/string_utils.dart';

extension CatResponseMapper on List<CatBreedsResponse> {
  List<Cat> toDomainEntity(List<CatBreedsResponse> catsResponse) {
    return catsResponse.map((e) =>
        Cat(
            name: e.name.orEmpty(),
            adaptability: e.adaptability.orZero(),
            affectionLevel: e.affectionLevel.orZero(),
            altNames: e.altNames.orEmpty(),
            cfaUrl: e.cfaUrl.orEmpty(),
            childFriendly: e.childFriendly.orZero(),
            countryCode: e.countryCode.orEmpty(),
            countryCodes: e.countryCodes.orEmpty(),
            description: e.description.orEmpty(),
            dogFriendly: e.dogFriendly.orZero(),
            energyLevel: e.energyLevel.orZero(),
            experimental: e.experimental.orZero(),
            grooming: e.grooming.orZero(),
            hairless: e.hairless.orZero(),
            healthIssues: e.healthIssues.orZero(),
            hypoallergenic: e.hypoallergenic.orZero(),
            id: e.id.orEmpty(),
            indoor: e.indoor.orZero(),
            intelligence: e.intelligence.orZero(),
            lap: e.lap.orZero(),
            lifeSpan: e.lifeSpan.orEmpty(),
            natural: e.natural.orZero(),
            origin: e.origin.orEmpty(),
            rare: e.rare.orZero(),
            referenceImageId: e.referenceImageId.orEmpty(),
            rex: e.rex.orZero(),
            sheddingLevel: e.sheddingLevel.orZero(),
            shortLegs: e.shortLegs.orZero(),
            socialNeeds: e.socialNeeds.orZero(),
            strangerFriendly: e.strangerFriendly.orZero(),
            suppressedTail: e.suppressedTail.orZero(),
            temperament: e.temperament.orEmpty(),
            vcahospitalsUrl: e.vcahospitalsUrl.orEmpty(),
            vetstreetUrl: e.vetstreetUrl.orEmpty(),
            vocalisation: e.vocalisation.orZero(),
            wikipediaUrl: e.wikipediaUrl.orEmpty(),
            image: e.image.toDomainEntity(),
            weight: e.weight.toDomainEntity()
        )).toList();
  }
}

extension ImageResponseMapper on ImageResponse? {
  Image toDomainEntity() {
    if (this == null) {
      return const Image();
    }

    return Image(id: this!.id.orEmpty(),
        height: this!.height.orZero(),
        url: this!.url.orEmpty(),
        width: this!.width.orZero());
  }
}

extension WeightResponseMapper on WeightResponse? {
  Weight toDomainEntity() {
    if (this == null) {
      return const Weight();
    }

    return Weight(
        imperial: this!.imperial.orEmpty(),
        metric: this!.metric.orEmpty()
    );
  }
}