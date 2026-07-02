import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/location_core/presentation/widgets/confirm_and_location_data.dart';
import 'package:guide_me/core/location_core/presentation/widgets/get_current_location_button.dart';
import 'package:guide_me/core/location_core/presentation/widgets/map_bloc_builder.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;
  List<MapLocationEntity> _searchResults = [];
  bool _isLoadingResults = false;
  bool _showSuggestions = false;

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    if (query.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _showSuggestions = false;
        _isLoadingResults = false;
      });
      return;
    }

    setState(() {
      _showSuggestions = true;
      _isLoadingResults = true;
    });

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (!mounted) return;
      final results = await context.read<PickLocationCubit>().searchLocation(query);
      if (mounted) {
        setState(() {
          _searchResults = results;
          _isLoadingResults = false;
        });
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchResults = [];
      _showSuggestions = false;
      _isLoadingResults = false;
    });
  }

  void _onResultSelected(MapLocationEntity location) {
    context.read<PickLocationCubit>().selectLocation(location);
    _clearSearch();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          const MapBlocBuilder(),

          // Search bar and suggestion list
          _buildSearchBarAndSuggestions(context),

          // Action buttons at the bottom
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 20,
            right: 20,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GetCurrentLocationButton(),

                SizedBox(height: 16),

                ConfirmAndLocationData(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildSearchBarAndSuggestions(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 24,
      left: 20,
      right: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _searchController,
            hintText: context.l10n.search,
            onChanged: _onSearchChanged,
            prefixIcon: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: _clearSearch,
                    icon: const Icon(
                      Icons.clear,
                      size: 20,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          if (_showSuggestions) ...[
            const SizedBox(height: 8),
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _isLoadingResults
                    ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _searchResults.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: _searchResults.length,
                            separatorBuilder: (context, index) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final result = _searchResults[index];
                              return ListTile(
                                leading: const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primary2,
                                ),
                                title: Text(
                                  result.name ?? 'Unknown Location',
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () => _onResultSelected(result),
                              );
                            },
                          ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

