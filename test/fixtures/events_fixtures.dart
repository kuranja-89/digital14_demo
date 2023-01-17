import 'package:digital14_demo/data/models/event_model.dart';

class EventFixtures {
  var events = Events(events: [
    EventModel.fromJson(
      const {
        "type": "family",
        "id": 5851334,
        "datetime_utc": "2023-01-16T11:30:00",
        "venue": {
          "state": "NV",
          "name_v2": "Le Theatre Des Arts at Paris Las Vegas",
          "postal_code": "89109",
          "name": "Le Theatre Des Arts at Paris Las Vegas",
          "links": [],
          "timezone": "America\/Los_Angeles",
          "url": "https:\/\/seatgeek.com\/venues\/le-theatre-des-arts-at-paris-las-vegas-2\/tickets",
          "score": 0.47,
          "location": {"lat": 36.11, "lon": -115.171},
          "address": "3655 Las Vegas Blvd South",
          "country": "US",
          "has_upcoming_events": true,
          "num_upcoming_events": 435,
          "city": "Las Vegas",
          "slug": "le-theatre-des-arts-at-paris-las-vegas-2",
          "extended_address": "Las Vegas, NV 89109",
          "id": 1610,
          "popularity": 0,
          "access_method": null,
          "metro_code": 839,
          "capacity": 0,
          "display_location": "Las Vegas, NV"
        },
        "datetime_tbd": false,
        "performers": [
          {
            "type": "theater_family",
            "name": "Eiffel Tower Experience",
            "image":
                "https:\/\/seatgeek.com\/images\/performers-landscape\/eiffel-tower-experience-ce92de\/605657\/huge.jpg",
            "id": 605657,
            "images": {
              "huge":
                  "https:\/\/seatgeek.com\/images\/performers-landscape\/eiffel-tower-experience-ce92de\/605657\/huge.jpg"
            },
            "divisions": null,
            "has_upcoming_events": true,
            "primary": true,
            "stats": {"event_count": 349},
            "taxonomies": [
              {
                "id": 3000000,
                "name": "theater",
                "parent_id": null,
                "document_source": {"source_type": "ELASTIC", "generation_type": "FULL"},
                "rank": 8
              },
              {
                "id": 3050000,
                "name": "family",
                "parent_id": 3000000,
                "document_source": {"source_type": "ELASTIC", "generation_type": "FULL"},
                "rank": 0
              }
            ],
            "image_attribution":
                "https:\/\/www.flickr.com\/photos\/30478819@N08\/33015766008\/in\/photolist-SiuqYY-2aAJ6nb-27tFEJr-TfEqvU-5aFqe6-2fRfscU-5DcTqo-aeB1dg-bwAYdx-2bPCenq-8ARy1R-bEMH74-8AVpGL-8hqR5S-VdZ7nk-jxcedC-22scg7N-9xTeGb-JpxkhQ-aZSDGK-TeZcdy-UyCnMt-KAvtd8-Zs5p3j-dAxQMP-wWQ9yZ-SVBXhi-U6EHKs-2avypie-27tFDtv-28L2Gyd-27tFTRP-266CDAq-55FPdQ-cQMWE3-cQMWJC-23gcZ9w-eUSFKb-o7da-6iS3sK-bdJx7r-4Li5MP-aFafGG-4Li66X-7JPSpe-4faxNq-bVSDK2-bVSCu4-bVSyga-bVSzfF",
            "url": "https:\/\/seatgeek.com\/eiffel-tower-experience-tickets",
            "score": 0.23,
            "slug": "eiffel-tower-experience",
            "home_venue_id": null,
            "short_name": "Eiffel Tower Experience",
            "num_upcoming_events": 349,
            "colors": null,
            "image_license": "https:\/\/creativecommons.org\/licenses\/by\/2.0\/?ref=ccsearch&atype=rich",
            "popularity": 0,
            "location": null,
            "image_rights_message":
                "[This image](https:\/\/www.flickr.com\/photos\/30478819@N08\/33015766008\/in\/photolist-SiuqYY-2aAJ6nb-27tFEJr-TfEqvU-5aFqe6-2fRfscU-5DcTqo-aeB1dg-bwAYdx-2bPCenq-8ARy1R-bEMH74-8AVpGL-8hqR5S-VdZ7nk-jxcedC-22scg7N-9xTeGb-JpxkhQ-aZSDGK-TeZcdy-UyCnMt-KAvtd8-Zs5p3j-dAxQMP-wWQ9yZ-SVBXhi-U6EHKs-2avypie-27tFDtv-28L2Gyd-27tFTRP-266CDAq-55FPdQ-cQMWE3-cQMWJC-23gcZ9w-eUSFKb-o7da-6iS3sK-bdJx7r-4Li5MP-aFafGG-4Li66X-7JPSpe-4faxNq-bVSDK2-bVSCu4-bVSyga-bVSzfF) is available through [Creative Commons](https:\/\/creativecommons.org\/licenses\/by\/2.0\/?ref=ccsearch&atype=rich) on Flickr. Email [images@seatgeek.com](mailto:images@seatgeek.com) with any questions."
          }
        ],
        "is_open": false,
        "links": [],
        "datetime_local": "2023-01-16T03:30:00",
        "time_tbd": true,
        "short_title": "Eiffel Tower Experience - Las Vegas",
        "visible_until_utc": "2023-01-17T08:00:00",
        "stats": {
          "listing_count": null,
          "average_price": null,
          "lowest_price_good_deals": null,
          "lowest_price": null,
          "highest_price": null,
          "visible_listing_count": null,
          "dq_bucket_counts": null,
          "median_price": null,
          "lowest_sg_base_price": null,
          "lowest_sg_base_price_good_deals": null
        },
        "taxonomies": [
          {"id": 3000000, "name": "theater", "parent_id": null, "rank": 8},
          {"id": 3050000, "name": "family", "parent_id": 3000000, "rank": 0}
        ],
        "url": "https:\/\/seatgeek.com\/eiffel-tower-experience-las-vegas-tickets\/family\/2023-01-16-3-30-am\/5851334",
        "score": 0.341,
        "announce_date": "2022-10-23T00:00:00",
        "created_at": "2022-10-23T16:02:50",
        "date_tbd": false,
        "title": "Eiffel Tower Experience - Las Vegas",
        "popularity": 0.667,
        "description": "",
        "status": "normal",
        "access_method": null,
        "event_promotion": null,
        "announcements": {},
        "conditional": false,
        "enddatetime_utc": null,
        "themes": [],
        "domain_information": []
      },
    ),
  ]);
}
