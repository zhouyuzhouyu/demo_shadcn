import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  static const _fontFallback = ['PingFang SC', '.PingFang SC', 'Heiti SC'];

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final fg = theme.colorScheme.foreground;
    final muted = theme.colorScheme.mutedForeground;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '排版 / Typography',
          style: TextStyle(color: fg, fontFamilyFallback: _fontFallback),
        ),
        iconTheme: IconThemeData(color: fg),
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
            // ── 研听排版角色 ──────────────────────────────────────────
            _buildSectionTitle(context, '研听 排版角色 / App Typography Roles'),
            const SizedBox(height: 4),
            Text(
              '验证：中文苹方回退 · letter-spacing 0 · 正文行高 1.6 · 等宽数字',
              style: TextStyle(
                fontSize: 12,
                color: muted,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            const SizedBox(height: 20),

            _buildRoleRow(
              context,
              label: 'App 大标题',
              spec: '34 / 800',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                height: 1.2,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: '区块标题',
              spec: '22 / 700',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.3,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: '卡片标题',
              spec: '19 / 620→600',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                height: 1.35,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: '列表项标题',
              spec: '16.5 / 600',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                height: 1.4,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: '正文 / 摘要',
              spec: '15 / 400 · 行高 1.6',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.6,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
              multiline: true,
            ),
            _buildRoleRow(
              context,
              label: '次要 / Meta',
              spec: '13 / 400 · muted',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.0,
                color: muted,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: 'Chip',
              spec: '15 / 500',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.4,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            _buildRoleRow(
              context,
              label: 'Badge',
              spec: '12 / 500',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.3,
                letterSpacing: 0.0,
                color: fg,
                fontFamilyFallback: _fontFallback,
              ),
            ),

            // ── 等宽数字 ─────────────────────────────────────────────
            const SizedBox(height: 32),
            _buildSectionTitle(context, '等宽数字 / Tabular Numbers'),
            const SizedBox(height: 4),
            Text(
              '中英数混排时数字需等宽对齐（tnum），全部走 DM Sans',
              style: TextStyle(
                fontSize: 12,
                color: muted,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            const SizedBox(height: 12),
            _buildTabularNumsDemo(context),

            // ── shadcn_ui TextTheme 参考 ──────────────────────────────
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'shadcn_ui TextTheme 参考'),
            const SizedBox(height: 4),
            Text(
              '每个 shadcn 角色附中文对比行，验证苹方回退是否生效',
              style: TextStyle(
                fontSize: 12,
                color: muted,
                fontFamilyFallback: _fontFallback,
              ),
            ),
            const SizedBox(height: 16),
            _buildShadcnTextTheme(context),

            // ── Color Palette ─────────────────────────────────────────
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

  // Each design-spec role: 3 sample lines (pure Chinese, mixed, tabular-nums)
  Widget _buildRoleRow(
    BuildContext context, {
    required String label,
    required String spec,
    required TextStyle style,
    bool multiline = false,
  }) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.mutedForeground,
                  fontFamilyFallback: _fontFallback,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                spec,
                style: TextStyle(
                  fontSize: 11,
                  color: theme.colorScheme.mutedForeground,
                  fontFamilyFallback: _fontFallback,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // 纯中文 / 多行正文
          if (multiline)
            Text(
              '研听专注全球机构研报的中文解读。我们精选高盛、摩根士丹利、中金等顶级机构报告，'
              '以中文呈现核心洞察。',
              style: style,
            )
          else
            Text('研听 · 全球机构研报', style: style),
          const SizedBox(height: 2),
          // 中英混排
          Text('研听 · 全球机构研报中文解读 Report 2026', style: style),
          const SizedBox(height: 2),
          // 中英数混排，开 tabular-nums
          Text(
            '研听 · 机构研报 2026-06 · No.1024',
            style: style.copyWith(
              fontFeatures: [const FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 12),
          Container(height: 1, color: theme.colorScheme.border),
        ],
      ),
    );
  }

  Widget _buildTabularNumsDemo(BuildContext context) {
    final theme = ShadTheme.of(context);
    final fg = theme.colorScheme.foreground;
    final muted = theme.colorScheme.mutedForeground;

    final dataStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.8,
      letterSpacing: 0,
      color: fg,
      fontFamilyFallback: _fontFallback,
      fontFeatures: [const FontFeature.tabularFigures()],
    );
    final headerStyle = dataStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: muted,
    );

    final rows = [
      ('研报序号', '发布年份', '阅读量'),
      ('No.1024', '2026', '12,345'),
      ('No.0099', '2025', '9,876'),
      ('No.0003', '2024', '1,234'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < rows.length; i++) ...[
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  rows[i].$1,
                  style: i == 0 ? headerStyle : dataStyle,
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  rows[i].$2,
                  style: i == 0 ? headerStyle : dataStyle,
                ),
              ),
              Text(rows[i].$3, style: i == 0 ? headerStyle : dataStyle),
            ],
          ),
          if (i == 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Container(height: 1, color: theme.colorScheme.border),
            ),
        ],
      ],
    );
  }

  Widget _buildShadcnTextTheme(BuildContext context) {
    final theme = ShadTheme.of(context);
    const mixed = '研听 · 全球机构研报中文解读 Report 2026';

    TextStyle withCjk(TextStyle s) =>
        s.copyWith(letterSpacing: 0.0, fontFamilyFallback: _fontFallback);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubLabel(context, 'h1'),
        Text(
          'Taxing Laughter: The Joke Tax Chronicles',
          style: theme.textTheme.h1,
        ),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.h1)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'h2'),
        Text('The People of the Kingdom', style: theme.textTheme.h2),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.h2)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'h3'),
        Text('The Joke Tax', style: theme.textTheme.h3),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.h3)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'h4'),
        Text('People stopped telling jokes', style: theme.textTheme.h4),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.h4)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'p'),
        Text(
          'The king, seeing how much happier his subjects were, '
          'realized the joke tax was a mistake.',
          style: theme.textTheme.p,
        ),
        const SizedBox(height: 2),
        Text(
          '研听专注全球机构研报的中文解读，以中文呈现核心洞察。$mixed',
          style: withCjk(theme.textTheme.p),
        ),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'lead'),
        Text(
          'A modal dialog that interrupts the user with important content.',
          style: theme.textTheme.lead,
        ),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.lead)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'large'),
        Text('Are you absolutely sure?', style: theme.textTheme.large),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.large)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'small'),
        Text('Email address', style: theme.textTheme.small),
        const SizedBox(height: 2),
        Text(mixed, style: withCjk(theme.textTheme.small)),
        const SizedBox(height: 16),

        _buildSubLabel(context, 'muted'),
        Text('Enter your email address.', style: theme.textTheme.muted),
        const SizedBox(height: 2),
        Text(
          '机构 · 2026-06-04 · meta 次要文本',
          style: withCjk(theme.textTheme.muted),
        ),
        const SizedBox(height: 16),

        // Blockquote
        _buildSubLabel(context, 'blockquote (p + italic)'),
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: theme.colorScheme.border, width: 2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"After all," he said, "everyone enjoys a good joke, '
                'so it\'s only fair that they pay for the privilege."',
                style: theme.textTheme.p.copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 4),
              Text(
                '「毕竟，」他说，「每个人都喜欢一个好笑话，所以收取一点费用也是合理的。」Report 2026',
                style: withCjk(
                  theme.textTheme.p.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // List
        _buildSubLabel(context, 'list'),
        _buildList(context, [
          'Tier A 解读：Goldman Sachs · 高盛 2026 年度展望',
          'Tier B 解读：Morgan Stanley · 摩根士丹利全球策略',
          'Tier C 解读：CICC · 中金公司 A 股年度报告',
        ]),
      ],
    );
  }

  Widget _buildSubLabel(BuildContext context, String label) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.mutedForeground,
          letterSpacing: 0.3,
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
              Expanded(
                child: Text(
                  item,
                  style: theme.textTheme.p.copyWith(
                    letterSpacing: 0.0,
                    fontFamilyFallback: _fontFallback,
                  ),
                ),
              ),
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
        fontFamilyFallback: _fontFallback,
      ),
    );
  }
}
