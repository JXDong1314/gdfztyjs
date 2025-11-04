# 🚀 GitHub Pages 部署指南

## ✨ 为什么选择 GitHub Pages？

- ✅ **完全免费**：无任何费用
- ✅ **稳定可靠**：由 GitHub 提供，99.9% 在线率
- ✅ **免费域名**：`你的用户名.github.io`
- ✅ **支持HTTPS**：自动提供SSL证书
- ✅ **无限流量**：不限访问次数
- ✅ **全球CDN**：访问速度快
- ✅ **可绑定自定义域名**（可选）

---

## 📋 准备工作

1. **GitHub 账号**
   - 访问 https://github.com 注册（免费）
   - 验证邮箱

2. **Git 工具**（二选一）
   - **方式A**：安装 Git 命令行工具
     - 下载：https://git-scm.com/download/win
   - **方式B**：使用 GitHub Desktop（更简单）
     - 下载：https://desktop.github.com/

---

## 🚀 部署步骤（三种方法）

### 方法一：使用 GitHub 网页上传（最简单，推荐新手）

#### 1️⃣ 创建仓库

1. 登录 GitHub
2. 点击右上角 **+** → **New repository**
3. 填写信息：
   - **Repository name**: `quiz-system`（或其他名称）
   - **Description**: `通用技术刷题系统`
   - **Public**（必须选公开）
   - ✅ 勾选 **Add a README file**
4. 点击 **Create repository**

#### 2️⃣ 上传文件

1. 在仓库页面，点击 **Add file** → **Upload files**
2. 将以下文件和文件夹拖拽到上传区：
   ```
   index.html
   2021年A卷/
   2021年B卷/
   2022年A卷/
   2022年B卷/
   2023年A卷/
   2023年B卷/
   2024年A卷/
   2024年B卷/
   ```
3. 在底部填写提交信息：`初始上传`
4. 点击 **Commit changes**
5. 等待上传完成（可能需要几分钟）

#### 3️⃣ 开启 GitHub Pages

1. 在仓库页面，点击 **Settings**（设置）
2. 左侧菜单找到 **Pages**
3. 在 **Source** 部分：
   - Branch: 选择 **main**
   - Folder: 选择 **/ (root)**
4. 点击 **Save**
5. 等待几分钟，页面会显示：
   ```
   Your site is live at https://你的用户名.github.io/quiz-system/
   ```

#### 4️⃣ 访问网站

访问：`https://你的用户名.github.io/quiz-system/`

**注意**：首次发布可能需要等待 **5-10 分钟**

---

### 方法二：使用 Git 命令行（推荐熟悉命令行的用户）

#### 1️⃣ 安装 Git

下载并安装：https://git-scm.com/download/win

#### 2️⃣ 配置 Git

打开命令行（CMD或PowerShell），运行：

```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

#### 3️⃣ 创建仓库

1. 在 GitHub 网站创建新仓库（参考方法一）
2. **不要**添加 README、.gitignore 或 license
3. 记下仓库地址，如：
   ```
   https://github.com/你的用户名/quiz-system.git
   ```

#### 4️⃣ 推送代码

在项目文件夹中打开命令行，运行：

```bash
# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "初始提交"

# 关联远程仓库（替换成你的仓库地址）
git remote add origin https://github.com/你的用户名/quiz-system.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

#### 5️⃣ 开启 GitHub Pages

参考方法一的步骤 3️⃣

---

### 方法三：使用 GitHub Desktop（最简单的 Git 工具）

#### 1️⃣ 安装 GitHub Desktop

下载：https://desktop.github.com/

#### 2️⃣ 登录 GitHub

打开 GitHub Desktop，登录你的账号

#### 3️⃣ 创建仓库

1. 点击 **File** → **New repository**
2. 填写信息：
   - **Name**: `quiz-system`
   - **Local path**: 选择你的项目文件夹的**上一级目录**
   - ✅ 勾选 **Initialize this repository with a README**
3. 点击 **Create repository**

#### 4️⃣ 添加文件

1. 将所有项目文件复制到仓库文件夹
2. GitHub Desktop 会自动检测到文件变化
3. 在左下角填写提交信息：`初始提交`
4. 点击 **Commit to main**

#### 5️⃣ 推送到 GitHub

1. 点击 **Publish repository**
2. ✅ 确保取消勾选 **Keep this code private**（必须公开）
3. 点击 **Publish repository**

#### 6️⃣ 开启 GitHub Pages

参考方法一的步骤 3️⃣

---

## 📝 使用一键部署脚本

我已经为你准备了自动化脚本！

### 首次部署

