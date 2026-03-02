import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Edit Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Form(
              key: controller.profileFormKey,
              child: Column(
                children: [
                  _buildTextField(
                    label: "Username",
                    controller: controller.usernameController,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: "Email Address",
                    controller: controller.emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),

                  // Change Password Trigger
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.lock_reset, color: AppColor.primary),
                    title: const Text(
                      "Change Password",
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.primary),
                    ),
                    subtitle: const Text("Update your login credentials"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () => _showPasswordBottomSheet(context),
                  ),

                  const SizedBox(height: 40),

                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Sub-Widgets ---
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: controller.isLoading.value ? null : () => controller.updateUserInfo(),
          child: controller.isLoading.value
              ? const CircularProgressIndicator()
              : const Text("Save Changes"),
        ),
      ),
    );
  }

  // --- Change Password Bottom Sheet ---

  void _showPasswordBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: controller.passwordFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Change Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: controller.currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Current Password"),
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: controller.newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
                validator: (v) => v!.length < 6 ? "Minimum 6 characters" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Confirm New Password"),
                validator: (v) =>
                    v != controller.newPasswordController.text ? "Passwords don't match" : null,
              ),
              const SizedBox(height: 25),

              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isPasswordLoading.value
                        ? null
                        : () => controller.updatePassword(),
                    child: controller.isPasswordLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("Update Password"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
