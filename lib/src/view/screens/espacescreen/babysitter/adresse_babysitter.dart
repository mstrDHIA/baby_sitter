import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/functions/valid_input.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_input.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_label.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/primart_button.dart';
import 'package:babysitter_v1/src/data/model/onboard/baby.dart';
class AdresseBabysitterScreen extends StatefulWidget {
  const AdresseBabysitterScreen({Key? key}) : super(key: key);

  @override
  State<AdresseBabysitterScreen> createState() =>
      _AdresseBabysitterScreenState();
}
class _AdresseBabysitterScreenState extends State<AdresseBabysitterScreen> {
  TextEditingController adresseController = TextEditingController();
  TextEditingController postaleController = TextEditingController();
  TextEditingController dependanceController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isDisabled = false;
  bool _isLoading = false;
  late BabySitterModel babySitter;
  Future<void> nextStep() async {
    if (_formKey.currentState!.validate()) {
      await insertAdresse();
    } else {
      showSnackbar(
        context: context,
        isError: true,
        message: "Veuillez remplir tous les champs.",
      );
    }
  }
  Future<void> insertAdresse() async {
    try {
      setState(() {
        _isDisabled = true;
        _isLoading = true;
      });
      await supabase.from('babySitter').update({
        'adresse': adresseController.text,
        'numero_postale': int.parse(postaleController.text),
        'dependance': dependanceController.text,
      }).match({'uid': AppCache().getUid()});
      setState(() {
        _isDisabled = false;
        _isLoading = false;
      });
    /*  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterBabySitterEtapeOneScreen()));*/
    } catch (e) {
      log('Error inserting address: $e');
      showSnackbar(
        context: context,
        isError: true,
        message: "Une erreur s'est produite lors de l'insertion de l'adresse.",
      );
      setState(() {
        _isDisabled = false;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getDataFromDatabase();
    super.initState();
  }

 Future<void> getDataFromDatabase() async {
    try {
      final data = await supabase
          .from('babySitter')
          .select('*')
          .match({'uid': AppCache().getUid()});
      babySitter = BabySitterModel.fromJson(data[0]);
      if (data.isNotEmpty) {
        setState(() {
          adresseController.text = babySitter.adresse ?? "";
          postaleController.text = babySitter.numeroPostale == null
              ? ""
              : babySitter.numeroPostale.toString();
          dependanceController.text = babySitter.dependance ?? "";

          _isDisabled = false;
        });
      } else {
        setState(() {
          _isDisabled = true;

          _isDisabled = true;
        });
      }
    } catch (e) {
      log('Error inserting : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(
            "https://www.tourmag.com/photo/art/grande/8599774-13555214.jpg?v=1448986872",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height * .45,
            width: MediaQuery.sizeOf(context).width,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Entrer votre adresse détaillée",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(height: 15),
                  AuthLabel("Addresse"),
                  Container(height: 10),
                  AuthInput(
                    hintText: "e.g. 53, rue de la paix",
                    controller: adresseController,
                    validator: (value) => validAdresse(value),
                  ),
                  Container(height: 10),
                  AuthLabel("Numéro postale*"),
                  Container(height: 10),
                  AuthInput(
                    hintText: "e.g. 8011",
                    controller: postaleController,
                    keyboardType: TextInputType.number,
                    validator: (value) => validZipCode(value),
                  ),
                  Container(height: 10),
                  AuthLabel("Dépendance"),
                  Container(height: 10),
                  AuthInput(
                    hintText: "e.g. Dar chabane el fehri",
                    controller: dependanceController,
                    validator: (value) => validString(value),
                  ),
                  Container(height: 25),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: PrimaryButton(
          name: "Étape suivante",
          onPressed: nextStep,
          isSecondary: true,
          disabled: _isDisabled,
          loading: _isLoading,
        ),
      ),
    );
  }
}
