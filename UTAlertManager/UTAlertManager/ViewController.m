//
//  ViewController.m
//  UTAlertManager
//
//  Created by UbunGit on 2017/6/6.
//  Copyright © 2017年 UbunGit. All rights reserved.
//

#import "ViewController.h"
#import "UHAlertManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *dataTableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * CellIdentifier = @"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"系统样式";
            break;
        case 1:
            cell.textLabel.text = @"系统Sheet样式";
            break;
        case 2:
            cell.textLabel.text = @"默认样式";
            break;
        case 3:
            cell.textLabel.text = @"自定义样式";
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            [UHAlertManager alertSysMessage:@"alertSysMessage" title:@"SysMessage" Controller:self clickBlock:^(id sender, UIViewController *info) {
                ;
            } button:@"确认",@"取消",nil];
            break;
        case 1:
            [UHAlertManager alertSheetSysMessage:@"alertSheetSysMessage" title:@"SheetSysMessage" Controller:self clickBlock:^(id sender, UIViewController *info) {
                ;
            } button:@"确认",@"取消",nil];
            break;
        case 2:
            [UHAlertManager alertDefaul:@"alertDefaul" title:@"Defaul" Controller:self clickBlock:^(id sender, UIViewController *info) {
                ;
            } button:@"确认",@"取消",nil];
            break;
        case 3:{
            NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"Defaul",@"message",@"alertTitle",@"alertTitle", nil];
            [UHAlertManager alertStyle:@"UHDefaulAlert" info:dic Controller:self clickBlock:^(id sender, UIViewController *info) {
                ;
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
