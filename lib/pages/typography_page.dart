import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

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
          'Typography',
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
            _buildSectionTitle(context, 'Headings'),
            const SizedBox(height: 12),
            Text(
              'Taxing Laughter: The Joke Tax Chronicles',
              style: theme.textTheme.h1,
            ),
            const SizedBox(height: 8),
            Text('The People of the Kingdom', style: theme.textTheme.h2),
            const SizedBox(height: 8),
            Text('The Joke Tax', style: theme.textTheme.h3),
            const SizedBox(height: 8),
            Text('People stopped telling jokes', style: theme.textTheme.h4),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Paragraph'),
            const SizedBox(height: 12),
            Text(
              'The king, seeing how much happier his subjects were, '
              'realized the joke tax was a mistake. People would tell jokes '
              'and laugh, and it made everyone feel better.',
              style: theme.textTheme.p,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Lead'),
            const SizedBox(height: 12),
            Text(
              'A modal dialog that interrupts the user with important content '
              'and expects a response.',
              style: theme.textTheme.lead,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Large'),
            const SizedBox(height: 12),
            Text('Are you absolutely sure?', style: theme.textTheme.large),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Small'),
            const SizedBox(height: 12),
            Text('Email address', style: theme.textTheme.small),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Muted'),
            const SizedBox(height: 12),
            Text('Enter your email address.', style: theme.textTheme.muted),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Blockquote'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: theme.colorScheme.border, width: 2),
                ),
              ),
              child: Text(
                '"After all," he said, "everyone enjoys a good joke, '
                'so it\'s only fair that they pay for the privilege."',
                style: theme.textTheme.p.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Inline Code'),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'The ', style: theme.textTheme.p),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.muted,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'shadcn_ui',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          color: theme.colorScheme.foreground,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' package provides beautifully designed components.',
                    style: theme.textTheme.p,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'List'),
            const SizedBox(height: 12),
            _buildList(context, [
              '1st level of puns: 5 gold coins',
              '2nd level of jokes: 10 gold coins',
              '3rd level of one-liners: 20 gold coins',
            ]),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Color Palette'),
            const SizedBox(height: 12),
            _buildColorPalette(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<String> items) {
    final theme = ShadTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, right: 8),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.foreground,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(child: Text(item, style: theme.textTheme.p)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorPalette(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colors = [
      ('Background', theme.colorScheme.background),
      ('Foreground', theme.colorScheme.foreground),
      ('Primary', theme.colorScheme.primary),
      ('Primary FG', theme.colorScheme.primaryForeground),
      ('Secondary', theme.colorScheme.secondary),
      ('Secondary FG', theme.colorScheme.secondaryForeground),
      ('Muted', theme.colorScheme.muted),
      ('Muted FG', theme.colorScheme.mutedForeground),
      ('Accent', theme.colorScheme.accent),
      ('Destructive', theme.colorScheme.destructive),
      ('Border', theme.colorScheme.border),
      ('Input', theme.colorScheme.input),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colors.map((c) {
        final (name, color) = c;
        return Column(
          children: [
            Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: theme.colorScheme.border),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 60,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }).toList(),
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
