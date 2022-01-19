import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/texts/texts.dart';
import 'package:suitmedia_test/core/user/user_cubit.dart';
import 'package:suitmedia_test/modules/third/data/models/user_response.dart';

class SelectedUsers extends StatelessWidget {
  final List<User> users;
  const SelectedUsers({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics:NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserItem(
          user: users[index],
        );
      },
    );
  }
}

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<UserCubit>().addOrRemoveUser(user,context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.maxFinite,
        child: Row(
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CachedNetworkImage(
                  imageUrl: user.avatar ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  H2Atm(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  H4Atm(
                    (user.email ?? "unknown@gmail.com").toUpperCase(),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
