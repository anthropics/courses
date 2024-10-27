FROM ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest

# 最初にrootユーザーとして実行することを明示
USER root

# 日本語環境のセットアップ
RUN apt-get update && \
    apt-get install -y \
    language-pack-ja-base \
    language-pack-ja \
    locales \
    xclip && \
    locale-gen ja_JP.UTF-8 && \
    rm -rf /var/lib/apt/lists/*
# デフォルトユーザー（computeruse）の.bashrcに日本語設定を追加
USER computeruse
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc && \
    git config --global --add safe.directory /home/computeruse/courses

# システム全体のロケール設定
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8
