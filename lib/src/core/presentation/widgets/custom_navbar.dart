import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagineapp_test_gap/generated/l10n.dart';
import 'package:imagineapp_test_gap/src/core/theme/ui_colors.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
    required this.selectedIndex,
    this.onChanged,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int)? onChanged;

  @override
  Widget build(BuildContext context) {
    return NeumorphicToggle(
      style: const NeumorphicToggleStyle(
        backgroundColor: UIColors.greenBase,
      ),
      height: 60.h,
      selectedIndex: selectedIndex,
      onChanged: onChanged,
      children: [
        ToggleElement(
          background: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).home.toUpperCase(),
            ),
          ),
          foreground: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).home.toUpperCase(),
            ),
          ),
        ),
        ToggleElement(
          background: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).favorites.toUpperCase(),
            ),
          ),
          foreground: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).favorites.toUpperCase(),
            ),
          ),
        ),
        ToggleElement(
          background: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).search.toUpperCase(),
            ),
          ),
          foreground: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).search.toUpperCase(),
            ),
          ),
        ),
        ToggleElement(
          background: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).recents.toUpperCase(),
            ),
          ),
          foreground: Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).recents.toUpperCase(),
            ),
          ),
        ),
      ],
      thumb: Container(
        color: UIColors.blueBase,
      ),
    );
  }
}
