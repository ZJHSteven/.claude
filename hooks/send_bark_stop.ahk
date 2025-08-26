#Requires AutoHotkey v2.0
; AutoHotkey 脚本：Claude Code 停止钩子通知
; 向 Bark 发送 Claude Code 工作完成的通知

; 设置 Bark 服务器和设备 ID
BarkURL := "https://api.day.app/XXqke9sukocpd3HAgVdcVN"
Title := "Claude Code 工作已完成"
Body := "您的 Claude Code 任务已经完成，请查看结果。"

; 构建完整的通知 URL
; URL 格式: https://api.day.app/{device_id}/{title}/{body}
NotificationURL := BarkURL . "/" . Title . "/" . Body

; 使用 WinHTTP 发送 GET 请求到 Bark API，避免调用浏览器
; 这样可以在后台静默发送通知，不会打开浏览器界面
try {
    ; v2.0 语法：创建 WinHTTP 请求对象
    http := ComObject("WinHttp.WinHttpRequest.5.1")
    
    ; 配置请求：GET 方法，目标URL，异步=false（同步请求）
    http.Open("GET", NotificationURL, false)
    
    ; 设置请求头（可选，但建议设置用户代理）
    http.SetRequestHeader("User-Agent", "Claude-Code-Hook/1.0")
    
    ; 发送请求（GET请求无需请求体）
    http.Send()
    
    ; 可选：检查响应状态（200表示成功）
    if (http.Status == 200) {
        ; 通知发送成功（可在此添加日志记录）
        ; 静默处理，不显示任何界面
    }
} catch Error as e {
    ; 发生错误时的处理（可在此添加错误日志）
    ; 静默处理错误，不显示弹窗
}

; 脚本执行完毕后自动退出
ExitApp()