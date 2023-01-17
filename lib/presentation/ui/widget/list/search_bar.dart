import 'package:digital14_demo/core/theme/app_color.dart';
import 'package:digital14_demo/core/theme/styles.dart';
import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const SearchBar({Key? key, required this.controller, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: AppColors.searchIconColor,
            ),
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                placeholder: 'Search',
                style: Styles.searchText,
                cursorColor: AppColors.searchCursorColor,
                decoration: null,
              ),
            ),
            GestureDetector(
              onTap: controller.clear,
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: AppColors.searchIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
