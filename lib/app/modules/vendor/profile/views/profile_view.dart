import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Edit Profile'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.profileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Profile Info"),

                  _buildTextField(
                    label: "Username",
                    controller: controller.usernameController,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                    label: "Email Address",
                    controller: controller.emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 30),

                  _buildSubmitButton(),

                  const SizedBox(height: 30),

                  _sectionTitle("Security"),

                  _buildActionTile(
                    title: "Change Password",
                    subtitle: "Update your login credentials",
                    icon: Icons.lock_reset,
                    onTap: () => _showPasswordBottomSheet(context),
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Danger Zone"),

                  _buildActionTile(
                    title: "Delete Account",
                    subtitle: "Delete your account permanently",
                    icon: Icons.delete_outline,
                    color: Colors.red,
                    onTap: _confirmDeleteStep1,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // --- Sub-Widgets ---
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    String? hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText == null ? "Enter $label" : hintText,
            prefixIcon: icon != null ? Icon(icon) : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: controller.isLoading.value ? null : controller.updateUserInfo,
        child: controller.isLoading.value
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : const Text(
                "Save Changes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.buttonText,
                ),
              ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    Color color = AppColor.primary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, color: color),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: onTap,
      ),
    );
  }

  Widget _passwordField({
    required String label,
    required TextEditingController controller,
    TextEditingController? compareController,
    bool isConfirm = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter $label",
            prefixIcon: const Icon(Icons.lock_outline),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Required";
            }

            if (!isConfirm && value.length < 6) {
              return "Minimum 6 characters";
            }

            if (isConfirm && value != compareController?.text) {
              return "Passwords don't match";
            }

            return null;
          },
        ),
      ],
    );
  }

  // --- Change Password Bottom Sheet ---

  void _showPasswordBottomSheet(BuildContext context) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Form(
            key: controller.passwordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Drag Handle
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                /// 🔹 Title
                const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                /// 🔹 Current Password
                _passwordField(
                  label: "Current Password",
                  controller: controller.currentPasswordController,
                ),

                const SizedBox(height: 16),

                /// 🔹 New Password
                _passwordField(label: "New Password", controller: controller.newPasswordController),

                const SizedBox(height: 16),

                /// 🔹 Confirm Password
                _passwordField(
                  label: "Confirm New Password",
                  controller: controller.confirmPasswordController,
                  isConfirm: true,
                  compareController: controller.newPasswordController,
                ),

                const SizedBox(height: 30),

                /// 🔹 Submit Button
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: controller.isPasswordLoading.value
                          ? null
                          : () {
                              if (controller.passwordFormKey.currentState!.validate()) {
                                controller.updatePassword(
                                  controller.currentPasswordController.text,
                                  controller.newPasswordController.text,
                                );
                              }
                            },
                      child: controller.isPasswordLoading.value
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text(
                              "Update Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  /// Delete Account
  void _confirmDeleteStep1() {
    Get.defaultDialog(
      title: "Delete Account",
      middleText: "Are you sure you want to delete your account?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        Get.back(); // close first dialog
        _confirmDeleteStep2(); // go to second
      },
    );
  }

  void _confirmDeleteStep2() {
    Get.defaultDialog(
      title: "Final Confirmation",
      content: Column(
        children: [
          Text(
            "⚠️ This will permanently delete your account and all data. This action cannot be undone.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.error),
          ),
          SizedBox(height: 16),
          _buildTextField(
            label: "Type 'YES' to delete your account",
            hintText: 'Type \'YES\'',
            controller: controller.confirmAccountDeletionController,
          ),
        ],
      ),
      textCancel: "No",
      textConfirm: "Delete",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onCancel: () => controller.confirmAccountDeletionController.clear(),
      onConfirm: () async {
        final bool result = await controller.deleteAccount();

        if (result == true) {
          Get.put(VendorMenuController().logout());
        }
      },
    );
  }
}
