import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business logic/cubit/cubitHome/home_cubit.dart';
import '../../../../../data/models/favourites_model.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({
    Key? key,
    required this.model,
  }) : super(key: key);
  final DataProducts model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      color: Colors.white,
      margin: EdgeInsets.only(
        right: 4.w,
        left: 4.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Center(
                child: Image.network(
                  model.product!.image!,
                  fit: BoxFit.contain,
                  height: 22.h,
                  width: 40.w,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.5.h,
                  horizontal: 2.w,
                ),
                color: Colors.red,
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 8.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.product!.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product!.price!}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).isFavourite(
                          model.product!.id!,
                        );
                      },
                      icon: CircleAvatar(
                        backgroundColor: HomeCubit.get(context)
                                .favouritesMap![model.product!.id]!
                            ? Colors.red
                            : Colors.grey,
                        radius: 20,
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
