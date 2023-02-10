import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

const List<String> list = <String>[
  "Choose",
  'Affenpinscher',
  'Afghan Hound',
  'Airedale Terrier',
  'Akita',
  'Alaskan Malamute',
  'American English Coonhound',
  'American Eskimo Dog',
  'American Foxhound',
  'American Staffordshire Terrier',
  'American Water Spaniel',
  'Anatolian Shepherd Dog',
  'Australian Cattle Dog',
  'Australian Shepherd',
  'Australian Terrier',
  'Basenji',
  'Basset Hound',
  'Beagle',
  'Bearded Collie',
  'Beauceron',
  'Bedlington Terrier',
  'Belgian Malinois',
  'Belgian Sheepdog',
  'Belgian Tervuren',
  'Bergamasco',
  'Berger Picard',
  'Bernese Mountain Dog',
  'Bichon Frise',
  'Black and Tan Coonhound',
  'Black Russian Terrier',
  'Bloodhound',
  'Bluetick Coonhound',
  'Boerboel',
  'Border Collie',
  'Border Terrier',
  'Borzoi',
  'Boston Terrier',
  'Bouvier des Flandres',
  'Boxer',
  'Boykin Spaniel',
  'Briard',
  'Brittany',
  'Brussels Griffon',
  'Bull Terrier',
  'Bulldog',
  'Bullmastiff',
  'Cairn Terrier',
  'Canaan Dog',
  'Cane Corso',
  'Cardigan Welsh Corgi',
  'Cavalier King Charles Spaniel',
  'Cesky Terrier',
  'Chesapeake Bay Retriever',
  'Chihuahua',
  'Chinese Crested',
  'Chinese Shar-Pei',
  'Chinook',
  'Chow Chow',
  'Cirneco dell Etna',
  'Clumber Spaniel',
  'Cocker Spaniel',
  'Collie',
  'Corgi',
  'Coton de Tulear',
  'Curly-Coated Retriever',
  'Dachshund',
  'Dalmatian',
  'Dandie Dinmont Terrier',
  'Doberman Pinscher',
  'Dogue de Bordeaux',
  'English Cocker Spaniel',
  'English Foxhound',
  'English Setter',
  'English Springer Spaniel',
  'English Toy Spaniel',
  'Entlebucher Mountain Dog',
  'Field Spaniel',
  'Finnish Lapphund',
  'Finnish Spitz',
  'Flat-Coated Retriever',
  'French Bulldog',
  'German Pinscher',
  'German Shepherd Dog',
  'German Shorthaired Pointer',
  'German Wirehaired Pointer',
  'Giant Schnauzer',
  'Glen of Imaal Terrier',
  'Golden Retriever',
  'Gordon Setter',
  'Great Dane',
  'Great Pyrenees',
  'Greater Swiss Mountain Dog',
  'Greyhound',
  'Harrier',
  'Havanese',
  'Ibizan Hound',
  'Icelandic Sheepdog',
  'Irish Red and White Setter',
  'Irish Setter',
  'Irish Terrier',
  'Irish Water Spaniel',
  'Irish Wolfhound',
  'Italian Greyhound',
  'Japanese Chin',
  'Keeshond',
  'Kerry Blue Terrier',
  'Komondor',
  'Kuvasz',
  'Labrador Retriever',
  'Lagotto Romagnolo',
  'Lakeland Terrier',
  'Leonberger',
  'Lhasa Apso',
  'Löwchen',
  'Maltese',
  'Manchester Terrier',
  'Mastiff',
  'Miniature American Shepherd',
  'Miniature Bull Terrier',
  'Miniature Pinscher',
  'Miniature Schnauzer',
  'Neapolitan Mastiff',
  'Newfoundland',
  'Norfolk Terrier',
  'Norwegian Buhund',
  'Norwegian Elkhound',
  'Norwegian Lundehund',
  'Norwich Terrier',
  'Nova Scotia Duck Tolling Retriever',
  'Old English Sheepdog',
  'Otterhound',
  'Papillon',
  'Parson Russell Terrier',
  'Pekingese',
  'Petit Basset Griffon Vendéen',
  'Pharaoh Hound',
  'Plott',
  'Pointer',
  'Polish Lowland Sheepdog',
  'Pomeranian',
  'Poodle',
  'Portuguese Podengo Pequeno',
  'Portuguese Water Dog',
  'Pug',
  'Puli',
  'Pyrenean Shepherd',
  'Rat Terrier',
  'Redbone Coonhound',
  ' Rhodesian Ridgeback',
  'Rottweiler',
  'Russell Terrier',
  'Saint Bernard',
  'Saluki',
  'Samoyed',
  'Schipperke',
  'Scottish Deerhound',
  'Scottish Terrier',
  'Sealyham Terrier',
  'Shetland Sheepdog',
  'Shiba Inu',
  'Shih Tzu',
  'Siberian Husky',
  'Silky Terrier',
  'Skye Terrier',
  'Soft Coated Wheaten Terrier',
  'Spanish Water Dog',
  'Spinone Italiano',
  'Staffordshire Bull Terrier',
  'Standard Schnauzer',
  'Sussex Spaniel',
  'Swedish Vallhund',
  'Tibetan Mastiff',
  'Tibetan Spaniel',
  'Tibetan Terrier',
  'Toy Fox Terrier',
  'Treeing Walker Coonhound',
  'Vizsla',
  'Weimaraner',
  'Welsh Springer Spaniel',
  'Welsh Terrier',
  'West Highland White Terrier',
  'Whippet',
  'Wire Fox Terrier',
  'Wirehaired Pointing Griffon',
  'Wirehaired Vizsla',
  'Xoloitzcuintli',
  'Yorkshire Terrier',
];
////*urlye göre kedi isimlerini düzenle
List<String> catList = <String>[
  "Choose",
  'Abyssinian',
  'American Bobtail',
  'American Curl',
  'American Shorthair',
  'American Wirehair',
  'Balinese-Javanese',
  'Bengal Cat',
  'Birman Cat Breed',
  'Bombay',
  'British Shorthair',
  'Burmese',
  'Chartreux',
  'Cornish Rex',
  'Devon Rex',
  'Egyptian Mau',
  'European Burmese',
  'Exotic Shorthair',
  'Havana Brown',
  'Himalayan',
  'Japanese Bobtail',
  'Korat',
  'LaPerm',
  'Maine Coon',
  'Manx',
  'Munchkin',
  'Norwegian Forest Cat',
  'Ocicat',
  'Oriental',
  'Persian',
  'Peterbald',
  'Pixiebob',
  'Ragamuffin',
  'Ragdoll',
  'Russian Blue',
  'Savannah',
  'Scottish Fold',
  'Selkirk Rex',
  'Siamese',
  'Siberian',
  'Singapura',
  'Somali',
  'Sphynx',
  'Tonkinese',
  'Toyger Cat Breed',
  'Turkish Angora',
  'Turkish Van',
];
//bool isChecked = false;
//bool isCheckedd = false;
String dropdownValue = list.first;
String dropdownValueCat = catList.first;

