import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _progressValue = 0.4;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Feedback',
          style: TextStyle(color: theme.colorScheme.foreground),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.foreground),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: theme.colorScheme.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Alert'),
            const SizedBox(height: 12),
            const ShadAlert(
              iconSrc: LucideIcons.terminal,
              title: Text('Heads up!'),
              description: Text(
                'You can add components to your app using the shadcn_ui package.',
              ),
            ),
            const SizedBox(height: 8),
            const ShadAlert.destructive(
              iconSrc: LucideIcons.circleAlert,
              title: Text('Error'),
              description: Text(
                'Your session has expired. Please log in again.',
              ),
            ),
            const SizedBox(height: 8),
            ShadAlert(
              iconSrc: LucideIcons.info,
              title: const Text('Note'),
              description: const Text(
                'This is an informational alert with a custom style.',
              ),
              backgroundColor: theme.colorScheme.secondary,
              border: Border.all(color: theme.colorScheme.border),
              foregroundColor: theme.colorScheme.secondaryForeground,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Toast / Sonner'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(
                  onPressed: () {
                    ShadToaster.of(context).show(
                      ShadToast(
                        title: const Text('Scheduled: Catch up'),
                        description: const Text(
                          'Friday, February 10, 2023 at 5:57 PM',
                        ),
                        action: ShadButton.outline(
                          size: ShadButtonSize.sm,
                          onPressed: () {},
                          child: const Text('Undo'),
                        ),
                      ),
                    );
                  },
                  child: const Text('Show Toast'),
                ),
                ShadButton.destructive(
                  onPressed: () {
                    ShadToaster.of(context).show(
                      const ShadToast.destructive(
                        title: Text('Uh oh! Something went wrong.'),
                        description: Text(
                          'There was a problem with your request.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Destructive Toast'),
                ),
                ShadButton.outline(
                  onPressed: () {
                    ShadToaster.of(context).show(
                      ShadToast(
                        title: const Text('Event created'),
                        description: const Text(
                          'Your event has been successfully created.',
                        ),
                        action: ShadButton.outline(
                          size: ShadButtonSize.sm,
                          onPressed: () {},
                          child: const Text('View'),
                        ),
                      ),
                    );
                  },
                  child: const Text('With Action'),
                ),
                ShadButton.secondary(
                  onPressed: () {
                    ShadToaster.of(context).show(
                      const ShadToast(
                        title: Text('Simple message'),
                      ),
                    );
                  },
                  child: const Text('Simple Toast'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Progress'),
            const SizedBox(height: 12),
            ShadProgress(value: _progressValue),
            const SizedBox(height: 8),
            Text(
              '${(_progressValue * 100).round()}%',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ShadButton.outline(
                  size: ShadButtonSize.sm,
                  onPressed: () => setState(() {
                    _progressValue = (_progressValue - 0.1).clamp(0.0, 1.0);
                  }),
                  child: const Text('-10%'),
                ),
                const SizedBox(width: 8),
                ShadButton.outline(
                  size: ShadButtonSize.sm,
                  onPressed: () => setState(() {
                    _progressValue = (_progressValue + 0.1).clamp(0.0, 1.0);
                  }),
                  child: const Text('+10%'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ShadProgress(value: 0.0),
            const SizedBox(height: 4),
            const ShadProgress(value: 0.25),
            const SizedBox(height: 4),
            const ShadProgress(value: 0.5),
            const SizedBox(height: 4),
            const ShadProgress(value: 0.75),
            const SizedBox(height: 4),
            const ShadProgress(value: 1.0),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Skeleton'),
            const SizedBox(height: 12),
            _buildSkeletonCard(context),
            const SizedBox(height: 16),
            _buildSkeletonList(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonCard(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadSkeleton(width: 48, height: 48),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShadSkeleton(height: 14, width: 200),
              const SizedBox(height: 8),
              ShadSkeleton(height: 12, width: MediaQuery.sizeOf(context).width - 120),
              const SizedBox(height: 4),
              const ShadSkeleton(height: 12, width: 150),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        3,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              const ShadSkeleton(width: 40, height: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShadSkeleton(
                      height: 12,
                      width: (i == 0 ? 180 : i == 1 ? 220 : 150).toDouble(),
                    ),
                    const SizedBox(height: 4),
                    const ShadSkeleton(height: 10, width: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = ShadTheme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.foreground,
      ),
    );
  }
}
