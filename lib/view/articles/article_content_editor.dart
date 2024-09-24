import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/articles/manage_article_controller.dart';

class ArticleContentEditor extends StatefulWidget {
  const ArticleContentEditor({super.key});

  @override
  State<ArticleContentEditor> createState() => _ArticleContentEditorState();
}

class _ArticleContentEditorState extends State<ArticleContentEditor> {
  final HtmlEditorController controller = HtmlEditorController();

  var manageArticleController = Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBar("نوشتن/ ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint:
                      "می‌توانید مقاله را اینجا بنویسید....",
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoModel.value.content!,

                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.update((val) {
                      val?.content = p0;
                    });
                    log(manageArticleController.articleInfoModel.value.content.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
