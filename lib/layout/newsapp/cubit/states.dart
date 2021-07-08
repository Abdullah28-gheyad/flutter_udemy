abstract class NewsStates {}
class NewsInitialstate extends NewsStates {}
class NewsBottomNavState extends NewsStates {}
class NewsGetBusinessSuccessState extends NewsStates {}
class NewsGetBusinessLoadingState extends NewsStates {}
class NewsGetBusinessEroorState extends NewsStates {
  final String error ;
  NewsGetBusinessEroorState(this.error) ;
}

class NewsGetSportsSuccessState extends NewsStates {}
class NewsGetSportsLoadingState extends NewsStates {}
class NewsGetSportsEroorState extends NewsStates {
  final String error ;
  NewsGetSportsEroorState(this.error) ;
}

class NewsGetScienceSuccessState extends NewsStates {}
class NewsGetScineceLoadingState extends NewsStates {}
class NewsGetScienceEroorState extends NewsStates {
  final String error ;
  NewsGetScienceEroorState(this.error) ;
}


class NewsGetSearchSuccessState extends NewsStates {}
class NewsGetSearchLoadingState extends NewsStates {}
class NewsGetSearchEroorState extends NewsStates {
  final String error ;
  NewsGetSearchEroorState(this.error) ;
}