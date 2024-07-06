
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/functions/valid_input.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/widget/primary_button.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/constant/enums.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/auth/auth_text_row.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Map<String, dynamic> args;
  late String espaceRole;
  bool _isLoading = false;
  String _isVerified = "VERIFIED";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        espaceRole = args['espace_role'];
        log("espaceRole: $espaceRole");
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowPassword = false;
  bool isRememberMe = false;

  void handleShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  void handleRememberMe() {
    setState(() {
      isRememberMe = !isRememberMe;
    });
  }

 /* void goToRegisterScreen() {
    Navigator.pushNamed(context, AppRoute.registerScreen,
        arguments: {"espace_role": espaceRole});
  }*/

 /* void goToForgetPasswordScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }
*/
  bool getIsVerified() => sharedPref!.getBool(_isVerified) ?? false;

  void login() {
    if (_formKey.currentState!.validate()) {
      signInWithEmailPassword();
    } else {
      showSnackbar(
          context: context,
          message: "Please enter valid email and password",
          isError: true);
    }
  }

  Future<void> signInWithEmailPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final AuthResponse res = await supabase.auth
          .signInWithPassword(email: email, password: password);

      AppCache().setUid("${res.session?.user.id}");
      setState(() {
        _isLoading = false;
      });
      final dataRole = await supabase
          .from(AppDB.user)
          .select("role,is_complete_profil,is_verified")
          .eq("id", "${res.session?.user.id}");
      AppCache().setRole("${dataRole[0]['role']}");
      AppCache().setIsCompleteProfile(dataRole[0]['is_complete_profil']);
      AppCache().setVerified(dataRole[0]['is_verified']);

      log("dataRole: ${dataRole[0]['role']}");

      bool isCompleteProfile = AppCache().getIsCompleteProfile();
      bool isVerified = AppCache().getIsVerified();
      if (role.babySitter.name == dataRole[0]['role']) {
        log("ajout babysitter");

        if (isVerified && isCompleteProfile) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PlanificationenfantScreen()));
        } else if (!isVerified && isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoadingScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => IdentitBabySitterTapeTwoScreen()));
        }
        ;
      } else if (role.admin.name == dataRole[0]['role']) {
        log("ajout admin");
        if (isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageAdminScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterAdminPhAScreen()));
        }
      } else if (role.parent.name == dataRole[0]['role']) {
        log("ajout parent");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterParent1ScreenScreen()));
      } else if (role.docteur.name == dataRole[0]['role']) {
        log("docteur");

        if (isVerified && isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProfileDoctoraScreen()));
        } else if (!isVerified && isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoadingScreen()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AjoutPhotodocScreen()));
        }
      } else if (role.creche.name == dataRole[0]['role']) {
        log("creche");

        if (isVerified && isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomepageCrecheScreen()));
        } else if (!isVerified && isCompleteProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoadingScreen()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AjoutphcrecheScreen()));
        }
      } else {}
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Erreur de connexion: $error');
      if (error.toString().contains("400")) {
        showSnackbar(
            context: context,
            message: "Email ou mot de passe incorrect",
            isError: true);
      } else {
        showSnackbar(context: context, message: "$error", isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: LogoTextCard(text: "Caring for Little Smiles!")),
                Center(
                    child: Text("Se connecter",
                        style: CustomTextStyles.titleLargePrimary)),
                SizedBox(height: 10),
                AuthDescription(
                  "Cette étape est appropriée pour sélectionner votre propre espace.",
                ),
                SizedBox(height: 30),
                AuthLabel("Email"),
                SizedBox(height: 10.v),
                AuthInput(
                  hintText: "e.g. john@mail.com",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validEmail(value),
                  readOnly: _isLoading,
                ),
                SizedBox(height: 12),
                AuthLabel("Mot de passe"),
                SizedBox(height: 10),
                AuthInput(
                  hintText: "e.g. *********",
                  controller: passwordController,
                  validator: (value) => validPassword(value),
                  obscure: !isShowPassword,
                  suffix: PasswordIcon(
                    icon: isShowPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTap: () => handleShowPassword(),
                  ),
                  readOnly: _isLoading,
                ),
                SizedBox(height: 25),
                PrimaryButton(
                    name: "Se connecter",
                    onPressed: () => login(),
                    loading: _isLoading),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                      text: "Forgot password ?",
                    /*  onTap: () => goToForgetPasswordScreen()),*/
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .21),
                AuthTextRow(
                  title: "Vous n'avez pas de compte ? ",
                  subTitle: "Inscrivez-vous.",
                /*  onTap: () => goToRegisterScreen(),*/
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
