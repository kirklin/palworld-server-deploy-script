# palworld-server-deploy-script
# 幻兽帕鲁服务器一键部署脚本

这是一个方便快捷的一键部署脚本，旨在为幻兽帕鲁服务器的搭建提供便利。在使用之前，请确保你已经创建了一个名为 "steam" 的服务器账号。如果没有，请按照以下步骤创建：

1. 执行以下命令创建 "steam" 账号，并设置密码：

    ```bash
    sudo useradd -m steam
    sudo passwd steam
    ```

2. 为 "steam" 账号添加 sudo 权限，使其可以执行 sudo 命令：

    ```bash
    sudo echo "steam   ALL=(ALL:ALL) ALL" >> /etc/sudoers
    ```

    如果在执行 sudo 命令时仍然显示没有权限，可以使用 vim 编辑 `/etc/sudoers` 文件

    ```bash
    vim /etc/sudoers
    ```

    在文件中添加：`steam ALL=(ALL:ALL) ALL`

3. 切换到 "steam" 账号：

    ```bash
    sudo -u steam -s
    cd /home/steam
    ```

4. 下载执行部署脚本:
[install.sh](./install.sh)

远程安装指令：
 ```bash
    wget -O - https://github.com/kirklin/palworld-server-deploy-script/raw/main/install.sh | sh
 ```

## 注意事项

如果你使用云服务器，确保开放8211端口防火墙规则。这是游戏服务器通信所需的端口。

