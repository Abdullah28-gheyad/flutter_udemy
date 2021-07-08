import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/models/social_app/message_model.dart';
import 'package:messanger_flutter/models/social_app/post_model.dart';
import 'package:messanger_flutter/modules/social_app/chats/chat_screen.dart';
import 'package:messanger_flutter/modules/social_app/feeds/feeds_screen.dart';
import 'package:messanger_flutter/modules/social_app/newpost/new_post_screen.dart';
import 'package:messanger_flutter/modules/social_app/settings/setting_screen.dart';
import 'package:messanger_flutter/modules/social_app/users/user_screen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  Social_model userModel;
  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uID).get().then((value) {
      userModel = Social_model.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }
  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    Chat_Screen(),
    NewPost_Screen(),
    User_Screen(),
    Setting_Screen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index==0)
      getPosts() ;
    if (index==1)
      Get_All_Users() ;
    if (index == 2)
      emit(SocialNewPostState());
    else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  // image_picker7901250412914563370.jpg
  File coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());

        print(value);

        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }



  void updateUser({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  }) {
    Social_model model = Social_model(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      cover: cover ?? userModel.cover,
      image: image ?? userModel.image,
      u_id: userModel.u_id,
      is_email_verified:false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.u_id)
        .update(model.to_map())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  File postImage;
  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);

      emit(SocialPostImagePickedSuccessState());
    } else {
      print('No image selected.');

      emit(SocialPostImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;

    emit(SocialRemovePostImageState());
  }

  void uploadPostImage({
    @required String dateTime,
    @required String text,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    @required String dateTime,
    @required String text,
    String postImage,
  }) {
    emit(SocialCreatePostLoadingState());

    Post_model model = Post_model(
      name: userModel.name,
      image: userModel.image,
      u_id: userModel.u_id,
      date_time: dateTime,
      text: text,
      post_image: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.to_map())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  List<Post_model> posts = [];

  List<String> postsId = [];

  List<int> likes = [];

  List<int> comments = [];

  void getPosts() {
    posts=[] ;
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
          postsId.add(element.id);
          posts.add(Post_model.fromJson(element.data()));
      });
      emit(SocialGetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(SocialGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.u_id)
        .set({
      'like': true,
    }).then((value) {
      emit(SocialLikePostSuccessState());
    }).catchError((error) {
      emit(SocialLikePostErrorState(error.toString()));
    });
  }


  void commentPost(String post_id)
  {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(post_id)
        .collection('comments')
        .doc(userModel.u_id)
        .set({
      'comment': true,
    }).then((value) {
      emit(SocialCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialCommentPostErrorState(error.toString()));
    });
  }

  List<Social_model> AllUsers = [] ;
  void Get_All_Users () {
    AllUsers=[];
    emit(SocialGetAllUsersLoadingState());
    FirebaseFirestore.instance
        .collection('users').get()
        .then((value) {
          value.docs.forEach((element) {
            Social_model social_model2 = Social_model.fromJson(element.data()) ;
            if (userModel.u_id!=social_model2.u_id)
              AllUsers.add(Social_model.fromJson(element.data())) ;
            emit(SocialGetAllUsersSuccessState());
          });
    })
        .catchError((error){
        emit(SocialGetAllUsersErrorState(error.toString()));
    });
  }

  void Send_message (
  {
  @required String Reciever_id ,
  @required String Text ,
  @required String date_time ,
}
      )
  {
    MessageModel model = MessageModel(
      date_time: date_time , 
      Reciever_id: Reciever_id , 
      Sender_id: userModel.u_id , 
      Text: Text 
    );
    FirebaseFirestore.instance
    .collection('users')
    .doc(userModel.u_id)
    .collection('chats')
    .doc(Reciever_id)
    .collection('messages')
    .add(model.to_map()).then((value) {

      emit(SocialSendMessageSuccessState());
    })
        .catchError((onError){

          emit(SocialSendMessageErrorState()) ;
    }) ;

    FirebaseFirestore.instance
        .collection('users')
        .doc(Reciever_id)
        .collection('chats')
        .doc(userModel.u_id)
        .collection('messages')
        .add(model.to_map()).then((value) {

      emit(SocialSendMessageSuccessState());
    })
        .catchError((onError){

      emit(SocialSendMessageErrorState()) ;
    }) ;
  }
  
  List <MessageModel> Messages = [] ; 
  void Get_Messages(
  {
  @required String Reciever_id ,
}
      )
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.u_id)
        .collection('chats')
        .doc(Reciever_id)
        .collection('messages')
          .orderBy('date_time')
        .snapshots()
        .listen((event) {
      Messages=[];
      event.docs.forEach((element) {
        Messages.add(MessageModel.fromJson(element.data())) ;
      });
      emit(SocialGetMessageSuccessState()) ;
    });
  }




}
