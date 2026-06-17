import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../theme/text_styles.dart';
import 'widgets/coach_input_bar.dart';
import 'widgets/coach_message_bubble.dart';

class CoachScreen extends StatelessWidget {
  const CoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.coachTitle, style: AppTextStyles.headlineSmall),
            Text(
              AppStrings.coachSubtitle,
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.md),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                size: AppSizes.iconSm,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.md),
              physics: const BouncingScrollPhysics(),
              children: const [
                CoachMessageBubble(
                  message:
                      'Welcome back. How are you managing your digital habits today?',
                  isCoach: true,
                  timestamp: '9:00 AM',
                ),
                SizedBox(height: AppSizes.sm),
                CoachMessageBubble(
                  message: 'I stayed within my limit yesterday.',
                  isCoach: false,
                  timestamp: '9:02 AM',
                ),
                SizedBox(height: AppSizes.sm),
                CoachMessageBubble(
                  message:
                      'That is a meaningful step. Consistency over time is what builds lasting discipline. Keep your streak going.',
                  isCoach: true,
                  timestamp: '9:02 AM',
                ),
                SizedBox(height: AppSizes.sm),
                _ComingSoonNotice(),
              ],
            ),
          ),
          const CoachInputBar(),
        ],
      ),
    );
  }
}

class _ComingSoonNotice extends StatelessWidget {
  const _ComingSoonNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.md),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.surfaceBorder, width: 1),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_outlined,
            size: AppSizes.iconXl,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            AppStrings.coachComingSoon,
            style: AppTextStyles.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            AppStrings.coachComingSoonSub,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
