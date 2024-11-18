-- 设置 Neovide 的全局字体
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
 
-- 行间距
vim.opt.linespace = 0
 
-- 缩放比例
vim.g.neovide_scale_factor = 1.0
 
-- 文本伽马和对比度
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5
 
-- 顶部、底部、右侧、左侧的内边距
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
 
-- 窗口透明度（内容和标题栏统一）
vim.g.neovide_transparency = 0.8
 
-- 窗口模糊效果（仅限 macOS）
vim.g.neovide_window_blurred = true
 
-- 浮动窗口的模糊半径
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
 
-- 浮动窗口的阴影效果
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
 
-- 窗口透明度
vim.g.neovide_transparency = 0.8
vim.g.neovide_background_color = "#0C0C0C" .. alpha()
 
-- 显示边框（仅限 macOS）
vim.g.neovide_show_border = true
 
-- 位置动画时长
vim.g.neovide_position_animation_length = 0.15
 
-- 滚动动画时长
vim.g.neovide_scroll_animation_length = 0.3
 
-- 滚动时远端行数动画
vim.g.neovide_scroll_animation_far_lines = 1
 
-- 输入时隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = false
 
-- 下划线自动缩放
vim.g.neovide_underline_stroke_scale = 1.0
 
-- 主题设置
vim.g.neovide_theme = 'auto'
 
-- 刷新率
vim.g.neovide_refresh_rate = 60
 
-- 空闲时的刷新率
vim.g.neovide_refresh_rate_idle = 5
 
-- 强制重绘
vim.g.neovide_no_idle = true
 
-- 退出时确认
vim.g.neovide_confirm_quit = true
 
-- 退出时脱离连接
vim.g.neovide_detach_on_quit = 'always_quit'
 
-- 全屏模式
vim.g.neovide_fullscreen = true
 
-- 记住之前的窗口大小
vim.g.neovide_remember_window_size = true
 
-- 开启性能分析器
vim.g.neovide_profiler = false
 
-- macOS 选项键作为 Meta 键
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
 
-- 启用 IME 输入
vim.g.neovide_input_ime = true
 
-- 触控屏幕的死区
vim.g.neovide_touch_deadzone = 6.0
 
-- 触控屏幕的拖动超时时间
vim.g.neovide_touch_drag_timeout = 0.17
 
-- 光标动画时长
vim.g.neovide_cursor_animation_length = 0.13
 
-- 光标轨迹大小
vim.g.neovide_cursor_trail_size = 0.8
 
-- 光标抗锯齿
vim.g.neovide_cursor_antialiasing = true
 
-- 在插入模式中动画光标
vim.g.neovide_cursor_animate_in_insert_mode = true
 
-- 切换到命令行时动画光标
vim.g.neovide_cursor_animate_command_line = true
 
-- 未聚焦时光标轮廓宽度
vim.g.neovide_cursor_unfocused_outline_width = 0.125
 
-- 平滑光标闪烁动画
vim.g.neovide_cursor_smooth_blink = false
 
-- 光标粒子效果模式
vim.g.neovide_cursor_vfx_mode = "railgun" -- 可设置为 "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe", 或空字符串 ""
 
-- 粒子透明度
vim.g.neovide_cursor_vfx_opacity = 200.0
 
-- 粒子生命周期
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
 
-- 粒子密度
vim.g.neovide_cursor_vfx_particle_density = 7.0
 
-- 粒子速度
vim.g.neovide_cursor_vfx_particle_speed = 10.0
 
-- 粒子相位（仅适用于 railgun 模式）
vim.g.neovide_cursor_vfx_particle_phase = 1.5
 
-- 粒子卷曲（仅适用于 railgun 模式）
vim.g.neovide_cursor_vfx_particle_curl = 1.0
