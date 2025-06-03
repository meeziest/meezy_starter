import 'package:chatbot_core/chatbot_core.dart';
import 'package:chatbot_core/src/chat/view/bloc/chat_bloc/chat_bloc.dart';
import 'package:flutter/cupertino.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get w => this * 1;

  ///[ScreenUtil.setHeight]
  double get h => this * 1;

  ///[ScreenUtil.radius]
  double get r => this * 1;

  ///[ScreenUtil.diagonal]
  double get dg => this * 1;

  ///[ScreenUtil.diameter]
  double get dm => this * 1;

  ///[ScreenUtil.setSp]
  double get sp => this * 1;
}

extension ChatsBlocExt on BuildContext {
  ChatsBloc get chatsBloc => read<ChatsBloc>();
  ChatBloc get chatBloc => read<ChatBloc>();
}

extension ChatScreenViewModelInheritedExt on BuildContext {
  ChatScreenViewModel get chatViewModel => ChatScreenViewModelInherited.of(this);
}
