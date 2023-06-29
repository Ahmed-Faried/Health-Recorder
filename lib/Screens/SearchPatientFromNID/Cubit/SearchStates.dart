abstract class SearchStates {}

class InitialSearchStates extends SearchStates {}

class SearchStates_SuccessState extends SearchStates {}

class SearchStates_ErrorState extends SearchStates {
  var errors ;
  SearchStates_ErrorState(this.errors);

}

class SearchStates_LoadingState extends SearchStates {}
