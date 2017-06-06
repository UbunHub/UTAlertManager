UTAlertManager
===========
> UTAlertManager 结合系统样式与自定义样式。开发者可根据需要，调用不同样式的提示框。
 

 引用
-  
	
		#import "UHAlertManager.h"
 调用系统样式
- 

```
//系统样式
+(void)alertSysMessage:(NSString*)msg
                 title:(NSString*)title
            Controller:(UIViewController*)controller
            clickBlock:(UHAlertClickBlock)clickBlock
                button:(NSString*)butTitle, ...;
```
```
//系统Sheet样式
+(void)alertSheetSysMessage:(NSString*)msg
                 title:(NSString*)title
            Controller:(UIViewController*)controller
            clickBlock:(UHAlertClickBlock)clickBlock
                button:(NSString*)butTitle, ...;
```

 调用默认样式
-
> 默认样式实际为自定义UHDefaulAlert样式

```
//默认样式
+(void)alertDefaul:(NSString*)msg
             title:(NSString*)title
        Controller:(UIViewController*)controller
        clickBlock:(UHAlertClickBlock)clickBlock
            button:(NSString*)butTitle, ...;
```
 调用自定义样式
-
> 通过传入类名初始化样式，开发者可根据需求样式创建样式丰富的view，然后传入对应类与所需参数即可

```
/**
 * 显示AlertView
 * style 样式（就是类名）
 * conview 容器view
 * clickBlock
 */
+(void)alertStyle:(NSString*)style
             info:(NSDictionary*)info
       Controller:(UIViewController*)controller
       clickBlock:(UHAlertClickBlock)clickBlock;
```