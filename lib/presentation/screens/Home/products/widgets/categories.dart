import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/categories_model.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categoriesData,
  }) : super(key: key);

  final List<DataModel1> categoriesData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.separated(
        itemCount: categoriesData.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 1.5.w);
        },
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                height: 15.h,
                width: 30.w,
                child: Image.network(
                  categoriesData[index].image!,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(
                  0.8,
                ),
                height: 3.h,
                width: 30.w,
                child: Center(
                  child: Text(
                    categoriesData[index].name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
