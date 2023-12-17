#!/bin/bash

function show_submenu {
    while true; do
        # 显示操作一子菜单选项
        echo "-------------------------------------------"
        printf "%s\n" "|          操作一子菜单               |"
        echo "-------------------------------------------"
        printf "%s\n" "|  a. 安装Docker                     |"
        printf "%s\n" "|  b. 子菜单选项二                    |"
        printf "%s\n" "|  c. 返回上级菜单                    |"
        echo "-------------------------------------------"

        # 提示用户输入选项
        read -p "请输入操作一子菜单选项: " sub_choice

        # 根据用户选择执行相应操作
        case $sub_choice in
            a)
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
            b)
                echo "您选择了子菜单选项二"
                # 在此执行子菜单选项二的命令
                ;;
            c)
                echo "返回上级菜单..."
                break # 返回上级菜单
                ;;
            *)
                echo "无效选项，请重新输入"
                ;;
        esac
    done
}
