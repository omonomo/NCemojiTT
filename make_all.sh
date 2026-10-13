#!/usr/bin/env bash
set -e

# ログをファイル出力させる場合は有効にする (<< "#LOG" をコメントアウトさせる)
<< "#LOG"
LOG_OUT=/tmp/NotoColorEmojiTT.log
LOG_ERR=/tmp/NotoColorEmojiTT_err.log
exec 1> >(tee -a $LOG_OUT)
exec 2> >(tee -a $LOG_ERR)
#LOG

# python build_Noto_color_emoji_font.py --clean

python build_noto_emoji_font.py --format glyf_colr_1 --family "NotoColorEmojiTT COLR"
python build_noto_emoji_font.py --format picosvg --family "NotoColorEmojiTT SVG"
python build_noto_emoji_font.py --format sbix --family "NotoColorEmojiTT sbix"
python build_noto_emoji_font.py --format cbdt --family "NotoColorEmojiTT CBDT"

python build_noto_emoji_font.py --format glyf_colr_1 --family "NotoColorEmojiTTTM COLR" --ambiguous
python build_noto_emoji_font.py --format picosvg --family "NotoColorEmojiTTTM SVG" --ambiguous
python build_noto_emoji_font.py --format sbix --family "NotoColorEmojiTTTM sbix" --ambiguous
python build_noto_emoji_font.py --format cbdt --family "NotoColorEmojiTTTM CBDT" --ambiguous

exit 0
