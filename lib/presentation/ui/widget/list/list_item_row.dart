import 'dart:convert';

import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ListItemRow extends StatelessWidget {
  final EventModel event;

  const ListItemRow(
      {Key? key, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        Routemaster.of(context).push(
          '${RelativePageRoutes.details}/${event.id}',
          queryParameters: {'eventModel': jsonEncode(event)},
        );
      },
      isThreeLine: true,
      dense: false,
      leading: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(event.performers[0].image ?? ''),
          ),
          event.isFavorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                )
              : const SizedBox.shrink(),
        ],
      ),
      title: Text(
        event.title.toString(),
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event.venue.address),
          Text(event.datetimeLocal.toLocal().toString()),
        ],
      ),
    );
  }
}
