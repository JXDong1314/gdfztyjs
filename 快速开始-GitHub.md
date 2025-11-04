# ⚡ GitHub Pages 快速开始（5分钟上线）

## 🎯 最简单的方法（网页上传，无需安装任何工具）

### Step 1: 注册 GitHub（2分钟）

1. 访问：https://github.com
2. 点击 **Sign up**
3. 填写信息注册（用户名、邮箱、密码）
4. 验证邮箱

### Step 2: 创建仓库（1分钟）

1. 登录后，点击右上角 **+** → **New repository**

2. 填写信息：
   - **Repository name**: `quiz-system`（任意名称）
   - **Description**: `通用技术刷题系统`
   - **Public**（必须选公开）✅
   - ✅ **勾选** Add a README file
   
3. 点击 **Create repository** ✅

### Step 3: 上传文件（2分钟）

1. 在仓库页面，点击 **Add file** → **Upload files**

2. 打开你的项目文件夹，**全选所有文件和文件夹**：
   ```
   Ctrl+A（全选）
   ```

3. **拖拽**到浏览器上传区

4. 等待上传进度条完成

5. 在底部 **Commit changes** 区域：
   - 填写：`初始上传`
   - 点击 **Commit changes** ✅

6. 等待上传完成（2-5分钟，取决于网速）

### Step 4: 开启 GitHub Pages（30秒）

1. 点击仓库顶部的 **⚙️ Settings**

2. 左侧菜单向下滚动，找到 **Pages**

3. 在 **Branch** 部分：
   - 选择：**main** ✅
   - 选择：**/ (root)** ✅
   - 点击 **Save** ✅

4. 页面刷新后，会显示：
   ```
   ✅ Your site is live at https://你的用户名.github.io/quiz-system/
   ```

### Step 5: 访问网站（5-10分钟后）

复制上面的网址，在浏览器打开！

**注意**：首次发布需要等待 **5-10 分钟** 才能访问

---

## 🎉 完成！

你的网站地址：
```
https://你的GitHub用户名.github.io/quiz-system/
```

例如，如果你的用户名是 `zhangsan`，地址就是：
```
https://zhangsan.github.io/quiz-system/
```

---

## 🔄 如何更新内容？

### 方法1：网页上传（最简单）

1. 在仓库页面，进入要更新的文件夹
2. 点击 **Add file** → **Upload files**
3. 上传新文件（会覆盖同名文件）
4. 提交更改

### 方法2：直接编辑文件

1. 点击要编辑的文件（如 index.html）
2. 点击 ✏️ 编辑按钮
3. 修改内容
4. 点击 **Commit changes**

### 方法3：使用 Git 工具

参考 `GitHub Pages 部署指南.md`

---

## 💡 常见问题

### Q: 404 错误？

**等待时间不够**
- 首次部署需要 5-10 分钟
- 刷新几次试试

**Pages 未开启**
- 检查 Settings → Pages 是否已设置

### Q: 图片不显示？

**文件未上传**
- 确认所有文件夹都上传了
- 检查图片文件是否在正确位置

**中文路径问题**
- GitHub 支持中文文件名
- 但建议文件夹名用英文

### Q: 访问速度慢？

**国内访问 GitHub 可能较慢**

解决方法：
1. 等待完全加载（首次较慢）
2. 使用 Gitee Pages（国内替代）
3. 绑定 CDN 加速

---

## 🚀 进阶操作

### 绑定自定义域名

1. 购买域名（如 quiz.com）
2. Settings → Pages → Custom domain
3. 输入域名并保存
4. 在域名商处配置 DNS

### 使用 Git 工具

1. 安装 Git 或 GitHub Desktop
2. 运行 `部署到GitHub.bat`
3. 享受更强大的版本控制

---

## 📊 对比其他方案

| 特性 | GitHub Pages | 腾讯云 | Vercel |
|------|-------------|--------|--------|
| 费用 | 完全免费 ✅ | 有限免费 | 免费 |
| 域名 | 免费永久 ✅ | 会过期 ❌ | 免费 |
| 操作难度 | 非常简单 ✅ | 中等 | 简单 |
| 国内速度 | 中等 | 快 ✅ | 慢 |
| 稳定性 | 非常稳定 ✅ | 稳定 | 稳定 |

---

## ✅ 检查清单

- [ ] 已注册 GitHub 账号
- [ ] 已创建公开仓库
- [ ] 已上传所有文件（包括 index.html）
- [ ] 已开启 GitHub Pages（Settings → Pages）
- [ ] 已等待 5-10 分钟
- [ ] 可以访问网站
- [ ] 所有试题都能正常显示

---

**就是这么简单！完全免费，永久使用！** 🎉

有问题？查看详细文档：`GitHub Pages 部署指南.md`

