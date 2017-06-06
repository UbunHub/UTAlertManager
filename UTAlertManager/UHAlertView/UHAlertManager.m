//
//  UHAlertManager.m
//  Pods
//
//  Created by UbunTop on 16/9/7.
//
//

#import "UHAlertManager.h"

#define dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

@implementation UHAlertManager

static NSMutableDictionary *alertDic = nil;

+(void)alertStyle:(NSString*)style
             info:(NSDictionary*)info
       Controller:(UIViewController*)controller
       clickBlock:(UHAlertClickBlock)clickBlock{
    
    dispatch_main_async_safe(^{
        
        if (!alertDic) {
            
            alertDic = [[NSMutableDictionary alloc]initWithCapacity:0];
        }
        if ([style isEqualToString:@"system"]) {
            
            NSString *message = [info objectForKey:@"message"];
            NSString *title = [info objectForKey:@"title"];
            NSMutableArray *butNameArr = [[NSMutableArray alloc]init];
            for (NSString *str in info.allKeys) {
                
                [butNameArr addObject:[info objectForKey:str]];
            }
            
            [UHAlertManager alertSysMessage:message
                                      title:title
                             preferredStyle:UIAlertControllerStyleAlert
                                 Controller:controller
                                 clickBlock:clickBlock
                                  buttonArr:butNameArr];
            
        }else{
            if (controller.presentingViewController) {
                
                [controller.presentingViewController dismissViewControllerAnimated:NO completion:nil];
            }
            
            UHAlertviewSuperVC *alertVC = [alertDic objectForKey:style];
            if (!alertVC) {
                
                alertVC = [[NSClassFromString(style) alloc] init];
                [alertDic setObject:alertVC forKey:style];
            }
            
            [alertVC reloadViewWith:info];
            alertVC.clickBlock = clickBlock;
            if (!controller.presentedViewController) {
                
                [alertVC setModalPresentationStyle:UIModalPresentationOverCurrentContext];
                [controller presentViewController:alertVC animated:NO completion:nil];
            }
        }
    });
}

//系统样式
+(void)alertSysMessage:(NSString*)msg
                 title:(NSString*)title
        preferredStyle:(UIAlertControllerStyle)preferredStyle
            Controller:(UIViewController*)controller
            clickBlock:(UHAlertClickBlock)clickBlock
             buttonArr:(NSArray*)butNameArr{
    
    dispatch_main_async_safe(^{
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ) {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:preferredStyle];
            for (NSString *str in butNameArr) {
                
                UIAlertAction *alertAction;
                alertAction = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    
                    if (clickBlock) clickBlock(action,alertController);
                }];
                [alertController addAction:alertAction];
            }
            [controller presentViewController:alertController animated:YES completion:nil];
        }else{
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            for (NSString *str in butNameArr) {
                
                [alertView addButtonWithTitle:str];
            }
            [alertView show];
        }
    });
}

//系统样式
+(void)alertSysMessage:(NSString*)msg
                 title:(NSString*)title
            Controller:(UIViewController*)controller
            clickBlock:(UHAlertClickBlock)clickBlock
                button:(NSString*)butTitle, ...{
    
    if (!msg) return;
    
    NSMutableArray *butNameArr = [[NSMutableArray alloc]init];
    [butNameArr addObject:butTitle];
    
    va_list args;
    va_start(args, butTitle);
    if (butTitle){
        
        NSString *otherString;
        while ((otherString = va_arg(args, NSString *))){
            
            [butNameArr addObject:otherString];
        }
    }
    va_end(args);
    
    [UHAlertManager alertSysMessage:msg title:title preferredStyle:UIAlertControllerStyleAlert Controller:controller clickBlock:clickBlock buttonArr:butNameArr];
}


+(void)alertSheetSysMessage:(NSString*)msg
                      title:(NSString*)title
                 Controller:(UIViewController*)controller
                 clickBlock:(UHAlertClickBlock)clickBlock
                     button:(NSString*)butTitle, ...{
    
    NSMutableArray *butNameArr = [[NSMutableArray alloc]init];
    [butNameArr addObject:butTitle];
    
    va_list args;
    va_start(args, butTitle);
    if (butTitle){
        
        NSString *otherString;
        while ((otherString = va_arg(args, NSString *))){
            
            [butNameArr addObject:otherString];
        }
    }
    va_end(args);
    
    [UHAlertManager alertSysMessage:msg
                              title:title
                     preferredStyle:UIAlertControllerStyleActionSheet
                         Controller:controller
                         clickBlock:clickBlock
                          buttonArr:butNameArr];
    
}

//默认样式
+(void)alertDefaul:(NSString*)msg
             title:(NSString*)title
        Controller:(UIViewController*)controller
        clickBlock:(UHAlertClickBlock)clickBlock
            button:(NSString*)butTitle, ...{
    
    NSMutableArray *butNameArr = [[NSMutableArray alloc]init];
    [butNameArr addObject:butTitle];
    
    va_list args;
    va_start(args, butTitle);
    if (butTitle){
        
        NSString *otherString;
        while ((otherString = va_arg(args, NSString *))){
            
            [butNameArr addObject:otherString];
        }
    }
    va_end(args);
    
    [UHAlertManager alertSysMessage:msg title:title preferredStyle:UIAlertControllerStyleAlert Controller:controller clickBlock:clickBlock buttonArr:butNameArr];
}


@end
