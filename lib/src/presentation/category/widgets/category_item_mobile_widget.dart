import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category_model.dart';

class CategoryItemMobileWidget extends StatelessWidget {
  const CategoryItemMobileWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => context.pushNamed(
        editCategoryName,
        pathParameters: <String, String>{'cid': category.superId.toString()},
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(category.color ?? Colors.amber.shade100.value)
              .withOpacity(0.3),
          child: Icon(
            IconData(
              category.icon,
              fontFamily: fontFamilyName,
              fontPackage: fontFamilyPackageName,
            ),
            color: Color(category.color ?? Colors.amber.shade100.value),
          ),
        ),
        title: Text(
          category.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.titleMedium?.copyWith(
            color: context.onSurfaceVariant,
          ),
        ),
        trailing: category.isDefault ? Icon(MdiIcons.swapHorizontal) : null,
        subtitle: category.description == null || category.description == ''
            ? null
            : Text(
                category.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.75),
                ),
              ),
      ),
    );
  }
}
