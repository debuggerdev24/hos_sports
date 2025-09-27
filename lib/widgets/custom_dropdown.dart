import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have this package for dialog
import 'package:hos_sports/widgets/constants.dart';

class DropDownList extends StatefulWidget {
  final List<String> items;
  final String? value;
  final String label;
  final bool? labelShow;
  final ValueChanged<String?>? onChange;
  final String? disabledItem; 
  const DropDownList(
      {Key? key,
      required this.items,
      this.value,
      this.onChange,
      required this.label,
      this.disabledItem,
      this.labelShow = true})
      : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  final GlobalKey _key = GlobalKey();
  final LayerLink _layerLink = LayerLink();
  String? _selected;
  bool _isHovered = false;
  bool _isOverlayShown = false;
  OverlayEntry? _overlay;

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.items.contains(widget.value)) {
      _selected = widget.value; 
    } else if (widget.items.isNotEmpty) {
      _selected = widget.items.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _onTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                key: _key,
                padding: const EdgeInsets.all(Defaults.spacing),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: _isHovered || _isOverlayShown
                        ? AppColor.primary
                        : AppColor.white,
                    width: Defaults.edge,
                  ),
                  borderRadius: BorderRadius.circular(Defaults.radius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      _selected ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
              if (widget.labelShow == true)
                Positioned(
                  top: -9,
                  left: 20,
                  child: Container(
                    color: Colors.black,
                    child: Text(
                      " ${widget.label} ",
                      style: TextStyle(
                        color: _isHovered || _isOverlayShown
                            ? AppColor.primary
                            : AppColor.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomRight,
              followerAnchor: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: _createListItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeOverlay() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null; // Clear the overlay reference after removal
      setState(() => _isOverlayShown = false);
    }
  }

  Widget _createListItems() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Defaults.spacing / 2.0),
      decoration: BoxDecoration(
        color: Defaults.normal,
        border: Border.all(
          color: Defaults.active,
          width: Defaults.edge,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Defaults.radius),
        ),
      ),
      width: renderBox.size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.items
            .map((item) => ListItem(
                  item,
                  onTap: () => _onListItemTap(item),
                  isDisabled:
                      item == widget.disabledItem, // Check if item is disabled
                ))
            .toList(),
      ),
    );
  }

  void _onTap() {
    if (_isOverlayShown) {
      _removeOverlay();
    } else {
      _overlay = _createOverlay();
      Overlay.of(context)?.insert(_overlay!);
      setState(() => _isOverlayShown = true);
    }
  }

  void _onListItemTap(String item) {
    if (item == widget.disabledItem) {
      // Log the disabled item action
      log("Disabled item tapped: $item");
      _removeOverlay();
      // Show the alert dialog when the disabled item is tapped
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.white),
          ),
          title: const Text("Alert"),
          content:
              const Text("Sorry, we do not provide this service at this time."),
          actions: [
            // Center(
            //   child: TextButton(
            //     onPressed: () {
            //       Get.back(); // Close the dialog
            //     },
            //     child: const Text("Ok"),
            //   ),
            // ),

            ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text("OK"))
          ],
        ),
      ).then((_) {
        // Remove the overlay after the dialog is dismissed
        _removeOverlay();
      });
    } else {
      _removeOverlay();
      setState(() {
        log("Selected item: $item");
        _selected = item;
      });
      widget.onChange
          ?.call(item); // Trigger the onChange event for valid selections
    }
  }
}

// Multi Select widget
class MultiSelect extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;

  const MultiSelect(
      {Key? key, required this.items, required this.selectedItems})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.red, width: 1),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) {
            return CheckboxListTile(
              value: _selectedItems.contains(item),
              title: Text(item, style: const TextStyle(color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked) => _itemChange(item, isChecked!),
              activeColor: Colors.red,
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: _submit,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isDisabled; // New property to check if item is disabled

  const ListItem(
    this.title, {
    Key? key,
    this.onTap,
    this.isDisabled = false, // Initialize as false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap, 
        // onTap: isDisabled ? null : onTap, // Disable the tap if isDisabled
        child: Padding(
          padding: const EdgeInsets.all(Defaults.spacing),
          child: Text(
            title,
            style: TextStyle(
              color: isDisabled
                  ? Colors.grey
                  : Colors.white, 
            ),
          ),
        ),
      ),
    );
  }
}

class Defaults {
  static const double spacing = 16.0;
  static const double radius = 18.0;
  static const double edge = 1.0;

  static const Color background = Colors.black;
  static const Color normal = Colors.black;
  static const Color active = AppColor.primary;
  static const Color inActive = AppColor.white;
}
