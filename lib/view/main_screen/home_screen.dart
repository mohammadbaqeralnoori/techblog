import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/controller/articles/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/view/articles/artical_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          // ignore: unrelated_type_equality_checks
          child: homeScreenController.loading == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 16,
                    ),
                    tags(),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(ArticleListScreen(title: 'مقالات',)),
                      child: SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme, title: MyStrings.viewHotestBlog,)),
                    topVisited(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMorePadCast(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    topPodCastes(),
                    const SizedBox(
                      height: 65,
                    ),
                  ],
                )
              : const Center(child: Loading()),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodCastes() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return GestureDetector(
              onTap: () {
                Get.toNamed(NamedRoute.singlePodcast, arguments: homeScreenController.topPodcasts[index]);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topPodcasts[index].poster!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topPodcasts[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                colors: GradiantColors.posterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      Text(homePagePosterMap["view"],
                          style: textTheme.titleSmall),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 5, 16, 5),
                child: Text(homeScreenController.poster.value.title!,
                    style: textTheme.headlineSmall),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme, index: index));
        },
      ),
    );
  }
}

class SeeMorePadCast extends StatelessWidget {
  const SeeMorePadCast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: bodyMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            Assets.icons.podCastVoice.provider(),
            color: SolidColors.seeMore,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

