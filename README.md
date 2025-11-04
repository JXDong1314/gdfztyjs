# 通用技术刷题系统

> 广州市通用技术学业水平考试在线练习平台

## 🌟 项目简介

这是一个基于纯HTML/CSS/JavaScript开发的在线刷题系统，包含2021-2024年广州市通用技术学业水平考试A卷和B卷的全部试题，支持在线练习、自动评分、答案解析等功能。

### ✨ 主要功能

- ✅ **试卷选择**：2021-2024年共8套试卷
- ✅ **智能做题**：自动保存答题进度
- ✅ **即时反馈**：提交后立即显示正确答案和解析
- ✅ **成绩统计**：自动计算得分和正确率
- ✅ **图片查看**：支持图片放大查看
- ✅ **响应式设计**：支持PC和移动端访问
- ✅ **离线使用**：纯前端实现，无需后端

## 🚀 快速开始

### 方法一：本地运行

1. **克隆或下载项目**
   ```bash
   git clone <你的仓库地址>
   cd 通用技术刷题系统online
   ```

2. **运行本地服务器**
   
   使用 npm（推荐）：
   ```bash
   npm run dev
   ```
   
   或使用 Python：
   ```bash
   python -m http.server 8080
   ```
   
   或使用 PHP：
   ```bash
   php -S localhost:8080
   ```

3. **访问系统**
   
   打开浏览器访问：http://localhost:8080

### 方法二：部署到腾讯云

#### 快速部署（推荐）

1. **安装 Node.js**
   
   访问 https://nodejs.org/ 下载安装

2. **运行部署脚本**
   
   Windows 用户（PowerShell）：
   ```powershell
   .\deploy.ps1
   ```
   
   Windows 用户（CMD）：
   ```cmd
   deploy.bat
   ```
   
   Linux/Mac 用户：
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

3. **按提示操作**
   - 首次使用会自动安装 CloudBase CLI
   - 登录腾讯云账号
   - 输入环境 ID（在 [CloudBase控制台](https://console.cloud.tencent.com/tcb) 创建）
   - 确认部署

4. **访问网站**
   
   部署成功后，访问：`https://<你的环境ID>.tcloudbaseapp.com`

#### 手动部署

详细步骤请参考 [部署说明.md](部署说明.md)

## 📁 项目结构

```
通用技术刷题系统online/
├── index.html              # 主页面
├── 2021年A卷/              # 2021年A卷试题和图片
├── 2021年B卷/              # 2021年B卷试题和图片
├── 2022年A卷/              # 2022年A卷试题和图片
├── 2022年B卷/              # 2022年B卷试题和图片
├── 2023年A卷/              # 2023年A卷试题和图片
├── 2023年B卷/              # 2023年B卷试题和图片
├── 2024年A卷/              # 2024年A卷试题和图片
├── 2024年B卷/              # 2024年B卷试题和图片
├── package.json            # 项目配置
├── cloudbaserc.json        # CloudBase配置
├── deploy.sh               # Linux/Mac部署脚本
├── deploy.ps1              # Windows PowerShell部署脚本
├── deploy.bat              # Windows CMD部署脚本
├── .gitignore              # Git忽略配置
├── README.md               # 本文档
└── 部署说明.md             # 详细部署文档
```

## 🛠️ 技术栈

- **前端框架**：原生 JavaScript（无框架依赖）
- **Markdown解析**：Marked.js
- **代码高亮**：Highlight.js
- **样式**：原生 CSS3
- **部署平台**：腾讯云 CloudBase / COS / Serverless

## 📸 功能截图

*(可以添加你的系统截图)*

## 🔧 配置说明

### 环境变量

部署时需要设置以下环境变量：

```bash
ENV_ID=<你的CloudBase环境ID>
```

### CloudBase 配置

配置文件：`cloudbaserc.json`

```json
{
  "version": "2.0",
  "envId": "{{env.ENV_ID}}",
  "framework": {
    "name": "static",
    "plugins": {
      "client": {
        "inputs": {
          "buildCommand": "",
          "outputPath": "./",
          "cloudPath": "/"
        }
      }
    }
  }
}
```

## 💰 费用说明

### 腾讯云 CloudBase 免费额度

- 存储空间：5GB/月
- 流量：5GB/月
- 适合个人学习和小规模使用

超出免费额度后按量计费，详见：[CloudBase 定价](https://cloud.tencent.com/document/product/876/39095)

## 📝 使用说明

1. **选择试卷**：在首页选择要练习的年份和卷别
2. **开始答题**：点击选项选择答案
3. **提交答案**：完成后点击"提交答案"按钮
4. **查看结果**：系统自动显示得分、正确答案和解析
5. **重新练习**：可以重置答案重新练习

## 🔐 安全性

- ✅ 纯静态网站，无后端数据库
- ✅ 所有数据存储在前端，不涉及隐私
- ✅ 支持 HTTPS 加密传输
- ✅ 无需注册登录

## 🌐 浏览器支持

- Chrome (推荐)
- Firefox
- Safari
- Edge
- 移动端浏览器

## 📞 技术支持

- **腾讯云文档**：https://cloud.tencent.com/document/product/876
- **问题反馈**：提交 Issue
- **功能建议**：提交 Pull Request

## 🤝 贡献

欢迎提交问题和功能建议！

1. Fork 本项目
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## 📜 开源协议

本项目采用 MIT 协议，详见 [LICENSE](LICENSE) 文件。

## 📅 更新日志

### v1.0.0 (2025-11-04)

- ✅ 初始版本发布
- ✅ 包含 2021-2024 年全部试题
- ✅ 支持在线答题和自动评分
- ✅ 添加腾讯云部署支持
- ✅ 创建自动化部署脚本

## ⭐ Star History

如果这个项目对你有帮助，请给个 Star ⭐️ 支持一下！

## 📧 联系方式

如有问题或建议，欢迎联系！

---

**祝你学习进步！**

