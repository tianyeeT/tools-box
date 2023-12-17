#!/bin/bash
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"

# ANSI颜色码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 恢复默认颜色

# 获取 Linux 发行版信息
linux_version=$(lsb_release -a 2>/dev/null || cat /etc/*release 2>/dev/null | head -n 1 || uname -a)

# 获取架构信息
architecture=$(uname -m)

# 获取CPU信息
cpu_info=$(cat /proc/cpuinfo | grep "model name" | uniq | cut -d ":" -f 2)

# 显示机器版本和CPU信息
echo "CPU信息：$cpu_info"
# 显示 Linux 发行版和架构信息
echo "Linux 发行版信息：$linux_version"
echo "架构信息：$architecture"

source install_menu.sh

while true; do
    echo "-------------------------------------------"
    printf "%s\n" "|          欢迎使用菜单                   |"
    echo "-------------------------------------------"
    echo -e "${YELLOW}1. ${BLUE}安装Docker${NC}"
    echo -e "${YELLOW}2. ${BLUE}执行操作二${NC}"
    echo -e "${YELLOW}3. ${BLUE}执行操作三${NC}"
    echo -e "${YELLOW}4. ${RED}退出菜单${NC}"
    echo "-------------------------------------------"
    # 提示用户输入选项
    read -p "请输入选项数字: " choice

    # 根据用户选择执行相应操作
    case $choice in
        1)
            echo "您选择了执行操作一"
            echo "进入操作一子菜单..."
            show_submenu # 调用子菜单函数
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
