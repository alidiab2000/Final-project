import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/recommendation.dart';
import 'package:final_project/features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';

import 'date_cards_list.dart';
import 'date_selection_buttons.dart';
import 'empty_date_state.dart';
import 'selected_dates_header.dart';

// Main Date Picker Widget
class DatePickerWidget extends StatefulWidget {
  final Function(List<DateTime>)? onDatesChanged;
  final List<DateTime>? initialDates;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? title;
  final double? maxHeight;

  const DatePickerWidget({
    super.key,
    this.onDatesChanged,
    this.initialDates,
    this.firstDate,
    this.lastDate,
    this.title,
    this.maxHeight,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late List<DateTime> _selectedDates;

  @override
  void initState() {
    super.initState();
    if (widget.initialDates != null) {
      _selectedDates = List<DateTime>.from(widget.initialDates!);
      _selectedDates.sort();
    } else {
      _selectedDates = [];
    }
    _fetchRecommendations();
  }

  void _fetchRecommendations() {
    if (_selectedDates.isNotEmpty) {
      context.read<RecommendationsCubit>().fetchRecommendationsFromFirebase(
        selectedDates: _selectedDates,
      );
    }
  }

  void _notifyDatesChanged() {
    widget.onDatesChanged?.call(List<DateTime>.from(_selectedDates));
    _fetchRecommendations();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2021),
      lastDate: widget.lastDate ?? DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        if (!_containsDate(_selectedDates, pickedDate)) {
          _selectedDates.add(pickedDate);
          _selectedDates.sort();
          _notifyDatesChanged();
        }
      });
    }
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: widget.firstDate ?? DateTime(2021),
      lastDate: widget.lastDate ?? DateTime(2030),
    );

    if (pickedRange != null) {
      setState(() {
        final List<DateTime> rangeDates = _getDatesInRange(pickedRange);
        for (final date in rangeDates) {
          if (!_containsDate(_selectedDates, date)) {
            _selectedDates.add(date);
          }
        }
        _selectedDates.sort();
        _notifyDatesChanged();
      });
    }
  }

  void _removeDate(DateTime dateToRemove) {
    setState(() {
      _selectedDates.removeWhere((date) => _isSameDay(date, dateToRemove));
      _notifyDatesChanged();
    });
  }

  void _clearAllDates() {
    setState(() {
      _selectedDates.clear();
      _notifyDatesChanged();
    });
  }

  bool _containsDate(List<DateTime> dates, DateTime date) {
    return dates.any((d) => _isSameDay(d, date));
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<DateTime> _getDatesInRange(DateTimeRange range) {
    final List<DateTime> dates = [];
    DateTime current = range.start;
    while (!current.isAfter(range.end)) {
      dates.add(DateTime(current.year, current.month, current.day));
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          DateSelectionButtons(
            onSelectDate: _selectDate,
            onSelectDateRange: _selectDateRange,
          ),
          if (_selectedDates.isNotEmpty)
            SelectedDatesHeader(
              dateCount: _selectedDates.length,
              onClearAll: _clearAllDates,
            ),
          if (_selectedDates.isNotEmpty)
            ExpansionTile(
              title: Text(
                'View Selected Dates',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              leading: Icon(
                Icons.calendar_view_day,
                color: Theme.of(context).primaryColor,
              ),
              initiallyExpanded: true,
              children: [
                BlocBuilder<RecommendationsCubit, RecommendationsState>(
                  builder: (context, state) {
                    if (state is RecommendationsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RecommendationsError) {
                      return Center(
                        child: Text(
                          'Error loading recommendations: ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _fetchRecommendations();
                      });

                      return FutureBuilder<List<Recommendation>>(
                        future: context
                            .read<RecommendationsCubit>()
                            .fetchRecommendationsFromFirebase(
                              selectedDates: _selectedDates,
                            ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          } else {
                            final recommendations = snapshot.data ?? [];
                            if (recommendations.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'No recommendations found for selected dates',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              );
                            }
                            return DateCardsList(
                              dates: recommendations,
                              maxHeight: widget.maxHeight ?? 400,
                              onRemoveDate:
                                  (data) =>
                                      _removeDate(DateTime.parse(data.date)),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          if (_selectedDates.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: const EmptyDateState(),
            ),
        ],
      ),
    );
  }
}
