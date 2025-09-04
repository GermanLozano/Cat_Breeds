
// IMPLEMENTACION DEL MODELO REQUERTIDO PARA LAS RAZAS DE GATOS 

import 'dart:convert';

import 'package:cat_app/features/cat_breeds/data/models/breed_image_model.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';

class BreedModel extends BreedEntity {

  // VARIABLES REQUERIDAS 
  final String id;
  final String name;
  final String altNames;
  final String cfaUrl;
  final String wikipediaUrl;
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
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int catFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int bidability;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final int hypoallergenic;
  final int referenceImageId;
  final BreedImageModel image;

  // CONSTRUCTOR 
  BreedModel({
    required this.id,
    required this.name,
    required this.altNames,
    required this.cfaUrl,
    required this.wikipediaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.image,
  }) : super(
          id: id,
          name: name,
          altNames: altNames,
          cfaUrl: cfaUrl,
          vetstreetUrl: vetstreetUrl,
          vcahospitalsUrl: vcahospitalsUrl,
          wikipediaUrl: wikipediaUrl,
          temperament: temperament,
          origin: origin,
          intelligence: intelligence,
          description: description,
          lifeSpan: lifeSpan,
          adaptability: adaptability,
          socialNeeds: socialNeeds,
          affectionLevel: affectionLevel,
          childFriendly: childFriendly,
          catFriendly: catFriendly,
          dogFriendly: dogFriendly,
          energyLevel: energyLevel,
          image: image,
        );

  // SE MAPEA EL MODELO DE LA SIGUIENTE MANERA 
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'alt_names': altNames,
      'cfa_url': cfaUrl,
      'vetstreet_url': vetstreetUrl,
      'vcahospital_url': vcahospitalsUrl,
      'temperament': temperament,
      'origin': origin,
      'country_codes': countryCodes,
      'country_code': countryCode,
      'description': description,
      'life_span': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'adaptability': adaptability,
      'affection_level': affectionLevel,
      'child_frendly': childFriendly,
      'dog_frendly': dogFriendly,
      'energy_level': energyLevel,
      'grooming': grooming,
      'health_issues': healthIssues,
      'intelligence': intelligence,
      'shedding_level': sheddingLevel,
      'social_needs': socialNeeds,
      'stranger_frendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppresed_tails': suppressedTail,
      'short_legs': shortLegs,
      'wikipedia_url': wikipediaUrl,
      'hypoallergenic': hypoallergenic,
      'reference_image_id': referenceImageId,
      'cat_frendly': catFriendly,
      'bidability': bidability,
      'image': image.toMap(),
    };
  }

  // SE CONTRUTE EL MODELO DESDE UN MAPA
  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
      id: (map['id'] ?? '').toString(),
      name: (map['name'] ?? '').toString(),
      altNames: (map['alt_names'] ?? '').toString(),
      cfaUrl: (map['cfa_url'] ?? '').toString(),
      wikipediaUrl: (map['wikipedia_url'] ?? '').toString(),
      vetstreetUrl: (map['vetstreet_url'] ?? '').toString(),
      vcahospitalsUrl: (map['vcahospital_url'] ?? '').toString(),
      temperament: (map['temperament'] ?? '').toString(),
      origin: (map['origin'] ?? '').toString(),
      countryCodes: (map['country_codes'] ?? '').toString(),
      countryCode: (map['country_code'] ?? '').toString(),
      description: (map['description'] ?? '').toString(),
      lifeSpan: (map['life_span'] ?? '').toString(),
      indoor: (map['indoor'] ?? 0) as int,
      lap: (map['lap'] ?? 0) as int,
      adaptability: (map['adaptability'] ?? 0) as int,
      affectionLevel: (map['affection_level'] ?? 0) as int,
      childFriendly: (map['child_frendly'] ?? 0) as int,
      catFriendly: (map['cat_frendly'] ?? 0) as int,
      dogFriendly: (map['dog_frendly'] ?? 0) as int,
      energyLevel: (map['energy_level'] ?? 0) as int,
      grooming: (map['grooming'] ?? 0) as int,
      healthIssues: (map['health_issues'] ?? 0) as int,
      intelligence: (map['intelligence'] ?? 0) as int,
      sheddingLevel: (map['shedding_level'] ?? 0) as int,
      socialNeeds: (map['social_needs'] ?? 0) as int,
      strangerFriendly: (map['stranger_frendly'] ?? 0) as int,
      vocalisation: (map['vocalisation'] ?? 0) as int,
      bidability: (map['bidability'] ?? 0) as int,
      experimental: (map['experimental'] ?? 0) as int,
      hairless: (map['hairless'] ?? 0) as int,
      natural: (map['natural'] ?? 0) as int,
      rare: (map['rare'] ?? 0) as int,
      rex: (map['rex'] ?? 0) as int,
      suppressedTail: (map['suppresed_tails'] ?? 0) as int,
      shortLegs: (map['short_legs'] ?? 0) as int,
      hypoallergenic: (map['hypoallergenic'] ?? 0) as int,
      referenceImageId: int.tryParse(
            (map['reference_image_id'] ?? '0').toString(),
          ) ??
          0,
      image: map['image'] != null
          ? BreedImageModel.fromMap(map['image'] as Map<String, dynamic>)
          : const BreedImageModel(
              id: '',
              width: 0,
              height: 0,
              url: '',
            ),
    );
  }


  // SE PASA A JSON DESDE UN MAP
  String toJson() => json.encode(toMap());


  // SE CONTRUYE UN MODELO DESDE UN JSON
  factory BreedModel.fromJson(String source) => BreedModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );


  // IMPLEMENTACION DE "fromEntity" PARA GUARDAR EN LA BASE DE DATOS LOCAL
  factory BreedModel.fromEntity(BreedEntity entity) {
    return BreedModel(
      id: entity.id,
      name: entity.name,
      altNames: entity.altNames,
      cfaUrl: entity.cfaUrl,
      wikipediaUrl: entity.wikipediaUrl,
      vetstreetUrl: entity.vetstreetUrl,
      vcahospitalsUrl: entity.vcahospitalsUrl,
      temperament: entity.temperament,
      origin: entity.origin,
      countryCodes: '',
      countryCode: '',
      description: entity.description,
      lifeSpan: entity.lifeSpan,
      indoor: 0,
      lap: 0,
      adaptability: entity.adaptability,
      affectionLevel: entity.affectionLevel,
      childFriendly: entity.childFriendly,
      catFriendly: entity.catFriendly,
      dogFriendly: entity.dogFriendly,
      energyLevel: entity.energyLevel,
      grooming: 0,
      healthIssues: 0,
      intelligence: entity.intelligence,
      sheddingLevel: 0,
      socialNeeds: entity.socialNeeds,
      strangerFriendly: 0,
      vocalisation: 0,
      bidability: 0,
      experimental: 0,
      hairless: 0,
      natural: 0,
      rare: 0,
      rex: 0,
      suppressedTail: 0,
      shortLegs: 0,
      hypoallergenic: 0,
      referenceImageId: 0,
      image: entity.image as BreedImageModel,
    );
  }
}

