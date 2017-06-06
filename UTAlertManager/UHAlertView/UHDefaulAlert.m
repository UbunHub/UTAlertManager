//
//  UHDefaulAlert.m
//  Demo
//
//  Created by UbunTop on 16/9/8.
//  Copyright © 2016年 UbunTop. All rights reserved.
//

#import "UHDefaulAlert.h"

@interface UHDefaulAlert ()

@end

@implementation UHDefaulAlert

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadViewWith:(NSDictionary *)dic{
    [super reloadViewWith:dic];
    _messagelab.text = [dic objectForKey:@"message"];
    _alertTitle.text = [dic objectForKey:@"alertTitle"];
}

@end
