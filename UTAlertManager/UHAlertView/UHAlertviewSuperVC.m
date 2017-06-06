//
//  UHAlertviewSuperVC.m
//  Pods
//
//  Created by UbunTop on 16/9/7.
//
//

#import "UHAlertviewSuperVC.h"

@interface UHAlertviewSuperVC ()

@end

@implementation UHAlertviewSuperVC
-(instancetype)init{
    if (self =[self initWithNibName:nil  bundle:nil]) {
       
    }
    return self;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        [self setHidesBottomBarWhenPushed:YES];
         [self.view setNeedsLayout];
    }
    return self;
}

-(void)reloadViewWith:(NSDictionary *)dic{
    
    _coniew.layer.cornerRadius = 12;
}

- (IBAction)alertClicked:(UIButton *)sender forEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:NO completion:^{
        if (_clickBlock) {
            _clickBlock(sender,self);
        }
    }];
}

@end
