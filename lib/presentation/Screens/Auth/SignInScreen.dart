import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/APIs/driver.api.dart';
import 'package:flutter_application_1/common/operation/mutations/user.mutation.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

const countryCodes = [
  '+84',
  '+1',
  '+44',
  '+91',
];

class SignInScreen extends HookWidget {
  final DriverApi driverApiInstance = GetIt.I<DriverApi>();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = useState('');
    final countryCode = useState(countryCodes[0]);
    final textFocus = FocusNode();
    void onPhoneChange(String? newValue) {
      countryCode.value = newValue!;
    }

    final mutation = useMutationJob(
      job: loginMutationJob,
      args: driverApiInstance,
      onError: (error, recoveryData) => print(error),
      onData: (data, recoveryData) => print(data),
    );

    void onPressed() {
      final input = LoginInput(
          phone: phone.value, countryCode: countryCode.value.substring(1));
      textFocus.unfocus();
      print(input);
      mutation.mutate(input);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: DropdownButton(
                            value: countryCode.value,
                            items: countryCodes
                                .map((code) => DropdownMenuItem(
                                      child: Text(code),
                                      value: code,
                                    ))
                                .toList(),
                            onChanged: onPhoneChange),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: TextFormField(
                            onChanged: (value) {
                              phone.value = value;
                            },
                            focusNode: textFocus,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your phone number";
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1),
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  // Define the border style for non-focused state
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .indigoAccent, // Border color for non-focused state
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigoAccent,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                hintText: "Phone Number"),
                          ),
                        )),
                    const Expanded(
                      child: const SizedBox(),
                      flex: 1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)),
                child: const Text("Login"),
              )
            ],
          ),
        ));
  }
}
