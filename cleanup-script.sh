#!/bin/bash

echo "檢查系統類型中..."

OS_TYPE="$(uname)"
echo "系統偵測結果: $OS_TYPE"

if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "macOS 系統偵測成功，開始清除暫存檔..."

    # macOS 暫存清理
    rm -rf ~/Library/Caches/*
    rm -rf /Library/Caches/*
    rm -rf ~/Library/Logs/*
    rm -rf /Library/Logs/*
    rm -rf ~/.Trash/*

    # Xcode 清理
    if [ -d ~/Library/Developer/Xcode/DerivedData ]; then
      rm -rf ~/Library/Developer/Xcode/DerivedData/*
    fi

    # QuickLook Cache
    rm -rf ~/Library/Caches/com.apple.QuickLook.thumbnailcache

    # Safari/Chrome Cache
    rm -rf ~/Library/Caches/Google/Chrome/*
    rm -rf ~/Library/Caches/BraveSoftware/Brave-Browser/*
    rm -rf ~/Library/Caches/Microsoft\ Edge/*
    rm -rf ~/Library/Caches/com.apple.Safari/*
    
    # Find the ".DS_Store" and delete these files.
    find ~/ -name '.DS_Store' -type f -delete
    
    echo "macOS 清除完成！"

elif [[ "$OS_TYPE" == "Linux" ]]; then
    echo "Linux 系統偵測成功，開始清除暫存檔..."

    # Linux 暫存清理
    rm -rf ~/.cache/*
    rm -rf /var/cache/*
    rm -rf /var/tmp/*
    rm -rf ~/.local/share/Trash/*

    echo "Linux 清除完成！"

elif [[ "$OS_TYPE" == ""FreeBSD" || "$OS_TYPE" == "OpenBSD" || "$OS_TYPE" == "NetBSD" ]]; then
    echo "$OS_TYPE系統偵測成功，開始清除暫存檔..."

    # BSD 暫存清理
    rm -rf /var/tmp/*
    rm -rf /var/cache/*
    rm -rf ~/.cache/*

    echo "BSD 清除完成！"
else
    echo "無法辨識的系統類型：$OS_TYPE，無法自動清除暫存。"
fi
