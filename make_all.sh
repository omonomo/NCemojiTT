#!/usr/bin/env bash
set -e

# ログをファイル出力させる場合は有効にする (<< "#LOG" をコメントアウトさせる)
<< "#LOG"
LOG_OUT=/tmp/NCemojiTT.log
LOG_ERR=/tmp/NCemojiTT_err.log
exec 1> >(tee -a $LOG_OUT)
exec 2> >(tee -a $LOG_ERR)
#LOG

# python build_Noto_color_emoji_font.py --clean

python build_ncemoji_font.py --format glyf_colr_1 --family "NCemojiTT COLR"
python build_ncemoji_font.py --format picosvg --family "NCemojiTT SVG"
python build_ncemoji_font.py --format sbix --family "NCemojiTT sbix"
python build_ncemoji_font.py --format cbdt --family "NCemojiTT CBDT"

python build_ncemoji_font.py --format glyf_colr_1 --family "NCemojiTTTM COLR" --ambiguous
python build_ncemoji_font.py --format picosvg --family "NCemojiTTTM SVG" --ambiguous
python build_ncemoji_font.py --format sbix --family "NCemojiTTTM sbix" --ambiguous
python build_ncemoji_font.py --format cbdt --family "NCemojiTTTM CBDT" --ambiguous

exit 0
