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

; 使用系统浏览器发送 GET 请求到 Bark API
; 这会触发 Bark 应用推送通知到您的设备
; v2 语法：Run 函数需要括号，不需要 % 前缀
Run(NotificationURL)

; 脚本执行完毕后自动退出
ExitApp()