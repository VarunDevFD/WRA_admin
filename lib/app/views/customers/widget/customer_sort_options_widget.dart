import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/customers/customers_controller.dart';

class SortOptions extends StatelessWidget {
  final CustomersController controller;

  const SortOptions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sort by section
        Expanded(
          child: _buildSortColumn(
            title: 'Sort by',
            children: [
              _buildSortOption('Date joined', SortBy.dateShared),
              _buildSortOption('Name', SortBy.name),
              _buildSortOption('Date modified', SortBy.dateModified),
              _buildSortOption('Date modified by me', SortBy.dateModifiedByMe),
              _buildSortOption('Date opened by me', SortBy.dateOpenedByMe),
            ],
          ),
        ),

        // Sort direction section
        Expanded(
          child: _buildSortColumn(
            title: 'Sort direction',
            children: [
              _buildDirectionOption('A to Z', SortDirection.aToZ),
              _buildDirectionOption('Z to A', SortDirection.zToA),
            ],
          ),
        ),

        // Sort person section
        Expanded(
          child: _buildSortColumn(
            title: 'Sort persons',
            children: [
              _buildPersonOption('All', SortPersons.all),
              _buildPersonOption('User', SortPersons.user),
              _buildPersonOption('Provider', SortPersons.provider),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSortColumn(
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            )),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildSortOption(String title, SortBy sortBy) {
    return Obx(() => ListTile(
          title: Text(title, style: const TextStyle(fontSize: 14)),
          leading: Radio<SortBy>(
            value: sortBy,
            groupValue: controller.sortBy.value,
            onChanged: (value) => controller.setSortBy(value!),
          ),
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ));
  }

  Widget _buildDirectionOption(String title, SortDirection direction) {
    return Obx(() => ListTile(
          title: Text(title, style: const TextStyle(fontSize: 14)),
          leading: Radio<SortDirection>(
            value: direction,
            groupValue: controller.sortDirection.value,
            onChanged: (value) => controller.setSortDirection(value!),
          ),
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ));
  }

  Widget _buildPersonOption(String title, SortPersons type) {
    return Obx(() => ListTile(
          title: Text(title, style: const TextStyle(fontSize: 14)),
          leading: Radio<SortPersons>(
            value: type,
            groupValue: controller.sortPersons.value,
            onChanged: (value) => controller.setSortPersons(value!),
          ),
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ));
  }
}
