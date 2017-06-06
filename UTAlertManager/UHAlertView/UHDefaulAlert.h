//
//  UHDefaulAlert.h
//  Demo
//
//  Created by UbunTop on 16/9/8.
//  Copyright © 2016年 UbunTop. All rights reserved.
//

#import "UHAlertviewSuperVC.h"

@interface UHDefaulAlert : UHAlertviewSuperVC

@property (weak, nonatomic) IBOutlet UILabel *alertTitle;

@property (weak, nonatomic) IBOutlet UILabel *messagelab;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end
