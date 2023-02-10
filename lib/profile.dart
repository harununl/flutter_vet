import 'dart:ui';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_vet/Vet/vet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vet/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

List<String> list = <String>[
  'Choose',
  'Cat',
  'Dog',
];
List<String> CatList = <String>[
  'Choose',
  'Abyssinian Cat',
  'American Bobtail Cat Breed',
  'DAmerican Curl Cat Breedog',
  'American Shorthair Cat',
  'American Wirehair Cat Breed',
  'Balinese-Javanese Cat Breed',
  'Bengal Cat',
  'Birman Cat Breed',
  'Bombay Cat',
  'British Shorthair Cat Breed',
  'Burmese Cat',
  'Chartreux Cat Breed',
  'Cornish Rex Cat Breed',
  'Devon Rex Cat Breed',
  'Egyptian Mau Cat',
  'European Burmese Cat Breed',
  'Exotic Shorthair Cat Breed',
  'Havana Brown Cat Breed',
  'Himalayan Cat Breed',
  'Japanese Bobtail Cat Breed',
  'Korat Cat Breed',
  'LaPerm Cat',
  'Maine Coon Cat Breed',
  'Manx Cat',
  'Munchkin Cat',
  'Norwegian Forest Cat Breed',
  'Ocicat Cat Breed',
  'Oriental Cat Breed',
  'Persian Cat Breed',
  'Peterbald Cat Breed',
  'Pixiebob Cat Breed',
  'Ragamuffin Cat Breed',
  'Ragdoll Cat Breed',
  'Russian Blue Cat Breed',
  'Savannah Cat Breed',
  'Scottish Fold Cat Breed',
  'Selkirk Rex Cat Breed',
  'Siamese Cat Breed',
  'Siberian Cat Breed',
  'Singapura Cat Breed',
  'Somali Cat Breed',
  'Sphynx Cat Breed',
  'Tonkinese Cat Breed',
  'Toyger Cat Breed',
  'Turkish Angora Cat Breed',
  'Turkish Van Cat Breed',
];
List<String> DogList = <String>[
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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime? birthDate; // instance of DateTime
  String birthDateInString = "";
  bool isChecked = false;
  bool isCheckedd = false;
  String? valuee;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? image;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  String? value;
  String dropdownValue = list.first;
  String catValue = CatList.first;
  String dogValue = DogList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  setState(() {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Çıkış Yapmak İstiyor Musunuz?'),
                        //content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Hayır'),
                            child: const Text('Hayır'),
                          ),
                          TextButton(
                            onPressed: () {
                              _auth.signOut();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Başarıyla çıkış yaptınız..')));

                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const vetPage(),
                                ),
                              );
                            },
                            child: const Text('Evet'),
                          ),
                        ],
                      ),
                    );
                  });
                },
                icon: Icon(Icons.login)),
          )
        ],
      ),
      body: ListView(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage('assets/back.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 140),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: InkWell(
                                    onTap: () async {
                                      PermissionStatus cameraStatus =
                                          await Permission.camera.request();
                                      PermissionStatus storageStatus =
                                          await Permission.storage.request();
                                      if (cameraStatus ==
                                              PermissionStatus.granted &&
                                          storageStatus ==
                                              PermissionStatus.granted) {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      } else if (cameraStatus ==
                                          PermissionStatus.denied) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "This permission is recommended")));
                                      }
                                      // showModalBottomSheet(
                                      //     context: context,
                                      //     builder: (builder) => bottomSheet());
                                    },
                                    child: CircleAvatar(
                                      radius: 50,
                                      child: image != null
                                          ? ClipOval(
                                              child: Image.file(
                                                image!,
                                                width: 160,
                                                height: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : ClipOval(
                                              child: Image.asset(
                                                'assets/prof.png',
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, top: 10),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                icon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: 'Enter your Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                )),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please type a Name";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 25, top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Date of birth: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Container(
                                //width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange, spreadRadius: 3),
                                  ],
                                ),
                                child: Text(
                                  "${birthDateInString}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  child: new Icon(Icons.calendar_today),
                                  onTap: () async {
                                    final datePick = await showDatePicker(
                                        context: context,
                                        initialDate: new DateTime.now(),
                                        firstDate: new DateTime(1900),
                                        lastDate: new DateTime(2100));
                                    if (datePick != null &&
                                        datePick != birthDate) {
                                      setState(() {
                                        birthDate = datePick;
                                        isDateSelected = true;

                                        // put it here
                                        birthDateInString =
                                            "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019
                                      });
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Select your pet: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.grey[800],
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                    if (isChecked == true) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => dropdown());
                                    }
                                  });
                                }),
                            Text(
                              "Cat: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if (isChecked == true)
                              Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange, spreadRadius: 3),
                                  ],
                                ),
                                child: Text("${catValue}"),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.grey[800],
                                value: isCheckedd,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedd = value!;
                                    if (isCheckedd == true) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => dropdownDog());
                                    }
                                  });
                                }),
                            Text(
                              "Dog: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if (isCheckedd == true)
                              Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.orange,
                                          spreadRadius: 3),
                                    ],
                                  ),
                                  child: Text("${dogValue}"))
                          ],
                        ),
                        SizedBox(height: 100),

                        //width: double.infinity,
                        ButtonTheme(
                          minWidth: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                          'Bilgileriniz Kaydedilmiştir'),
                                      //content: const Text('AlertDialog description'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              height: 60,
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        Text(
          "Choose a Profile Photo",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text("Camera")),
            SizedBox(
              width: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                  // takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text("Gallery"))
          ],
        )
      ]),
    );
  }

  Widget dropdown() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select type of your pet: ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: catValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.orange[400],
            ),
            onChanged: (String? valuee) {
              // This is called when the user selects an item.
              setState(() {
                catValue = valuee!;
              });
            },
            items: CatList.map<DropdownMenuItem<String>>((String valuee) {
              return DropdownMenuItem<String>(
                value: valuee,
                child: Text(valuee),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget dropdownDog() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select type of your pet: ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: dogValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.orange[400],
            ),
            onChanged: (valuee) {
              // This is called when the user selects an item.
              setState(() {
                dogValue = valuee!;
              });
            },
            items: DogList.map<DropdownMenuItem<String>>((String valuee) {
              return DropdownMenuItem<String>(
                value: valuee,
                child: Text(valuee),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      //final imagePermanent = await saveImagePermanently(image.path);

      setState((() => this.image = imageTemporary));
    } on PlatformException catch (e) {
      print("failed: $e");
    }
  }
}
