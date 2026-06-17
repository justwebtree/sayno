import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/sayno_scaffold.dart';
import '../../../shared/widgets/sayno_section_header.dart';
import '../../../theme/text_styles.dart';
import '../../protection/application/protection_controller.dart';
import '../../protection/domain/protection_status.dart';
import 'widgets/daily_limit_card.dart';
import 'widgets/quick_stats_row.dart';
import 'widgets/status_banner.dart';
import 'widgets/streak_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final protectionStatus = ref.watch(protectionControllerProvider).when(
          data: (status) => status,
          error: (_, __) => ProtectionStatus.unknown,
          loading: () => ProtectionStatus.unknown,
        );

    return SayNOScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.lg),
          _DashboardHeader(),
          const SizedBox(height: AppSizes.lg),
          StatusBanner(status: protectionStatus),
          const SizedBox(height: AppSizes.md),
          const StreakCard(streakDays: 7),
          const SizedBox(height: AppSizes.md),
          const DailyLimitCard(usedMinutes: 42, limitMinutes: 120),
          const SizedBox(height: AppSizes.lg),
          const SayNOSectionHeader(title: 'Today'),
          const SizedBox(height: AppSizes.md),
          const QuickStatsRow(
            blockedToday: 3,
            sessionCount: 5,
            focusScore: 82,
          ),
          const SizedBox(height: AppSizes.lg),
          const SayNOSectionHeader(title: AppStrings.contractLabel),
          const SizedBox(height: AppSizes.md),
          _ContractPlaceholder(),
          const SizedBox(height: AppSizes.xxl),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning',
              style: AppTextStyles.bodyMedium.copyWith(
                color: const Color(0xFF9CA3AF),
              ),
            ),
            Text(AppStrings.dashboardTitle, style: AppTextStyles.headlineLarge),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(color: const Color(0xFF222222), width: 1),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: AppSizes.iconMd,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}

class _ContractPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: const Color(0xFF222222), width: 1),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.assignment_outlined,
            size: 32,
            color: Color(0xFF4B5563),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            AppStrings.noContract,
            style: AppTextStyles.bodyMedium.copyWith(
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
