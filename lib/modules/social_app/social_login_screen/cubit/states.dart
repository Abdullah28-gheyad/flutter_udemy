abstract class SocialLoginStates {}
class SocialLoginInitialState extends SocialLoginStates {}
class SocialLoginLoadingState extends SocialLoginStates {}
class SocialLoginSuccessState extends SocialLoginStates {
 final String u_id ;
  SocialLoginSuccessState(this.u_id);
}
class SocialLoginErrorState extends SocialLoginStates {
  final String error ;
  SocialLoginErrorState(this.error);
}