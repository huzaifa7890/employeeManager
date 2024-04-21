import 'package:employeemanager/constant/extension_constants.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/core/service/image_picker_service.dart';
import 'package:employeemanager/feature/auth/providers/auth_provider.dart';
import 'package:employeemanager/feature/auth/providers/image_provider.dart';
import 'package:employeemanager/feature/auth/providers/user_provider.dart';
import 'package:employeemanager/feature/home/home_screen.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:employeemanager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final overlayProvider = StateProvider((ref) => false);

class RegisterProfileAccountScreen extends ConsumerStatefulWidget {
  const RegisterProfileAccountScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterProfileAccountScreenState();
}

class _RegisterProfileAccountScreenState
    extends ConsumerState<RegisterProfileAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final pickedImage = ref.watch(imagePickerProvider);
    final userProfilePic = ref.watch(userProvider)?.profilePic;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //     padding: const EdgeInsets.only(top: 24),
              //     child: AppIconButton(
              //       onPressed: () {
              //         context.pop();
              //       },
              //       icon: Icons.arrow_back_ios,
              //     )),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Register your ',
                  style: theme.textTheme.displayLarge,
                  children: [
                    TextSpan(
                      text: 'Account 👇',
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 60,
                      minRadius: 60,
                      backgroundColor: AppColors.fieldGrey,
                      child: (userProfilePic != null)
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(userProfilePic),
                            )
                          : (pickedImage != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    pickedImage,
                                    height: 100,
                                    width: 100,
                                    scale: 1,
                                    filterQuality: FilterQuality.medium,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  AssetImages.personIcon,
                                  height: 55,
                                  width: 55,
                                  fit: BoxFit.contain,
                                ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.darkBlue),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            iconSize: 16,
                            color: AppColors.primary,
                            onPressed: () {
                              ref.read(overlayProvider.notifier).state = true;
                            },
                          ),
                        ),
                      ),
                    ),

                    /////// click me
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.darkBlue),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            iconSize: 16,
                            color: AppColors.primary,
                            onPressed: () async {
                              showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              final imagePickerService =
                                                  ImagePickerService();
                                              final mediaUrls =
                                                  await imagePickerService
                                                      .imagePicker(
                                                          ImageSource.camera);
                                              if (mediaUrls != null) {
                                                ref
                                                    .read(imagePickerProvider
                                                        .notifier)
                                                    .state = mediaUrls;
                                              }
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 327,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: AppColors
                                                        .textMessageBtnColor,
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Text(
                                                    "Take Photo",
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .textMessageBtnColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              height: 50,
                                              width: 327,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.image_outlined,
                                                    color: AppColors
                                                        .textMessageBtnColor,
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Text(
                                                    "Upload From Gallery",
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      color: AppColors
                                                          .textMessageBtnColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 40),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 327,
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 15),
                                                    Text(
                                                      "Cancel",
                                                      style: theme
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                        color: AppColors
                                                            .textMessageBtnColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              AppTextField(
                  textController: companyNameController,
                  height: 65,
                  validator: (value) {},
                  fillColor: AppColors.fieldGrey,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  hintText: 'Company Name',
                  hintStyle: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.fieldTextcolor),
                  lines: 1),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                  textController: fullNameController,
                  height: 65,
                  validator: (value) {},
                  fillColor: AppColors.fieldGrey,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintText: 'Full Name',
                  hintStyle: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.fieldTextcolor),
                  lines: 1),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                  textController: designationController,
                  height: 65,
                  validator: (value) {},
                  fillColor: AppColors.fieldGrey,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintText: 'Designation',
                  hintStyle: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.fieldTextcolor),
                  lines: 1),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                  textController: addressController,
                  height: 65,
                  validator: (value) {},
                  fillColor: AppColors.fieldGrey,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintText: 'Address',
                  hintStyle: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.fieldTextcolor),
                  lines: 1),
              const SizedBox(
                height: 50,
              ),

              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  final userId = ref.read(authProvider).user?.uid;
                  ref.read(authProvider.notifier).setEmployeeUser(
                        id: userId,
                        name: fullNameController.text,
                        currentAddress: addressController.text,
                        profilePic: pickedImage,
                        createdAt: DateTime.now(),
                      );
                  final response =
                      ref.read(authProvider.notifier).saveEmployeeUser();
                  response.then((response) {
                    if (response.errorMessage.isNotEmpty) {
                      return context.showSnackBar(response.errorMessage);
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) {
                          return const HomeScreen();
                        }),
                      ));
                    }
                  });
                  // }
                },
                child: Text(
                  'Register',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: AppColors.primary),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
