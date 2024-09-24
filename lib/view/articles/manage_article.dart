import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/controller/articles/manage_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

import 'package:techblog/route_manager/names.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var articleManageController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: appBar("مدیریت مقاله ها"),
      body: Obx(
        () => articleManageController.Loading.value
            ? const Loading()
            : articleManageController.articleList.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articleManageController.articleList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: (() async {
                          // route to single manage
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height / 6,
                                width: Get.width / 3,
                                child: CachedNetworkImage(
                                  imageUrl: articleManageController
                                      .articleList[index].image!,
                                  imageBuilder: (((context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    );
                                  })),
                                  placeholder: (((context, url) {
                                    return const Loading();
                                  })),
                                  errorWidget: ((context, url, error) {
                                    return const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 50,
                                        color: Colors.grey);
                                  }),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      // width: size.width / 1.7,
                                      width: Get.width / 2,
                                      child: Text(
                                          articleManageController
                                              .articleList[index].title!,
                                          style: textTheme.bodySmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2)),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articleManageController
                                            .articleList[index].author!,
                                        style: textTheme.labelMedium,
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        "${articleManageController.articleList[index].view!} ${MyStrings.visit}",
                                        style: textTheme.labelMedium,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                : articleEmptyState(textTheme),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(fixedSize: WidgetStateProperty.all(Size(Get.width / 3, 56))),
                onPressed: () {
                  Get.toNamed(NamedRoute.singleManageArticle);
                },
                child: Text("بریم برای نوشتن یه مقاله باحال",
                    style: textTheme.headlineSmall)),
          )),
    ));
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: Assets.images.tcbotEmpty.provider(),
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.articleEmpty, style: textTheme.bodySmall)),
          ),
        ],
      ),
    );
  }
}
