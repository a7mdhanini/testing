import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/components/my_text_field.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/admin_crl/admin_create_crl.dart';

class AdminAddItemPage extends StatelessWidget {
  const AdminAddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Add Item',
        ),
      ),

      body: GetBuilder<AdminCreateCrl>(
        init: AdminCreateCrl(),
        builder: (createCrl) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                MyTextField(
                  width: Sizes.width(context) / 1.3,
                  hintText: 'Title',
                  onChanged: (newVal) {
                    createCrl.setTitle(newVal);
                  },
                  validator: (newVal) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  width: Sizes.width(context) / 1.3,
                  hintText: 'Description',
                  onChanged: (newVal) {
                    createCrl.setDescription(newVal);
                  },
                  validator: (newVal) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  width: Sizes.width(context) / 1.3,
                  hintText: 'Quintity',
                  onChanged: (newVal) {
                    createCrl.setQuintity(newVal);
                  },
                  validator: (newVal) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    createCrl.selectImage();
                  },
                  child: Visibility(
                    visible: createCrl.itemImage.path.isEmpty,
                    replacement: SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.file(createCrl.itemImage)),
                    child: Container(
                      width: 300,
                      height: 300,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(2, 2),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        'Add Image',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                createCrl.isLoading
                    ? LoadingAnimationWidget.beat(
                        color: AppColors.orange, size: 18)
                    : MyButton(
                        title: 'Add New Item',
                        onPressed: () {
                          createCrl.addItem(context);
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
