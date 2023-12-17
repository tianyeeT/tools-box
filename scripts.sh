#!/bin/bash

# ANSI颜色码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 恢复默认颜色

# 获取机器版本信息
machine_version=$(uname -a)

# 获取CPU信息
cpu_info=$(cat /proc/cpuinfo | grep "model name" | uniq | cut -d ":" -f 2)

# 显示机器版本和CPU信息
echo "机器版本信息：$machine_version"
echo "CPU信息：$cpu_info"

while true; do
    echo -e "${GREEN}欢迎使用菜单${NC}"
    echo -e "${YELLOW}1. ${BLUE}安装Docker${NC}"
    echo -e "${YELLOW}2. ${BLUE}执行操作二${NC}"
    echo -e "${YELLOW}3. ${BLUE}执行操作三${NC}"
    echo -e "${YELLOW}4. ${RED}退出菜单${NC}"

    # 提示用户输入选项
    read -p "请输入选项数字: " choice

    # 根据用户选择执行相应操作
    case $choice in
        1)
            echo "您选择了安装Docker"
            if ! type "docker" > /dev/null; then sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
            sudo install -m 0755 -d /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
            sudo chmod a+r /etc/apt/keyrings/docker.gpg

            # Add the repository to Apt sources:
            echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
            $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
            sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io; else echo "Docker已经在该机器上安装";fi
            # 在此执行操作一的命令
            ;;
        2)
            echo "您选择了执行操作二"
            # 在此执行操作二的命令
            ;;
        3)
            echo "您选择了执行操作三"
            # 在此执行操作三的命令
            ;;
        4)
            echo -e "${RED}谢谢使用，再见！${NC}"
            exit 0 # 退出脚本
            ;;
        *)
            echo -e "${RED}无效选项，请重新输入${NC}"
            ;;
    esac
done
