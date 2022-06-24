import 'package:flutter/material.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/home_model.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: productsList.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.h,
                childAspectRatio: 1 / 1.52,
              ),
              itemCount: productsList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Center(
                            child: Image.network(
                              productsList[index].image ?? '',
                              fit: BoxFit.contain,
                              height: 22.h,
                              width: 40.w,
                            ),
                          ),
                          productsList[index].discount != 0
                              ? Container(
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
                                )
                              : Container(),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              productsList[index].name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${productsList[index].price ?? ''}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                // Text(
                                //   '${productsList[index].oldPrice ?? ''}',
                                //   style: TextStyle(
                                //     fontSize: 12.sp,
                                //     fontWeight: FontWeight.bold,
                                //     color: Theme.of(context)
                                //         .primaryColor,
                                //   ),
                                // ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    HomeCubit.get(context)
                                        .isFavourite(productsList[index].id!);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor:
                                        HomeCubit.get(context).favouritesMap![
                                                productsList[index].id]!
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
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
