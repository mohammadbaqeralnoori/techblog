import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/controller/articles/list_article_controller.dart';
import 'package:techblog/controller/articles/single_article_controller.dart';
import 'package:techblog/main.dart';


// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  String title;
  ArticleListScreen({required this.title, super.key});
  ListArticleController listarticleController =
      Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Obx(
            () => !singleArticleController.loading.value
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listarticleController.articleList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: (() async {
                          await singleArticleController.getArticleInfo(
                              listarticleController.articleList[index].id);
                          Get.toNamed(NamedRoute.routeSingleArticle);
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
                                  imageUrl: listarticleController
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
                                          listarticleController
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
                                        listarticleController
                                            .articleList[index].author!,
                                        style: textTheme.labelMedium,
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        "${listarticleController.articleList[index].view!} ${MyStrings.visit}",
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
                : const Loading(),
          ),
        ),
      ),
    ));
  }
}
