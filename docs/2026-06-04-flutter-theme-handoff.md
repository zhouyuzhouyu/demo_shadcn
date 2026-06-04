---
title: "研听 · Flutter theme 交接清单（客户端落地）"
slug: flutter-theme-handoff
type: design
status: approved
product: report-notebooklm
created: 2026-06-04
updated: 2026-06-04
author: "设计师"
---

# 研听 · Flutter `theme` 交接清单

> 给客户端按已确认的视觉基线落 Flutter 主题。以本目录的 `yanting-demo.html` 为视觉对照(像素级以 Demo 为准)。
> 技术前提:`shadcn_ui`(Flutter 版),preset `b3T395hfU`(Lime)。颜色用 oklch 记录,落地时转 sRGB(shadcn 生成器同时给 hex)。

## 0. 一句话基线

**shadcn_ui · Lime 主题 · DM Sans 字体 · Remix Icon · 圆角 0.45rem · iOS 390×844 机身**;品牌色只用 Lime,强调用浅薄荷 soft-tint,选中态用近黑,**不用深绿**。

---

## 1. 颜色 token → `ShadColorScheme`

| token | oklch | 用途 |
|---|---|---|
| background | `oklch(1 0 0)` | 页面/卡片底 |
| foreground | `oklch(0.145 0 0)` | 主文本 / 选中态填充 |
| card | `oklch(1 0 0)` | 卡片 |
| primary | `oklch(0.841 0.238 128.85)` | **Lime** 主色(按钮/听研报/solid badge) |
| primary-foreground | `oklch(0.405 0.101 131.063)` | primary 上的文字(深绿字) |
| secondary | `oklch(0.967 0.001 286.375)` | 浅灰底(chip/secondary badge/缩略图) |
| secondary-foreground | `oklch(0.21 0.006 285.885)` | secondary 上文字 |
| muted | `oklch(0.97 0 0)` | 极浅灰面 |
| muted-foreground | `oklch(0.556 0 0)` | 次要文本(机构·日期/摘要) |
| border / input | `oklch(0.922 0 0)` | 描边 |
| destructive | `oklch(0.577 0.245 27.325)` | 风险红(仅「风险」标 + 必要警示) |
| chart-2 | `oklch(0.768 0.233 130.85)` | 「数字」标左色条(绿) |

**衍生(本项目自定,非 shadcn 默认):**
| token | oklch | 用途 |
|---|---|---|
| brand-soft | `oklch(0.952 0.05 128)` | **强调 soft-tint** hero 底色 |
| brand-soft-border | `oklch(0.9 0.07 128)` | soft-tint hero 描边 |
| link | `oklch(0.5 0.14 252)` | 蓝色链接(查看原文页/官网) |

> 深绿 `brand-dark` 已弃用,界面不出现。

---

## 2. 字体 → `ShadTextTheme` + 排版刻度

- **字体栈**:`DM Sans`(拉丁/数字)→ 苹方 `PingFang SC`(中文)。即 fontFamily 设 DM Sans,fontFamilyFallback 加苹方/系统中文。
- **数字**:开 `tabular-nums`(等宽);全部走 DM Sans。
- **⚠️ 中文不要负字距**(`letter-spacing` 用 0;负值会挤中文)。
- **行高**:正文 1.6,标题 1.15–1.4。

| 角色 | size / weight | 例 |
|---|---|---|
| App 大标题 | 34 / 800 | 研听、研报、机构 |
| 区块标题 | 22 / 700 | 最新解读、该机构研报 |
| 卡片标题 | 19 / 620 | 研报卡标题 |
| 列表项标题 | 16.5 / 600 | 机构名、音频名 |
| 正文/摘要 | 15 / 400(行高 1.6) | one-liner、简介 |
| 次要/meta | 13 / 400 muted | 机构·日期 |
| chip | 15 / 500 | topic chip |
| badge | 12 / 500 | 研报解读、音频 |

---

## 3. 圆角 / 间距刻度

**圆角**(从单一 `--radius` 派生):
- base `0.45rem` ｜ sm = base−4px ｜ md = base−2px ｜ xl = base+4px
- 卡片 = **xl**;按钮/输入/筛选 = **md**;badge/小标 = **sm**;头像/播放键 = **圆形**;chip = **全 pill**。

**间距(关键常量)**:页面左右 `20`、卡片内边距 `18`、卡间距 `14`、区块间距 `30`。建议在 Flutter 收一组 spacing 常量统一引用。

---

## 4. 图标 → Remix Icon

- 全 App 用 **Remix Icon**;tab **选中 `-fill` / 未选 `-line`**,选中文字加深加粗。
- tab:推荐 `star` · 研报 `article` · 机构 `bank` · 听单 `headphone` · 我的 `user-3`
- 常用:搜索 `search`、筛选 `equalizer`、`›` `arrow-right-s`、返回 `arrow-left-s`、播放 `play-fill`/暂停 `pause-fill`、收藏 `heart-3`、外跳 `external-link`、警示 `error-warning`。

---

## 5. 机身 / 安全区(390×844pt 基线)

- 状态栏(灵动岛区)`59` ｜ 顶部导航行 `44` ｜ 底 tab `56` ｜ 底部 Home 安全区 `24`。
- 大标题在顶部留「状态栏 + 导航行」≈ 103pt 起。Flutter 用 `MediaQuery.padding` 取真实安全区,以上为视觉对照值。

---

## 6. 组件映射(shadcn 优先,缺的才自定义)

| 用 shadcn_ui | 自定义(库里没有) |
|---|---|
| Card / Badge / Button / Input / Avatar / Table / Tabs / Sheet / Dialog / Separator / Progress / Slider | 音频播放器(详情整段 + 全局 mini)、时间线、结构图、信息图、关键数据图表、底部 5-tab(Material `NavigationBar` 套主题) |

> 约束:**只用 Flutter 版 shadcn 已有的组件**(web 版有的不代表 Flutter 有);未知/缺件优雅降级。

---

## 7. 关键视觉约定

- **强调** = 浅薄荷 soft-tint 卡(hero):`bg=brand-soft + 1px brand-soft-border`;不用深绿。
- **选中态** = 近黑(`foreground`)填充(如选中 chip)。
- **核心洞察三色** = 细边 + **左色条**:观点 `foreground`、数字 `chart-2`(绿)、风险 `destructive`(红);**非整块染色**。
- **机构头像** = 圆形真 logo(`cover` 铺满),取不到回退首字母;不用方块。
- **卡片** = 白底 + 1px 描边、**扁平无投影**。

---

## 8. 合规/产品口径(硬性,UI 不得违反)

- **无下载入口、无下载记录**(原文仅经来源外跳自取)。
- **游客可完整收听**第一期;登录不阻断。
- 研报详情 / 机构主页含「不构成投资建议」;来源/机构/发布时间可追溯。

---

## 9. 验收

逐屏对照 `yanting-demo.html`:推荐 / 研报 / 机构 / 听单 / 我的(游客态)+ 研报详情 + 机构主页 + 播放器交互。颜色/字号/圆角/图标/机身以本清单为准、像素以 Demo 为准。
