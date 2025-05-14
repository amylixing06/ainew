#!/bin/bash

# 确保脚本在出错时停止执行
set -e

# 显示执行的命令
set -x

# 创建临时目录
TEMP_DIR="deploy_temp"
mkdir -p $TEMP_DIR

# 复制所需文件到临时目录
cp bento_page_zh.html $TEMP_DIR/index.html
cp style_zh.css $TEMP_DIR/
cp -r icons $TEMP_DIR/
cp -r images $TEMP_DIR/

# 使用 rsync 上传文件到服务器
# 注意：需要替换 USER 和 SERVER 为实际的服务器信息
rsync -avz --delete $TEMP_DIR/ USER@SERVER:/path/to/i.ainew.cc/

# 清理临时目录
rm -rf $TEMP_DIR

echo "部署完成！" 