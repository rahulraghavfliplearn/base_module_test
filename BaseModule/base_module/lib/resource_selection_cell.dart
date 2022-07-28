import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:base_module/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResourceSelectionCell extends StatelessWidget {

  final String imgPlaceHolder;
  final String imgUrl;

  final String title;
  final String description;
  final String subDescription;
  final VoidCallback _callbackCellSelected;
  final String type;
  final String lastUpdatedAt;
  final Widget trailing;



  ResourceSelectionCell(
     this.imgPlaceHolder,
      this.imgUrl,
      this.title,
      this.description,
      this.subDescription,
      this._callbackCellSelected,
      {this.type,
      this.lastUpdatedAt,
        this.trailing,
      });

  @override
  Widget build(BuildContext context) {

    bool isSvg = imgUrl.contains(".svg");

   return  Container(
     padding: EdgeInsets.only(left: 5),
     decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10)),
     child: ListTile(
       contentPadding: trailing != null ? EdgeInsets.all(0) : EdgeInsets.fromLTRB(10,0,0,0) ,
        leading: imgUrl.isNotEmpty ? Container(
          //color: Colors.red,
          width: 50.0,
          height: 80.0,
          child: isSvg ?   SvgPicture.network(
            imgUrl,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(5.0),
                child: const CircularProgressIndicator()),
            color: AppColors.PRIMARY_THEME_COLOR,
            fit: BoxFit.fitHeight,
          ) :
          FadeInImage.assetNetwork(
            image:imgUrl,
            placeholder:imgPlaceHolder, // your assets image path
            fit: BoxFit.fill,
          )
        ) : Container(width: 1, height: 1,) ,
        title:Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "RobotoSlab",
              fontSize: 14,
            ),
          ),
        ),
        subtitle: Container(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              description.isNotEmpty ?
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "RobotoSlab",
                    fontSize: 9,
                  ),
                ),
              ) : Container(width: 1,),
             type != null && type.isNotEmpty?
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text("Type: $type",
                  style: TextStyle(
                    fontFamily: "RobotoSlab",
                    fontSize: 9,
                  ),
                ),
              ): Container(height: 1),

              (lastUpdatedAt != null && lastUpdatedAt.isNotEmpty) ? Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(lastUpdatedAt,
                  style: TextStyle(
                    fontFamily: "RobotoSlab",
                    fontSize: 9,
                  ),
                ),
              ): Container(height: 1),
            ],
          ),
        ),
        isThreeLine: true,
        trailing: trailing != null ? trailing : Container(width: 1,height: 1,),
        onTap: () {
          _callbackCellSelected();
        },
      ),
   );
  }




}
