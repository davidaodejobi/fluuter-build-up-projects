import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/models/location_data.dart';

final _controller = TextEditingController();
final _formKey = GlobalKey<FormState>();

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationData>(
      builder: (context, locationData, child) {
        return Container(
          color: const Color(0xFF757575),
          child: Container(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 20.0,
              right: 20.0,
              bottom: 10,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 4,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "New City",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
                //TODO: 4 Add validation check for this field so that it can't be empty
                //TODO: 5 CHange the blue line showing under the text field to black (and white)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter a valid city name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        cursorColor: AppColors.kBackgroundColor,
                        autofocus: true,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            locationData.addNewCity(
                                _controller.text, -10, "Light Drizzle");
                            _controller.clear();
                            Navigator.pop(context);
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll<Size>(
                            Size(
                              MediaQuery.of(context).size.height * 1,
                              50,
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            AppColors.kBackgroundColor,
                          ),
                        ),
                        child: Text(
                          "Add",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                          // style: TextStyle(color: kSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
