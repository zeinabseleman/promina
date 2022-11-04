import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/utils/localization/appLocalization.dart';
import 'package:task/view/pages/gallery_pages/widgets/upload_image.dart';
import 'package:task/view/shared_widgets/custom_btn.dart';
import 'package:task/view/shared_widgets/custom_gridview.dart';
import 'package:task/view/shared_widgets/text_widget.dart';

import '../../../core/colors.dart';
import '../../../provider/gallery_provider.dart';
import '../../shared_widgets/common_network_image.dart';
import 'widgets/gallery_app_bar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:AssetImage(
                        'assets/images/gellary.png'
                    ),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding:EdgeInsetsDirectional.only(start: 27.w,end: 27.w),
              child: Column(
                children:   [
                   const GalleryAppBar(),
                  SizedBox(height: 47.h,),
                  const UploadImage(),
                  SizedBox(height: 30.h,),
                  FutureBuilder(
                    future: Provider.of<GalleryProvider>(context,listen: false).getGallery(),
                    builder:
                        ( context, snapshot) {
                      if(snapshot.hasData){
                        return Consumer<GalleryProvider>
                          (builder: (context,notifier,child)=>
                        ( notifier.galleryModel!.data!.images!.isEmpty)
                            ?  TextWidget('${AppLocalizations.of(context)!.translate('no_data')}')
                            :CustomGridView(
                                itemCount: notifier.galleryModel!.data!.images!.length,
                                axisCount: 3,
                                ratio: 1,
                                mainSpacing: 25.h,
                                crossSpacing: 24.w,
                                itemBuilder: (context,index){
                                  return   CommonNetworkImageView(
                                    height: double.infinity,
                                    width: double.infinity,
                                    url: notifier.galleryModel!.data!.images![index],
                                    fit: BoxFit.cover,
                                    placeHolder: "assets/images/placeholder.png",
                                  );
                                })
                        );
                      }else{
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: SpinKitThreeBounce(
                              color: AppColors.primaryColor,
                              size: 30.w,
                            ),
                          ),
                        );
                      }
                    },

                  ),


                ],
              ),
            ),
          ),
        )
    );
  }
}
