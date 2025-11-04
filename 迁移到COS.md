# 迁移到腾讯云COS静态网站托管

由于CloudBase默认域名已过期，我们可以迁移到COS（对象存储），它提供更稳定的访问方式。

## 📋 准备工作

1. 腾讯云账号
2. 已实名认证
3. 安装了 Python（用于 COSCMD 工具）

---

## 🚀 部署步骤

### 第一步：创建COS存储桶

1. 访问 [COS控制台](https://console.cloud.tencent.com/cos)
2. 点击 **创建存储桶**
3. 填写信息：
   - **名称**：quiz-system（或其他名称）
   - **所属地域**：选择离你近的地域（如：广州）
   - **访问权限**：公有读私有写
   - 其他保持默认
4. 点击 **创建**

### 第二步：开启静态网站功能

1. 进入刚创建的存储桶
2. 左侧菜单选择 **基础配置** → **静态网站**
3. 点击 **编辑**
4. 开启静态网站：
   - **索引文档**：`index.html`
   - **错误文档**：`index.html`（可选）
   - **重定向规则**：留空
5. 点击 **保存**

### 第三步：上传文件

#### 方法A：使用控制台上传（简单）

1. 在存储桶中点击 **上传文件**
2. 选择所有文件和文件夹
3. 上传（保持目录结构）

#### 方法B：使用COSCMD上传（推荐，支持批量）

**安装 COSCMD**：
```cmd
pip install coscmd
```

**配置 COSCMD**：

1. 获取密钥：
   - 访问 https://console.cloud.tencent.com/cam/capi
   - 复制 `SecretId` 和 `SecretKey`

2. 配置：
```cmd
coscmd config -a <SecretId> -s <SecretKey> -b <存储桶名称-APPID> -r <地域>
```

示例：
```cmd
coscmd config -a AKIDxxxxxxxx -s xxxxxxxx -b quiz-system-1234567890 -r ap-guangzhou
```

**上传文件**：
```cmd
coscmd upload -r ./ /
```

### 第四步：访问网站

上传完成后，你可以通过以下地址访问：

**默认域名**（COS提供，永久有效）：
```
http://<存储桶名称-APPID>.cos-website.<地域>.myqcloud.com
```

例如：
```
http://quiz-system-1234567890.cos-website.ap-guangzhou.myqcloud.com
```

**或者使用CDN加速域名**：
```
https://<存储桶名称-APPID>.file.myqcloud.com/index.html
```

---

## 🔧 自动化部署脚本

创建 `部署到COS.bat`：

```batch
@echo off
chcp 65001 >nul

echo ================================
echo   部署到腾讯云COS
echo ================================
echo.

REM 请先配置 COSCMD
REM coscmd config -a <SecretId> -s <SecretKey> -b <Bucket> -r <Region>

echo 🚀 正在上传文件到COS...
echo.

coscmd upload -r ./ /

if errorlevel 1 (
    echo.
    echo ❌ 上传失败！
    echo.
    echo 💡 请先配置 COSCMD:
    echo    1. 访问 https://console.cloud.tencent.com/cam/capi 获取密钥
    echo    2. 运行: coscmd config -a SecretId -s SecretKey -b Bucket -r Region
    echo    3. 重新运行此脚本
    echo.
) else (
    echo.
    echo ================================
    echo ✅ 上传成功！
    echo ================================
    echo.
    echo 🌐 访问地址：
    echo    http://你的存储桶名称-APPID.cos-website.地域.myqcloud.com
    echo.
    echo 💡 提示：
    echo    - 可以在COS控制台查看详细的访问域名
    echo    - 建议绑定自定义域名或开启CDN加速
    echo.
)

echo 按任意键关闭窗口...
pause >nul
```

---

## 🌐 绑定自定义域名（可选）

### 1. 添加自定义域名

1. COS控制台 → 存储桶 → **域名与传输管理** → **自定义源站域名**
2. 点击 **添加域名**
3. 输入你的域名
4. 配置DNS解析（CNAME方式）

### 2. 开启HTTPS

1. 在自定义域名配置中
2. 上传SSL证书或使用腾讯云免费证书
3. 强制HTTPS

---

## 💰 费用说明

### COS免费额度（前6个月）

- 标准存储容量：50GB
- 外网下行流量：10GB/月
- 请求次数：100万次/月

**你的项目约100MB，流量适中，基本免费！**

### 超出免费额度后

- 标准存储：¥0.118/GB/月
- 外网下行流量：¥0.5/GB
- 请求费用：极低（几乎可忽略）

---

## 🔄 从CloudBase迁移到COS的优势

✅ **永久稳定的访问域名**（不会过期）
✅ **更低的费用**
✅ **更大的免费额度**
✅ **更快的访问速度**（可配CDN）
✅ **更简单的管理**

---

## 📞 获取帮助

- COS文档：https://cloud.tencent.com/document/product/436
- COSCMD工具：https://cloud.tencent.com/document/product/436/10976
- 静态网站托管：https://cloud.tencent.com/document/product/436/14984

---

**推荐使用COS方案，更稳定可靠！**

