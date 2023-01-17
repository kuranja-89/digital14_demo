# digital14_demo

Geek API demo.

## Getting Started

This Project build with Clean architecture with Flutter bloc as state management

This project supports android and ios both platform.

Please use bellow command before Run

#flutter clean
#flutter pub get


Third party packages 

#flutter_bloc: ^8.1.1 
 flutter bloc used for state management

#get_it: ^7.2.0
 get_ it used for dependency injection 

#routemaster: ^1.0.1
  routemaster used for navigation 

#loggy: ^2.0.3
 loggy used for logs 

#http: ^0.13.4
#dartz: ^0.10.1
 http and dartz used for network api call handling

#shimmer: ^2.0.0
 shimmer used for loading effect

#shared_preferences: ^2.0.16
 shared_preference used for saving data in preference like favourite events

#visibility_detector: ^0.3.3
visibility_detector used for detect visibility for UI


#Testing
bloc_test: ^9.1.0
mocktail: ^0.3.0
network_image_mock: ^2.1.1
 all these packages uses for unit test case


Note: favourite/Un favourite event logics handled via shared_preferences because of time constraints otherwise this can we done via  local DB also (i.e.- via sqflite or moor db)

