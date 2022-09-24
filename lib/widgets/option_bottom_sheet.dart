import 'package:flutter/material.dart';

class OptionBottomSheet extends StatefulWidget {
  final List<String> data;
  final Function(String)? onTap;
  final String? selectedData;

  const OptionBottomSheet(
      {required this.data, this.onTap, this.selectedData, Key? key})
      : super(key: key);

  @override
  State<OptionBottomSheet> createState() => _OptionBottomSheetState();
}

class _OptionBottomSheetState extends State<OptionBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: widget.data
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: GestureDetector(
                  onTap: () {
                    widget.onTap!(e);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e),
                      if (widget.selectedData == e) const Icon(Icons.check),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