双击运行：**`部署到GitHub.bat`**

脚本会自动：
1. 初始化 Git 仓库
2. 添加所有文件
3. 提交更改
4. 推送到 GitHub

---

## 🔄 更新内容

当你修改了试题或内容后：

### 方式A：使用脚本

双击运行：**`更新到GitHub.bat`**

### 方式B：使用命令行

```bash
git add .
git commit -m "更新内容"
git push
```

### 方式C：使用 GitHub Desktop

1. 打开 GitHub Desktop
2. 查看变更
3. 填写提交信息
4. 点击 **Commit to main**
5. 点击 **Push origin**

---

## 🌐 访问地址

部署成功后，你的网站地址：

```
https://你的GitHub用户名.github.io/仓库名/
```

例如：
```
https://zhangsan.github.io/quiz-system/
```

---

## 🎨 自定义域名（可选）

### 如果你有自己的域名

#### 1️⃣ 在 GitHub 配置

1. 仓库 → Settings → Pages
2. 在 **Custom domain** 输入你的域名
3. 点击 **Save**

#### 2️⃣ 配置 DNS

在域名服务商处添加记录：

**如果使用顶级域名**（如 quiz.com）：
```
类型: A
主机记录: @
记录值: 185.199.108.153
        185.199.109.153
        185.199.110.153
        185.199.111.153
```

**如果使用子域名**（如 quiz.yourdomain.com）：
```
类型: CNAME
主机记录: quiz
记录值: 你的用户名.github.io
```

#### 3️⃣ 等待生效

DNS 解析需要 10 分钟到 24 小时

---

## 🔒 启用 HTTPS

1. 仓库 → Settings → Pages
2. ✅ 勾选 **Enforce HTTPS**
3. 保存

GitHub 会自动提供免费的 SSL 证书！

---

## 📊 文件大小限制

- 单个文件：< 100 MB
- 仓库总大小：建议 < 1 GB
- **你的项目约 100 MB，完全没问题！**

---

## ⚡ 访问速度优化

### 国内访问加速

GitHub Pages 在国内访问可能较慢，可以：

1. **使用 CDN 加速**（可选）
   - jsDelivr CDN
   - Cloudflare

2. **使用 Gitee Pages**（国内替代方案）
   - 访问：https://gitee.com
   - 导入 GitHub 仓库
   - 开启 Gitee Pages
   - 访问更快，但需要实名认证

---

## 🐛 常见问题

### Q1: 404 错误

**原因**：
- Pages 未开启
- 分支或文件夹选择错误
- 等待时间不够

**解决**：
1. 检查 Settings → Pages 是否已开启
2. 确认选择了正确的分支（main）
3. 等待 5-10 分钟

### Q2: 图片不显示

**原因**：路径问题

**解决**：
- 确保所有文件都已上传
- 检查图片路径是否正确
- 图片文件名不要有中文空格

### Q3: 样式丢失

**原因**：CSS 路径问题

**解决**：
- 使用相对路径
- 或使用绝对路径（带仓库名）

### Q4: 推送失败

**原因**：
- 未登录 GitHub
- 没有权限
- 网络问题

**解决**：
```bash
# 重新设置远程仓库
git remote set-url origin https://github.com/你的用户名/仓库名.git

# 使用 token 登录（如果需要）
# 在 GitHub 设置中生成 Personal Access Token
```

---

## 📞 获取帮助

- GitHub Pages 文档：https://docs.github.com/pages
- GitHub 中文社区：https://github.com/github
- Git 教程：https://git-scm.com/book/zh/v2

---

## ✅ 部署检查清单

- [ ] 已注册 GitHub 账号
- [ ] 已创建公开仓库
- [ ] 已上传所有文件
- [ ] index.html 在根目录
- [ ] 已开启 GitHub Pages
- [ ] 已等待 5-10 分钟
- [ ] 可以正常访问网站
- [ ] 所有功能正常

---

## 🎉 优势总结

| 特性 | 腾讯云 CloudBase | GitHub Pages |
|------|-----------------|--------------|
| 费用 | 有免费额度，超出收费 | **完全免费** ✅ |
| 域名 | 默认域名会过期 | **永久免费域名** ✅ |
| 稳定性 | 稳定 | **非常稳定** ✅ |
| 操作难度 | 中等 | **简单** ✅ |
| 访问速度 | 国内快 | 国外快，国内中等 |
| 流量限制 | 5GB/月 | **无限制** ✅ |
| 存储限制 | 5GB | 1GB（足够） |

---

**GitHub Pages 是最适合你的选择！完全免费，永久稳定！** 🎉

