## Theme-builder in Windows.
## author: squaresum
## when using windows, execute this shell script to build theme package.
## this script is refactored from the makefile coded by halo-dev.

# 检测是否已经存在上次构建的结果，存在则删除
if (Test-Path -Path "dist") {
    Remove-Item -Path "dist" -Recurse -Force
}

if (Test-Path -Path "dist.zip") {
    Remove-Item -Path "dist.zip"
}

# 使用pnpm安装依赖  
pnpm install  

# 进行构建
pnpm build

# 创建dist文件夹  
New-Item -ItemType Directory -Path "dist" -Force  

# 复制必要文件到dist文件夹  
Copy-Item -Path "theme.yaml" -Destination "dist\"  
Copy-Item -Path "settings.yaml" -Destination "dist\"  
Copy-Item -Path "README.md" -Destination "dist\"  
Copy-Item -Path "templates" -Destination "dist\" -Recurse  

## 使用7z或者bandizip压缩dist文件夹为zip
# 由于powershell自带的Compress-Archive会引发奇怪的问题
# 可能是文件名编码问题所致，所以使用第三方压缩工具
# 检查 7z 是否可用  
function Test-7zAvailable {  
    try {  
        $7zResult = Get-Command 7z -ErrorAction Stop  
        return $true  
    }  
    catch {  
        return $false  
    }  
}  

# 检查 Bandizip 是否可用  
function Test-BandizipAvailable {  
    try {  
        $bandizipResult = Get-Command bandizip -ErrorAction Stop  
        return $true  
    }  
    catch {  
        return $false  
    }  
}

if ((Test-7zAvailable) -eq $true) {
    7z a "dist.zip" "dist\"
}
elseif ((Test-BandizipAvailable) -eq $true) {
    # https://cn.bandisoft.com/bandizip/help/parameter/
    # 经测试bandizip的压缩包可用于halo
    bandizip a "dist.zip" "dist\"
}
else {
    Write-Output "7z与bandizip均不存在，请安装其中一个。"
}


# 删除dist文件夹  
Remove-Item -Path "dist" -Recurse -Force