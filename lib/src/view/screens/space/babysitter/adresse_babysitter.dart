import 'package:flutter/material.dart';
import '../../authentification/widgets/auth_label.dart';

class AdresseBabysitterScreen extends StatelessWidget {
  const AdresseBabysitterScreen({super.key});

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
            // key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Entrer votre adresse détaillée",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(height: 15),
                  const AuthLabel("Addresse"),
                  Container(height: 10),
                  // AuthInput(
                  //   hintText: "e.g. 53, rue de la paix",
                  //   controller: adresseController,
                  //   validator: (value) => validAdresse(value),
                  // ),
                  Container(height: 10),
                  const AuthLabel("Numéro postale*"),
                  Container(height: 10),
                  // AuthInput(
                  //   hintText: "e.g. 8011",
                  //   controller: postaleController,
                  //   keyboardType: TextInputType.number,
                  //   validator: (value) => validZipCode(value),
                  // ),
                  Container(height: 10),
                  const AuthLabel("Dépendance"),
                  Container(height: 10),
                  // AuthInput(
                  //   hintText: "e.g. Dar chabane el fehri",
                  //   controller: dependanceController,
                  //   validator: (value) => validString(value),
                  // ),
                  Container(height: 25),
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: PrimaryButton(
      //     name: "Étape suivante",
      //     onPressed: nextStep,
      //     isSecondary: true,
      //     disabled: _isDisabled,
      //     loading: _isLoading,
      //   ),
      // ),
    );
  }
}
