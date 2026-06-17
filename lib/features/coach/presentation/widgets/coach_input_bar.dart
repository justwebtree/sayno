import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../theme/text_styles.dart';

/// Input bar at the bottom of the coach screen.
class CoachInputBar extends StatelessWidget {
  const CoachInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.md,
        right: AppSizes.md,
        top: AppSizes.sm,
        bottom: MediaQuery.paddingOf(context).bottom + AppSizes.sm,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.surfaceBorder, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md,
                vertical: AppSizes.sm + 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                border: Border.all(color: AppColors.surfaceBorder, width: 1),
              ),
              child: Text(
                AppStrings.coachPlaceholder,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.textPrimary,
              borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            ),
            child: const Icon(
              Icons.arrow_upward_rounded,
              color: AppColors.background,
              size: AppSizes.iconMd,
            ),
          ),
        ],
      ),
    );
  }
}
