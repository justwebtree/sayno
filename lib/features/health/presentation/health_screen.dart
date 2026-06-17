import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/sayno_card.dart';
import '../../../shared/widgets/sayno_scaffold.dart';
import '../../../shared/widgets/sayno_section_header.dart';
import '../../../theme/text_styles.dart';
import 'widgets/app_usage_tile.dart';
import 'widgets/usage_chart.dart';
import 'widgets/weekly_summary_card.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SayNOScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.lg),
          Text(AppStrings.healthTitle, style: AppTextStyles.headlineLarge),
          const SizedBox(height: AppSizes.xs),
          Text(
            'Your digital usage at a glance.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          const WeeklySummaryCard(
            totalHours: 14.5,
            dailyAvgMinutes: 124,
            bestDayLabel: 'Wednesday',
            improvementPercent: 18,
          ),
          const SizedBox(height: AppSizes.md),
          const UsageChart(
            weeklyData: [95, 140, 60, 110, 130, 80, 42],
          ),
          const SizedBox(height: AppSizes.lg),
          const SayNOSectionHeader(title: AppStrings.appUsage),
          const SizedBox(height: AppSizes.md),
          SayNOCard(
            child: Column(
              children: [
                const AppUsageTile(
                  appName: 'Instagram',
                  usedMinutes: 38,
                  limitMinutes: 60,
                  icon: Icons.photo_camera_outlined,
                ),
                const Divider(),
                const AppUsageTile(
                  appName: 'YouTube',
                  usedMinutes: 55,
                  limitMinutes: 60,
                  icon: Icons.play_circle_outline_rounded,
                ),
                const Divider(),
                const AppUsageTile(
                  appName: 'Twitter',
                  usedMinutes: 20,
                  limitMinutes: 45,
                  icon: Icons.alternate_email_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.xxl),
        ],
      ),
    );
  }
}
