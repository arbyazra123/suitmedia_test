import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/components/appbars/primary_appbar.dart';
import 'package:suitmedia_test/components/listviews/users_listview.dart';
import 'package:suitmedia_test/components/texts/h1_atm.dart';
import 'package:suitmedia_test/modules/third/blocs/bloc/get_users_bloc.dart';
import 'package:suitmedia_test/modules/third/data/repositories/user_repository.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUsersBloc(context.read<UserRepository>()),
      child: _ThirdBody(),
    );
  }
}

class _ThirdBody extends StatefulWidget {
  const _ThirdBody({Key? key}) : super(key: key);

  @override
  _ThirdBodyState createState() => _ThirdBodyState();
}

class _ThirdBodyState extends State<_ThirdBody> {
  late ScrollController controller;
  late GetUsersBloc _getUserBloc;
  @override
  void initState() {
    _getUserBloc = context.read<GetUsersBloc>();
    _getUserBloc.add(Get(1));
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar("Third Page"),
      body: BlocBuilder<GetUsersBloc, GetUsersState>(
        builder: (context, state) {
          if (state is GetUsersError) {
            return Center(
              child: H1Atm(
                state.error.msg ?? "an unkown error occured",
              ),
            );
          }
          if (state is GetUsersLoaded) {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) =>
                  _handleScrollNotification(notification, state),
              child: RefreshIndicator(
                onRefresh: () async {
                  _getUserBloc.add(Get(1));
                },
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      SelectedUsers(
                        users: state.result,
                      ),
                      _buildLoadingMore(state),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is GetUsersLoading) {
            if (state.loadMoreLoading == LoadingType.First)
              return Center(
                child: CircularProgressIndicator(),
              );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  SizedBox _buildLoadingMore(GetUsersLoaded state) {
    return (state.loadingType == LoadingType.More)
        ? SizedBox(
            height: 100,
            width: double.maxFinite,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            height: 100,
          );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, GetUsersLoaded state) {
    if (notification is ScrollEndNotification) {
      print(controller.position.extentAfter);
      if (controller.position.extentAfter < 100 &&
          state.loadingType == LoadingType.More) {
        _getUserBloc.add(LoadMore(state.result));
      }
    }
    return false;
  }
}
