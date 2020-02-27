//
//  HomeViewController.m
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/27.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic,strong) UILabel *HHMM_Lbl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    [self createUI];
    
}

- (void)createUI{
    [self.view addSubview:self.HHMM_Lbl];
    [self.HHMM_Lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UILabel *)HHMM_Lbl{
    if (!_HHMM_Lbl) {
        _HHMM_Lbl = [GwqUI CreateLbl:CGRectZero font:DDFont(64) color:UIColor.greenColor text:@"22:30" align:NSTextAlignmentCenter];
    }
    return _HHMM_Lbl;
}


@end
