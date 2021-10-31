class Cat {
  final String name;
  final Weight weight;
  final String id;
  final String cfaUrl;
  final String vetstreetUrl;
  final String vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;
  final Image image;

  Cat(
      {this.name = "",
      this.weight = const Weight(),
      this.id = "",
      this.cfaUrl = "",
      this.vetstreetUrl = "",
      this.vcahospitalsUrl = "",
      this.temperament = "",
      this.origin = "",
      this.countryCodes = "",
      this.countryCode = "",
      this.description = "",
      this.lifeSpan = "",
      this.indoor = 0,
      this.lap = 0,
      this.altNames = "",
      this.adaptability = 0,
      this.affectionLevel = 0,
      this.childFriendly = 0,
      this.dogFriendly = 0,
      this.energyLevel = 0,
      this.grooming = 0,
      this.healthIssues = 0,
      this.intelligence = 0,
      this.sheddingLevel = 0,
      this.socialNeeds = 0,
      this.strangerFriendly = 0,
      this.vocalisation = 0,
      this.experimental = 0,
      this.hairless = 0,
      this.natural = 0,
      this.rare = 0,
      this.rex = 0,
      this.suppressedTail = 0,
      this.shortLegs = 0,
      this.wikipediaUrl = "",
      this.hypoallergenic = 0,
      this.referenceImageId = "",
      this.image = const Image()});
}

class Weight {
  final String imperial;
  final String metric;

  const Weight({this.imperial = "", this.metric = ""});
  // const Weight.empty(): imperial = "", metric = "";
}

class Image {
  final String id;
  final int width;
  final int height;
  final String url;

  const Image({this.id = "", this.width = 0, this.height = 0, this.url = ""});
  // const Image.empty(): id = "", width = 0, height = 0, url = "";
}
