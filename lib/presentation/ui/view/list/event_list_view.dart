import 'package:digital14_demo/presentation/bloc/geek_list_event/geek_event_bloc.dart';
import 'package:digital14_demo/presentation/ui/widget/list/list_item_row.dart';
import 'package:digital14_demo/presentation/ui/widget/list/search_bar.dart';
import 'package:digital14_demo/presentation/ui/widget/simmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EventListView extends StatefulWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocus;
  String queryText = '';

  @override
  void initState() {
    _searchController = TextEditingController()..addListener(_onTextChanged);
    _searchFocus = FocusNode();
    super.initState();
  }

  void _onTextChanged() {
    if (queryText != _searchController.text) {
      queryText = _searchController.text;
      BlocProvider.of<GeekEventBloc>(context).add(OnLoadGeekEvent(query: queryText));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('ListViewKey'),
      appBar: AppBar(
        key: const Key('ListViewAppBarKey'),
        backgroundColor: const Color(0xFF0a2d44),
        title: _buildSearchBox(),
        actions: [
          InkWell(
            onTap: () {
              _searchController.clear();
            },
            child: const Center(
                child: Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            )),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: VisibilityDetector(
        key: const Key('Geek_List'),
        onVisibilityChanged: (VisibilityInfo info) {
          var visiblePercentage = info.visibleFraction * 100;

          if (visiblePercentage > 80) {
            BlocProvider.of<GeekEventBloc>(context).add(const OnLoadGeekEvent());
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<GeekEventBloc, GeekEventState>(builder: (context, state) {
                  if (state is GeekEventsLoadingState) {
                    return const SimmerEffectWidget();
                  } else if (state is GeekEventsDataOnLoadState) {
                    return state.events.events.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) => ListItemRow(
                              event: state.events.events[index],
                            ),
                            itemCount: state.events.events.length,
                          )
                        : const Center(
                            child: Text('No Data Found'),
                          );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _searchController,
        focusNode: _searchFocus,
      ),
    );
  }
}
