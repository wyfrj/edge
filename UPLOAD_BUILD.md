# 上传与编译说明

## 1. 初始化 Git 仓库

```bash
cd F:\down\thorium-M150.0.7871.47_4\thorium-M150.0.7871.47
git init
git add .
git commit -m "Replace Thorium branding with Chromium"
```

## 2. 创建 GitHub 仓库

1. 登录 https://github.com
2. 点击右上角 "+" → New repository
3. 仓库名填写：`chromium-browser`（或自定义名称）
4. 选择 **Public** 或 **Private**
5. **不要**勾选 "Add a README file"
6. 点击 Create repository

## 3. 推送代码

```bash
git remote add origin https://github.com/你的用户名/仓库名.git
git branch -M main
git push -u origin main
```

## 4. 触发编译

### 方法一：GitHub Actions（云端编译）

1. 进入仓库 → **Actions** 标签
2. 点击 **Build Thorium for Windows**
3. 点击 **Run workflow**
4. 等待编译完成（约 6-10 小时）
5. 编译完成后在 **Artifacts** 下载

### 方法二：本地编译（推荐）

#### 前置条件
- Visual Studio 2022（含 C++ 桌面开发组件）
- Windows 11 SDK 10.1.22621.2428
- 至少 100GB 空闲磁盘空间

#### 步骤

```bash
# 1. 下载 depot_tools
# 访问 https://storage.googleapis.com/chrome-infra/depot_tools.zip
# 解压到 C:\src\depot_tools

# 2. 设置环境变量
# 将 C:\src\depot_tools 添加到 PATH
# 设置 DEPOT_TOOLS_WIN_TOOLCHAIN=0
# 设置 vs2022_install=C:\Program Files\Microsoft Visual Studio\2022\Community

# 3. 下载 Chromium 源码
mkdir C:\src\chromium
cd C:\src\chromium
fetch chromium

# 4. 复制 Thorium 文件
cd C:\src\chromium\src
xcopy /E /Y "F:\down\thorium-M150.0.7871.47_4\thorium-M150.0.7871.47\src\*" .

# 5. 配置构建
gn args out\thorium
# 粘贴 win_args.gn 内容

# 6. 编译
autoninja -C out\thorium chrome chromedriver mini_installer -j8
```

## 5. 编译产物位置

```
C:\src\chromium\src\out\thorium\
├── chrome.exe          # 主程序
├── mini_installer.exe  # 安装包
├── chromedriver.exe    # 测试工具
└── thorium_shell.exe   # Shell
```

## 6. 常见问题

### Q: 编译报错 "out of disk space"
A: Chromium 编译需要至少 100GB 空间，确保磁盘充足。

### Q: 编译超时
A: GitHub Actions 免费账户限制 6 小时/ job，建议使用本地编译或自托管 runner。

### Q: 如何设置自托管 runner？
A:
1. 在本地电脑下载 runner: https://github.com/用户名/仓库名/settings/actions/runners/new
2. 解压并运行 `config.cmd`
3. 将 workflow 中 `runs-on: windows-2022` 改为 `runs-on: self-hosted`
