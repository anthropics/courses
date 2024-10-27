#!/bin/bash

docker-compose down

# コンテナを起動
docker-compose up &

# 20秒待機（コンテナの起動を待つ）
sleep 20

# OSタイプに応じてブラウザを起動
case "$OSTYPE" in
    "msys"*|"cygwin"*|"win"*)
        # Windows
        if command -v start &> /dev/null; then
            start chrome http://localhost:8080
        else
            cmd.exe /c start http://localhost:8080
        fi
        ;;
    "darwin"*)
        # macOS
        open -a "Google Chrome" http://localhost:8080
        ;;
    "linux-gnu"*)
        # Linux or WSL
        if grep -q Microsoft /proc/version; then
            # WSL環境
            cmd.exe /c start http://localhost:8080
        else
            # 通常のLinux
            if command -v google-chrome &> /dev/null; then
                google-chrome http://localhost:8080
            elif command -v chrome &> /dev/null; then
                chrome http://localhost:8080
            elif command -v chromium &> /dev/null; then
                chromium http://localhost:8080
            else
                xdg-open http://localhost:8080
            fi
        fi
        ;;
esac
