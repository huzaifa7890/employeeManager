import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/constant/ui_constant.dart';
import 'package:employeemanager/core/service/image_picker_service.dart';
import 'package:employeemanager/feature/auth/providers/image_provider.dart';
import 'package:employeemanager/feature/auth/providers/user_provider.dart';
import 'package:employeemanager/feature/auth/screens/register_profile_screen.dart';
import 'package:employeemanager/feature/employee/add_employee/provider/add_employee_provider.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddEmployeeScreen extends ConsumerStatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends ConsumerState<AddEmployeeScreen> {
  TextEditingController cnicController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pickedImage = ref.watch(imagePickerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 60,
                        minRadius: 60,
                        backgroundColor:
                            AppColors.fieldGrey, // Placeholder color
                        child: (pickedImage != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  pickedImage,
                                  height: 70,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                AssetImages.personIcon,
                                height: 55,
                                width: 55,
                                fit: BoxFit.contain,
                              ),
                        // : (pickedImage != null)
                        //     ? ClipRRect(
                        //         borderRadius: BorderRadius.circular(100),
                        //         child: Image.file(
                        //           pickedImage,
                        //           height: 100,
                        //           width: 100,
                        //           scale: 1,
                        //           filterQuality: FilterQuality.medium,
                        //           fit: BoxFit.cover,
                        //         ),
                        //       )
                        //     : Image.asset(
                        //         AssetImages.personIcon,
                        //         height: 55,
                        //         width: 55,
                        //         fit: BoxFit.contain,
                        //       ),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
                                                  context.pop();
                                                }
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
                                              onTap: () async {
                                                final imagePickerService =
                                                    ImagePickerService();
                                                final mediaUrls =
                                                    await imagePickerService
                                                        .imagePicker(ImageSource
                                                            .gallery);

                                                ref
                                                    .read(imagePickerProvider
                                                        .notifier)
                                                    .state = mediaUrls;
                                                context.pop();
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
                                                  context.pop();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 327,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(width: 15),
                                                      Text(
                                                        "Cancel",
                                                        style: theme.textTheme
                                                            .bodyMedium
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
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: cnicController,
                          decoration: const InputDecoration(
                            labelText: 'CNIC',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: designationController,
                decoration: const InputDecoration(
                  labelText: 'Designation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: mobileNoController,
                decoration: const InputDecoration(
                  labelText: 'Mobile No',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: payController,
                decoration: const InputDecoration(
                  labelText: 'Pay',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: detailsController,
                decoration: const InputDecoration(
                  labelText: 'Details',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showLoaderDialog(
                    context,
                    true,
                    theme: theme,
                  );

                  final userId = ref.read(userProvider)?.id;

                  ref.read(addEmployeeProvider.notifier).addEmployee(
                        id: const Uuid().v1(),
                        userId: userId ?? '',
                        cnicId: cnicController.text,
                        fullName: fullNameController.text,
                        designation: designationController.text,
                        mobileNo: int.parse(mobileNoController.text),
                        pay: int.parse(mobileNoController.text),
                        address: addressController.text,
                        selectedImage: pickedImage,
                      );
                  final response =
                      ref.read(addEmployeeProvider.notifier).saveEmployee();
                  response.then((value) {
                    return showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        enableDrag: true,
                        backgroundColor: theme.colorScheme.primary,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        builder: (BuildContext context) {
                          return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text("data"));
                        });
                  });
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
