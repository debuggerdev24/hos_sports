import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/schedule_game/schedule_form.dart';
import 'package:hos_sports/widgets/custom_dropdown.dart';

import '../../../service/controller/auth_controller.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/widgets.dart';

class GoalieSignupScreen extends StatefulWidget {
  final String userId;
  const GoalieSignupScreen({super.key, required this.userId});

  @override
  State<GoalieSignupScreen> createState() => _GoalieSignupScreenState();
}

class _GoalieSignupScreenState extends State<GoalieSignupScreen> {
  String gender = 'Male';
  String goalieExperience = '1';
  String ashlRegister = '1';

  final TextEditingController dateController = TextEditingController();
  String distance = '100'; // Default value
  final List<int> proximity = [30, 50, 75, 100];
  String levelOfGame = 'A'; // Default value
  final List<String> levelOfGameList = [
    'Rec',
    'HL',
    'A',
    'AA',
    'AAA',
    'Jr.',
  ];

  DateTime? selectedDate;
  final date = TextEditingController(); // Default date is empty

  // String format = 'Game - 5 vs 5'; // Default value
  String caliber = 'A'; // Default value

  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String> items = [
      'Game - 5 vs 5',
      'Game - 3 vs 3',
      'Shinny - 5 vs 5',
      'Shinny - 3 vs 3',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items, selectedItems: _selectedItems);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Goalie Signup"),
      ),
      body: Container(
        height: screenHeight(context),
        decoration: decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    TapBox(
                      onTap: () => setState(() => gender = 'Male'),
                      text: 'Male',
                      boxClr: gender == 'Male' ? Colors.white : Colors.black,
                      txtClr: gender == 'Male' ? Colors.black : Colors.white,
                    ),
                    const SizedBox(width: 20),
                    TapBox(
                      onTap: () => setState(() => gender = 'Female'),
                      text: 'Female',
                      boxClr: gender == 'Female' ? Colors.white : Colors.black,
                      txtClr: gender == 'Female' ? Colors.black : Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Caliber',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                Row(children: [
                  Expanded(
                    child: DropDownList(
                      labelShow: false,
                      value: caliber,
                      label: "Caliber",
                      onChange: (val) {
                        caliber = val.toString();
                        setState(() {});
                      },
                      items: const ['A', 'B', 'C', 'D', 'E', 'Rec'],
                    ),
                  ),
                ]),

                // const Text("Playing Experience",
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white)),
                // const SizedBox(height: 10),
                // CustomDropdown(
                //   value: levelOfGame,
                //   labelText: "",
                //   onTap: (val) {
                //     setState(() => levelOfGame = val!);
                //   },
                //   items: levelOfGameList
                //       .map((levelValue) => DropdownMenuItem(
                //             value: levelValue.toString(),
                //             child: Text("$levelValue"),
                //           ))
                //       .toList(),
                // ),
                const SizedBox(height: 25),
                const Text(
                  'Playing Experience',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                Row(children: [
                  Expanded(
                    child: DropDownList(
                      labelShow: false,
                      value: levelOfGame,
                      label: levelOfGame,
                      onChange: (val) {
                        levelOfGame = val.toString();
                        setState(() {});
                      },
                      items: levelOfGameList,
                    ),
                  ),
                ]),
                const SizedBox(height: 25),
                const Text('Available to play',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                const SizedBox(height: 15),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _showMultiSelect();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          _selectedItems.isEmpty
                              ? 'Please Select Format'
                              : _selectedItems.join(', '),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text('Date Of Birth',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        controller: date,
                        enabled: false,
                        onTap: () async {
                          DateTime? selected = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            initialDate: DateTime(2000),
                            lastDate: DateTime(2022),
                          );
                          if (selected != null) {
                            selectedDate = selected;
                            date.text =
                                "${selected.year}-${selected.month}-${selected.day}";
                            setState(() {});
                          }
                        },
                        readOnly: true,
                        labelText: 'Date Of Birth',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),

                const Text('I would like to see games within',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                const SizedBox(height: 15),
                CustomDropdown(
                  value: distance,
                  labelText: "Proximity (KM)",
                  onTap: (val) {
                    setState(() => distance = val!);
                  },
                  items: proximity
                      .map((km) => DropdownMenuItem(
                            value: km.toString(),
                            child: Text("$km KM"),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),

                // const Text("Playing Experience",
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white)),
                // const SizedBox(height: 10),
                // CustomDropdown(
                //   value: levelOfGame,
                //   labelText: "",
                //   onTap: (val) {
                //     setState(() => levelOfGame = val!);
                //   },
                //   items: levelOfGameList
                //       .map((levelValue) => DropdownMenuItem(
                //             value: levelValue.toString(),
                //             child: Text("$levelValue"),
                //           ))
                //       .toList(),
                // ),
                // Row(children: [
                //   Expanded(
                //     child: DropDownList(
                //       value: levelOfGame,
                //       label: "Playing Experience",
                //       onChange: (val) {
                //         setState(() => levelOfGame = val!);
                //       },
                //       items: const [
                //         'Rec',
                //         'HL',
                //         'A',
                //         'AA',
                //         'AAA',
                //         'Jr.',
                //         'Below'
                //       ],
                //     ),
                //   ),
                // ]),
                const SizedBox(height: 20),
                const Text(
                  'ASHL Register',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    TapBox(
                      onTap: () => setState(() => ashlRegister = '1'),
                      text: 'Yes',
                      boxClr: ashlRegister == '1' ? Colors.white : Colors.black,
                      txtClr: ashlRegister == '1' ? Colors.black : Colors.white,
                    ),
                    const SizedBox(width: 20),
                    TapBox(
                      onTap: () => setState(() => ashlRegister = '0'),
                      text: 'No',
                      boxClr: ashlRegister == '0' ? Colors.white : Colors.black,
                      txtClr: ashlRegister == '0' ? Colors.black : Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rent A Goalie Experience',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    TapBox(
                      onTap: () => setState(() => goalieExperience = '1'),
                      text: 'Yes',
                      boxClr:
                          goalieExperience == '1' ? Colors.white : Colors.black,
                      txtClr:
                          goalieExperience == '1' ? Colors.black : Colors.white,
                    ),
                    const SizedBox(width: 20),
                    TapBox(
                      onTap: () => setState(() => goalieExperience = '0'),
                      text: 'No',
                      boxClr:
                          goalieExperience == '0' ? Colors.white : Colors.black,
                      txtClr:
                          goalieExperience == '0' ? Colors.black : Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                GetBuilder<AuthController>(
                  builder: (AuthController controller) {
                    return controller.signUpLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_selectedItems.isEmpty) {
                                      Get.snackbar("Error",
                                          "Please Select available to play",
                                          snackPosition: SnackPosition.TOP);
                                      return;
                                    }
                                    if (date.text.isEmpty) {
                                      Get.snackbar("Error",
                                          "Please Select birth of data",
                                          snackPosition: SnackPosition.TOP);
                                      return;
                                    }
                                    if (date.text.isEmpty ||
                                        _selectedItems.isEmpty ||
                                        distance.isEmpty ||
                                        levelOfGame.isEmpty) {
                                      Get.snackbar(
                                          "Error", "Please fill all fields",
                                          snackPosition: SnackPosition.TOP);
                                      return;
                                    }

                                    String result = _selectedItems.join(', ');

                                    log(result.toString());
                                    controller.changeSignUpLoading(true);
                                    Get.find<AuthController>().goalieSignUpApi(
                                      context,
                                      gender: gender,
                                      calibre: caliber,
                                      birthday: date.text,
                                      kmToPlay: distance,
                                      userId: widget.userId,
                                      goalieExperience: goalieExperience,
                                      avaliableToPlay: result.toString(),
                                      levelOfGame: levelOfGame,
                                      ashlRegister: ashlRegister,
                                    );
                                    controller.changeSignUpLoading(false);
                                  },
                                  child: const Text("Register"),
                                ),
                              ),
                            ],
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
