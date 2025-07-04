// import 'package:get/get.dart';

// class SettingsController extends GetxController {
//   // Profile form fields
//   final fullName = ''.obs;
//   final email = ''.obs;
//   final phoneNumber = ''.obs;

//   // Password form fields
//   final currentPassword = ''.obs;
//   final newPassword = ''.obs;
//   final confirmNewPassword = ''.obs;

//   // Notification settings
//   final emailNotifications = true.obs;
//   final pushNotifications = true.obs;

//   // Language settings
//   final selectedLanguage = 'English'.obs;

//   // Business profile fields (example)
//   final businessName = ''.obs;
//   final businessAddress = ''.obs;

//   // Payment methods (example: store selected payment method)
//   final selectedPaymentMethod = 'Credit Card'.obs;

//   // Initialize with default values or fetch from storage/API
//   @override
//   void onInit() {
//     super.onInit();
//     // Load profile data (replace with actual data source)
//     fullName.value = 'John Doe';
//     email.value = 'john.doe@example.com';
//     phoneNumber.value = '123-456-7890';
//     businessName.value = 'My Rental Business';
//     businessAddress.value = '123 Main St, City';
//   }

//   // Update profile
//   void updateProfile() {
//     if (fullName.value.isEmpty) {
//       Get.snackbar('Error', 'Full name is required');
//       return;
//     }
//     if (!GetUtils.isEmail(email.value)) {
//       Get.snackbar('Error', 'Invalid email format');
//       return;
//     }
//     if (!GetUtils.isPhoneNumber(phoneNumber.value)) {
//       Get.snackbar('Error', 'Invalid phone number');
//       return;
//     }
//     // Save to API or storage
//     Get.snackbar('Success', 'Profile updated successfully');
//     // Add API call or storage logic here
//   }

//   // Update password
//   void changePassword() {
//     if (currentPassword.value.isEmpty) {
//       Get.snackbar('Error', 'Current password is required');
//       return;
//     }
//     if (newPassword.value.isEmpty) {
//       Get.snackbar('Error', 'New password is required');
//       return;
//     }
//     if (newPassword.value != confirmNewPassword.value) {
//       Get.snackbar('Error', 'Passwords do not match');
//       return;
//     }
//     if (newPassword.value.length < 8) {
//       Get.snackbar('Error', 'Password must be at least 8 characters');
//       return;
//     }
//     // Save to API or storage
//     Get.snackbar('Success', 'Password changed successfully');
//     // Reset password fields for security
//     currentPassword.value = '';
//     newPassword.value = '';
//     confirmNewPassword.value = '';
//   }

//   // Update notification settings
//   void saveNotificationSettings() {
//     // Save to API or storage
//     Get.snackbar('Success', 'Notification settings saved');
//   }

//   // Update language
//   void saveLanguage() {
//     // Save to API or storage
//     Get.snackbar('Success', 'Language updated to ${selectedLanguage.value}');
//   }

//   // Update business profile
//   void updateBusinessProfile() {
//     if (businessName.value.isEmpty) {
//       Get.snackbar('Error', 'Business name is required');
//       return;
//     }
//     if (businessAddress.value.isEmpty) {
//       Get.snackbar('Error', 'Business address is required');
//       return;
//     }
//     // Save to API or storage
//     Get.snackbar('Success', 'Business profile updated successfully');
//   }

//   // Update payment method
//   void savePaymentMethod() {
//     // Save to API or storage
//     Get.snackbar('Success', 'Payment method updated to ${selectedPaymentMethod.value}');
//   }

//   // Submit contact support (example)
//   void submitContactSupport(String message) {
//     if (message.isEmpty) {
//       Get.snackbar('Error', 'Message is required');
//       return;
//     }
//     // Send to API or support system
//     Get.snackbar('Success', 'Support request submitted');
//   }
// }