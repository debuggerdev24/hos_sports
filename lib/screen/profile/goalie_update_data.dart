import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/schedule_game/schedule_form.dart';
import 'package:hos_sports/service/model/UserModel.dart';
import 'package:hos_sports/widgets/custom_dropdown.dart';

import '../../../service/controller/auth_controller.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/widgets.dart';

class GoalieUpdateProfileDetails extends StatefulWidget {
  final UserModel data;
  const GoalieUpdateProfileDetails({
    super.key,
    required this.data,
  });

  @override
  State<GoalieUpdateProfileDetails> createState() =>
      _GoalieUpdateProfileDetailsState();
}

class _GoalieUpdateProfileDetailsState
    extends State<GoalieUpdateProfileDetails> {
  late String gender;
  late String goalieExperience;
  late String ashlRegister;

  late String distance; // Default value
  late dynamic proximity;
  late String levelOfGame; // Default value

  DateTime? selectedDate;
  final date = TextEditingController(); // Default date is empty

  late String caliber; // Default value

  late List<String> _selectedItems;

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
  void initState() {
    gender = widget.data.gender!;
    goalieExperience = widget.data.rentAGoalieExperience!;
    ashlRegister = widget.data.ashlRegister!;
    distance = widget.data.kilometersToTravel!;
    levelOfGame = widget.data.levelOfGame!;

    // Convert the availableToPlay string to a List<String> if not null
    _selectedItems = widget.data.avaliableToPlay != null &&
            widget.data.avaliableToPlay!.isNotEmpty
        ? widget.data.avaliableToPlay!
            .split(',')
            .map((item) => item.trim())
            .toList()
        : [];
    caliber = widget.data.calibre!;
    // proximity = widget.data.kilometersToTravel!;
    // format = widget.data.avaliableToPlay!;
    // selectedDate = widget.data.birthday! as DateTime?;
    // date.text = widget.data.birthday!;

    // Parse birthday string into DateTime
    if (widget.data.birthday != null && widget.data.birthday!.isNotEmpty) {
      try {
        selectedDate = DateTime.parse(widget.data.birthday!);
        date.text =
            "${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}";
      } catch (e) {
        debugPrint("Error parsing date: $e");
        selectedDate = null; // Fallback in case of error
      }
    }
    super.initState();
  }

//
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //

// @override
//   void dispose() {
//      Future.microtask(() => _.controller!.getUsersDetailsApi());
//     super.dispose();
//   }

  @override
  void dispose() {
    Future.microtask(() => Get.find<AuthController>().getUsersDetailsApi());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile details"),
      ),
      body: Container(
        height: screenHeight(context),
        decoration: decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Avaliable to play',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  _selectedItems.isEmpty
                                      ? 'Please Select Format'
                                      : _selectedItems.join(', '),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    const Expanded(
                      child: Text(
                        'Caliber :  ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropDownList(
                        labelShow: false,
                        value: caliber,
                        label: "Caliber",
                        onChange: (val) {
                          caliber = val.toString();
                          setState(() {});
                        },
                        items: const ['A', 'B', 'C', 'D', "E", 'Rec'],
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    const Expanded(
                      child: Text(
                        'Playing Experience :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropDownList(
                        value: levelOfGame,
                        label: "Playing Experience",
                        labelShow: false,
                        onChange: (val) {
                          setState(() => levelOfGame = val!);
                        },
                        items: const [
                          'Rec',
                          'HL',
                          'A',
                          'AA',
                          'AAA',
                          'Jr.',
                        ],
                      ),
                    ),
                  ]),

                  const SizedBox(height: 20),
                  // Row(children: [
                  //   const Expanded(
                  //     child: Text(
                  //       'ASHL Register :',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: DropDownList(
                  //       labelShow: false,
                  //       value: ashlRegister,
                  //       label: "Caliber",
                  //       onChange: (val) {
                  //         caliber = val.toString();
                  //         setState(() {});
                  //       },
                  //       items: const ['yes', 'No'],
                  //     ),
                  //   ),
                  // ]),

                  const SizedBox(height: 50),
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
                                    onPressed: () async {
                                      if (date.text.isEmpty ||
                                          _selectedItems.isEmpty ||
                                          distance.isEmpty ||
                                          levelOfGame.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill all fields",
                                            snackPosition: SnackPosition.TOP);
                                        return;
                                      }
                                      // controller.changeSignUpLoading(true);
                                      // Get.find<AuthController>().goalieSignUpApi(
                                      //   context,
                                      //   gender: gender,
                                      //   calibre: caliber,
                                      //   birthday: date.text,
                                      //   kmToPlay: distance,
                                      //   // userId: widget.userId,
                                      //   goalieExperience: goalieExperience,
                                      //   avaliableToPlay: format,
                                      //   levelOfGame: levelOfGame,
                                      //   ashlRegister: ashlRegister,
                                      // );

                                      if (_formKey.currentState!.validate()) {
                                        String result =
                                            _selectedItems.join(', ');
                                        await controller
                                            .changeSignUpLoading(true);
                                        await controller
                                            .updateProfileDetailsApi(
                                          context,
                                          gender: gender,
                                          calibre: caliber,
                                          birthday: date.text,
                                          kmToPlay: distance,
                                          userId: widget.data.userId,
                                          goalieExperience: goalieExperience,
                                          avaliableToPlay: result,
                                          levelOfGame: levelOfGame,
                                          ashlRegister: ashlRegister,
                                        );
                                        await controller
                                            .changeSignUpLoading(false);
                                        Navigator.of(context);
                                      }
                                    },
                                    child: const Text("Update"),
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
      ),
    );
  }
}
