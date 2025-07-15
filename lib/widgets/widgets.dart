import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

Widget centerHeadingText(context, String title) {
  return Container(
    width: screenWidth(context),
    height: screenHeight(context),
    decoration: decoration(),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Card(
          color: Colors.black.withOpacity(.3),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}

screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final int? maxLength;
  final Function(String)? onChanged;
  final int? maxLines;
  final String? labelText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.controller,
      this.prefix,
      this.keyboardType,
      this.validator,
      this.labelText,
      this.suffix,
      this.obscureText,
      this.inputFormatters,
      this.maxLength,
      this.readOnly,
      this.maxLines,
      this.enabled,
      this.onTap,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
          enabled: enabled ?? true,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          onChanged: onChanged,
          style: TextStyle(
              color: obscureText ?? false ? AppColor.primary : Colors.white,
              fontSize: 14),
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black,
            prefixIcon: prefix,
            prefixIconColor: AppColor.primary,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            suffixIcon: suffix,
            labelText: labelText,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColor.primary),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.onTap,
    required this.items,
    required this.value,
    required this.labelText,
  });

  final Function(String?) onTap; 
  final String? value; 
  final String labelText;
  final List<DropdownMenuItem<String>> items;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButtonFormField<String>(
        items: widget.items,
        value: widget.value, 
        onChanged: (value) {
          widget.onTap(value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        },
        dropdownColor: Colors.black,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          fillColor: Colors.black,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Colors.white), 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Colors.white), 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Colors.white), 
          ),
        ),
      ),
    );
  }
}

class CustomImage extends StatefulWidget {
  final String url;
  final double? radius;

  const CustomImage({super.key, required this.url, this.radius});

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {

    if (widget.url.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        child: Image.asset(
          ImageConst.logo,
          fit: BoxFit.cover,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (widget.url.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Image.network(widget.url),
              );
            },
          );
        }
      },
      child: CachedNetworkImage(
        imageUrl: widget.url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius ?? 0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: Image.asset(ImageConst.logo)),
        errorWidget: (context, url, error) => Image.asset(ImageConst.logo),
      ),
    );
  }
}

class CustomImageBig extends StatefulWidget {
  final String url;
  final double? radius;

  const CustomImageBig({super.key, required this.url, this.radius});

  @override
  State<CustomImageBig> createState() => _CustomImageBigState();
}

class _CustomImageBigState extends State<CustomImageBig> {
  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        child: Image.asset(
          ImageConst.logo,
          fit: BoxFit.cover,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (widget.url.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: InteractiveViewer(
                  panEnabled: true,
                  boundaryMargin: EdgeInsets.all(5),
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // image: DecorationImage(
                      //   image: NetworkImage(widget.url),
                      //   fit: BoxFit.contain, // Ensures full visibility
                      // ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 30),
                        Image.network(widget.url)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: CachedNetworkImage(
        imageUrl: widget.url,
        imageBuilder: (context, imageProvider) => Container(
          height: 200, // Increased size
          width: 300, // Increased size
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: Image.asset(ImageConst.logo)),
        errorWidget: (context, url, error) => Image.asset(ImageConst.logo),
      ),
    );
  }
}

Decoration decoration() {
  return const BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.overlay),
      image: AssetImage(ImageConst.backgroundImage),
    ),
  );
}

priceConverter({required String amount}) {
  return "\$$amount";
}

Future<void> makePhoneCall(phone) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: "+1$phone",
  );
  await launchUrl(launchUri);
}

Future<void> makeEmail(email) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email.toString(),
  );
  await launchUrl(launchUri);
}

void _launchEmail() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'example@example.com',
    query: 'subject=Example Subject&body=Example Body',
  );
  var url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

String formatPhoneNumber(String phoneNumber) {
  // Remove all non-digit characters
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
  // Add formatting
  if (digitsOnly.length == 10) {
    return '+1(${digitsOnly.substring(0, 3)})${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6, 10)}';
  } else {
    return phoneNumber;
  }
}

Future<void> launchURLS(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Decoration dec = BoxDecoration(
    color: Colors.black.withOpacity(.5),
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadiusDirectional.circular(10));

// getCustomDialog(model) {
//   Get.dialog(AlertDialog(
//     backgroundColor: Colors.black,
//     title: Text(model.message.toString()),
//   ));
// }

class NotificationTiles extends StatelessWidget {
  final String title;
  final Function(bool)? onChanged;
  final bool value;

  const NotificationTiles(
      {super.key, required this.title, this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: dec,
        child: ListTile(
          title: Text(title),
          trailing: CupertinoSwitch(value: value, onChanged: onChanged),
        ),
      ),
    );
  }
}
