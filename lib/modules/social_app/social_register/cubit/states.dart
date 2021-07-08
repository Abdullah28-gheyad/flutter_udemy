abstract class SocialRegisterStates {}
class SocialRegisterInitialState extends SocialRegisterStates {}
class SocialRegisterLoadingState extends SocialRegisterStates {}
class SocialRegisterSuccessState extends SocialRegisterStates {}

class SocialCreateusersuccessState extends SocialRegisterStates {}
class SocialCreateusererrorState extends SocialRegisterStates {
  final String error ;
  SocialCreateusererrorState(this.error);
}


class SocialRegisterErrorState extends SocialRegisterStates {
  final String error ;
  SocialRegisterErrorState(this.error);
}