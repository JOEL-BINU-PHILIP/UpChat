import 'package:flutter/material.dart';
import 'package:upchat/colors.dart';
import 'package:upchat/common/widgets/customButton.dart';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login-screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
    super.dispose();
  }
   
  void pickCountry(){
  showCountryPicker(
  context: context,
  showPhoneCode: true, // optional. Shows phone code before the country name.
  onSelect: (Country countrycode) {
    setState(() {
      country = countrycode;
    });
  },
);
  }

  @override
  Widget build(BuildContext context) {
    //basically size holds the size of the screen
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
          backgroundColor: backgroundColor,
          title: const Text(
            'Enter your phone number',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "WhatsApp will need to verify your phone number",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  buttonColor: backgroundColor,
                  buttonHeight: 5,
                  buttonWidth: 20,
                  buttonBorderRadius: 5,
                  buttonTextColor: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  function: pickCountry,
                  buttonText: "Pick Country",
                ),
                Row(
                  children: [
                    country == null ? Text('+') : Text('+${country?.phoneCode}'),
                    const SizedBox(
                      width: 10,
                    ),
                    //What the below statement means is that the sizedBox widget has a width of 0.7% of the screen
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.6),
                CustomButton(
                    function: () {},
                    buttonText: " NEXT ",
                    buttonColor: tabColor,
                    buttonHeight: 15,
                    buttonWidth: 30,
                    buttonBorderRadius: 5,
                    buttonTextColor: backgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
