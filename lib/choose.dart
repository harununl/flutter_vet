import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Choose',
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
  'Cirneco dell’Etna',
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

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

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
          height: 100,
        ),
        Center(
          child: DropdownButtonExample(),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text(
              'Show İnfo',
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
          ),
        ),
      ]),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