class choose {
  String value;
  String dog;
  String cat;
  bool isDog;
  bool isCat;
  String pet;
  choose({
    required this.value,
    required this.dog,
    required this.cat,
    required this.isCat,
    required this.isDog,
    required this.pet,
  });
}

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key});

  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Pet"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {
              newValue.pet = newValue.dog;
              showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(children: <Widget>[
                      Container(
                        child: Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(100),
                                  topRight: const Radius.circular(100))),
                          child: DropdownButtonExample(),
                        ),
                      )
                    ]);
                  });
            });
          }, // Handle your callback.
          splashColor: Colors.brown.withOpacity(0.5),
          child: Ink(
            height: 360,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dog-png.webp'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            setState(() {
              newValue.pet = newValue.cat;
              showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(children: <Widget>[
                      Container(
                        child: Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(100),
                                  topRight: const Radius.circular(100))),
                          child: Dropdowncat(),
                        ),
                      )
                    ]);
                  });
              // showModalBottomSheet(
              //     context: context, builder: (builder) => const Dropdowncat());
            });
          }, // Handle your callback.
          splashColor: Colors.brown.withOpacity(0.5),
          child: Ink(
            height: 360,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/catNormal.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

choose newValue = choose(
    value: "Choose",
    cat: "Cat",
    dog: "Dog",
    isCat: false,
    isDog: false,
    pet: "");

class DropdownButtonExample extends StatefulWidget {
  DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                  newValue.value = dropdownValue;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            dynamic send = await Navigator.pushNamed(context, '/api');
          },
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: const Text(
              'Show İnfo',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}

class Dropdowncat extends StatefulWidget {
  const Dropdowncat({super.key});

  @override
  State<Dropdowncat> createState() => _DropdowncatState();
}

class _DropdowncatState extends State<Dropdowncat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: DropdownButton<String>(
              value: dropdownValueCat,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValueCat = value!;
                  newValue.value = dropdownValueCat;
                });
              },
              items: catList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/api');
          },
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: const Text(
              'Show İnfo',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}
