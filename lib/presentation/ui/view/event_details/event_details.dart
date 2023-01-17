import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/presentation/bloc/geek_detail_event/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class EventDetails extends StatelessWidget {
  final EventModel event;
  const EventDetails({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('EventDetails'),
      appBar: AppBar(
        key: const Key('AppBar'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Wrap(
          children: [
            Text(
              event.title,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: event.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  )
                : const Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.red,
                    size: 20,
                  ),
            onPressed: () {
              BlocProvider.of<DetailsBloc>(context).add(FavoriteButtonPressedEvent(model: event));
              Routemaster.of(context).pop();
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        key: const Key('details_view'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                event.performers[0].image ?? '',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              event.title,
              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
            Text(event.venue.address),
            Text(event.datetimeLocal.toLocal().toString()),
          ],
        ),
      ),
    );
  }
}
