import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/decorations.dart';
import 'package:techblog/component/dimens.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/controller/podcast/single_podcast_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/podcast_model.dart';

// ignore: must_be_immutable
class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodCastModel podCastModel;
  SinglePodcast({super.key}) {
    podCastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podCastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.id);
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height / 3,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: podCastModel.poster!,
                          imageBuilder: ((context, imageProvider) => Image(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              )),
                          placeholder: ((context, url) => const Loading()),
                          errorWidget: ((context, url, error) => Image.asset(
                              Assets.images.singlePlaceHolder.path)),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: GradiantColors.singleAppbarGradiant)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (() => Get.back()),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () {
                                  /// will added to your bookmark list
                                },
                                child: const Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.share,
                                size: 24,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        podCastModel.title!,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image(
                            height: 50,
                            image: Image.asset(Assets.icons.profileIcon.path)
                                .image),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          podCastModel.author!,
                          style: textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.podcastsFileList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await controller.player
                                  .seek(Duration.zero, index: index);
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        Image.asset(
                                                Assets.icons.podCastVoice.path)
                                            .image,
                                        color: SolidColors.seeMore,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Obx(
                                          () => Text(
                                              controller.podcastsFileList[index]
                                                  .title!,
                                              style: controller.currentFileIndex
                                                          .value ==
                                                      index
                                                  ? textTheme.bodyMedium
                                                  : textTheme.bodySmall),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                      "${controller.podcastsFileList[index].length!}:00"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 8,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height / 7,
                decoration: Decorations.mainGradiant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () => ProgressBar(
                          timeLabelTextStyle:
                              const TextStyle(color: Colors.white),
                          thumbColor: Colors.yellow,
                          baseBarColor: Colors.white,
                          progressBarColor: Colors.orange,
                          buffered: controller.bufferedValue.value,
                          progress: controller.progressValue.value,
                          total: controller.player.duration ??
                              const Duration(seconds: 0),
                          onSeek: (position) async {
                            controller.player.seek(position);

                            if (controller.player.playing) {
                              controller.startProgress();
                            } else if (position <= const Duration(seconds: 0)) {
                              await controller.player.seekToNext();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                              
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToNext();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: const Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.player.playing
                                  ? controller.timer!.cancel()
                                  : controller.startProgress();

                              controller.player.playing
                                  ? controller.player.pause()
                                  : controller.player.play();

                              controller.playState.value =
                                  controller.player.playing;
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                            },
                            child: Obx(
                              () => Icon(
                                controller.playState.value
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_fill,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToPrevious();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.setLoopMode();
                              },
                              child: Icon(
                                Icons.repeat,
                                color: controller.isLoopAll.value
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
