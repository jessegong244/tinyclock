//
//  HomeViewController.m
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/27.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (nonatomic,strong) NSTimer *myTimer;
@property (nonatomic,strong) NSDateFormatter *HHMMFormatter;
@property (nonatomic,strong) NSDateFormatter *SSFormatter;

@property (nonatomic,strong) UIImageView *bg_Img;
@property (nonatomic,strong) UIView *bg_V;

@property (nonatomic,strong) UILabel *HHMM_Lbl;
@property (nonatomic,strong) UILabel *SS_Lbl;

@end

@implementation HomeViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.HHMMFormatter = [[NSDateFormatter alloc] init];
        [self.HHMMFormatter setDateFormat:@"HH:mm"];
        self.SSFormatter = [[NSDateFormatter alloc] init];
        [self.SSFormatter setDateFormat:@":ss"];
        
        self.bgColor = UIColor.whiteColor;
        self.bgImg = [GwqUI imageWithColor:self.bgColor];
        self.myTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)updateTime{
    NSDate *currentDate = [NSDate date];
//    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
//    [dataFormatter setDateFormat:@"HH : mm : ss"];
//    [dataFormatter setDateFormat:@"YYYY - MM - dd   HH : mm : ss "];
//    NSString *dateString = [dataFormatter stringFromDate:currentDate];
    
    self.HHMM_Lbl.text = [self.HHMMFormatter stringFromDate:currentDate];
    self.SS_Lbl.text = [self.SSFormatter stringFromDate:currentDate];
//    SLog(@"%@",dateString);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self.myTimer fire];
}

- (void)createUI{
    [self.view addSubview:self.bg_Img];
    [self.bg_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:self.bg_V];
    [self.bg_V mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(SCREEN_H * 0.1);
        make.left.equalTo(self.view).offset(SCREEN_W * 0.1);
        make.right.equalTo(self.view).offset(-SCREEN_W * 0.1);
        make.bottom.equalTo(self.view).offset(-SCREEN_H * 0.1);
    }];
    
    [self.bg_V addSubview:self.HHMM_Lbl];
    [self.HHMM_Lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bg_V).offset(20);
        make.centerY.equalTo(self.bg_V);
        make.height.mas_equalTo(200);
    }];
    
    [self.bg_V addSubview:self.SS_Lbl];
    [self.SS_Lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.HHMM_Lbl.mas_right).offset(10);
        make.right.equalTo(self.bg_V).offset(-60);
        make.bottom.equalTo(self.HHMM_Lbl).offset(-20);
        make.height.mas_equalTo(100);
    }];
}

- (void)tapAction{
    CGFloat scale = 0;
    if (self.bg_V.width == SCREEN_W) {
        scale = 0.8;
    }else{
        scale = 1.25;
    }
    
    SLog(@"frame = %lf,%lf",self.bg_V.width,self.bg_V.height);
    [UIView animateWithDuration:0.3 animations:^{
        self.bg_V.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:^(BOOL finished) {
        SLog(@"frame = %lf,%lf",self.bg_V.width,self.bg_V.height);
    }];
}

- (UIView *)bg_V{
    if (!_bg_V) {
        _bg_V = [UIView new];
        _bg_V.backgroundColor = UIColor.blackColor;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_bg_V addGestureRecognizer:tap];
    }
    return _bg_V;
}

- (UIImageView *)bg_Img{
    if (!_bg_Img) {
        _bg_Img = [GwqUI CreateImg:CGRectZero name:@""];
        _bg_Img.image = self.bgImg;
    }
    return _bg_Img;
}

- (UILabel *)HHMM_Lbl{
    if (!_HHMM_Lbl) {
        _HHMM_Lbl = [GwqUI CreateLbl:CGRectZero font:DSFont(200) color:UIColor.greenColor text:@"22:20" align:NSTextAlignmentRight];
//        _HHMM_Lbl.backgroundColor = UIColor.redColor;
    }
    return _HHMM_Lbl;
}
- (UILabel *)SS_Lbl{
    if (!_SS_Lbl) {
        _SS_Lbl = [GwqUI CreateLbl:CGRectZero font:DSFont(100) color:UIColor.greenColor text:@":29" align:NSTextAlignmentLeft];
//        _SS_Lbl.backgroundColor = UIColor.cyanColor;
    }
    return _SS_Lbl;
}


@end
