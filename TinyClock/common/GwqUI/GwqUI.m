//
//  GwqUI.m
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/27.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#import "GwqUI.h"
#import <SVProgressHUD.h>

@implementation GwqUI

//label
+(UILabel *)CreateLbl:(CGRect)frame font:(UIFont *)font color:(UIColor *)color text:(NSString *)text align:(NSTextAlignment)align{
    UILabel *lbl = [[UILabel alloc]initWithFrame:frame];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = text;
    lbl.font = font;
    lbl.textColor = color;
    lbl.textAlignment = align;
    return lbl;
}

+(void)AddLabel:(CGRect)frame font:(UIFont *)font color:(UIColor *)color text:(NSString *)text align:(NSTextAlignment)align in:(UIView *)view{
    UILabel *lbl = [GwqUI CreateLbl:frame font:font color:color text:text align:align];
    [view addSubview:lbl];
}


//button
+(UIButton *)CreateButton:(CGRect)frame title:(NSString *)title font:(UIFont *)font tag:(NSInteger)tag selector:(SEL)selector type:(ANYI_BUTTON_TYPE)type response:(id)response{
    UIButton *bt = [[UIButton alloc]initWithFrame:frame];
    bt.clipsToBounds = YES;
    [bt setTitle:title forState:UIControlStateNormal];
    bt.titleLabel.font = font;
    bt.tag = tag;
    [bt setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    if (selector) {
        [bt addTarget:response action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (type == ANYI_BUTTON_TYPE_GREEN) {
        bt.layer.cornerRadius = 5;
        [bt setBackgroundImage:[UIImage imageNamed:@"btn_green_nor"] forState:UIControlStateNormal];
        [bt setBackgroundImage:[UIImage imageNamed:@"btn_green_pre"] forState:UIControlStateHighlighted];
        [bt setBackgroundImage:[UIImage imageNamed:@"绿色按钮_禁用"] forState:UIControlStateDisabled];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (type == ANYI_BUTTON_TYPE_BLUE) {
        bt.layer.cornerRadius = 3;
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bt setBackgroundImage:[GwqUI imageWithColor:MAIN_FONT_COLOR] forState:UIControlStateNormal];
    }else if (type == ANYI_BUTTON_TYPE_WHITE) {
        [bt setBackgroundImage:[UIImage imageNamed:@"btbg_normal"] forState:UIControlStateNormal];
        [bt setBackgroundImage:[UIImage imageNamed:@"btbg_pressed"] forState:UIControlStateHighlighted];
    }else if (type == ANYI_BUTTON_TYPE_ORANGE) {
        bt.layer.cornerRadius = 3;
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bt setBackgroundImage:[GwqUI imageWithColor:THEME_TINY_COLOR] forState:UIControlStateNormal];
    }else if (type == ANYI_BUTTON_TYPE_THEME){
        bt.layer.cornerRadius = 3;
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bt setBackgroundImage:[GwqUI imageWithColor:THEME_TINY_COLOR] forState:UIControlStateNormal];
    }
    return bt;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   return image;
}
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rct{
    CGRect rect = rct;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   return image;
}

//imageview
+(UIImageView *)CreateImg:(CGRect)frame name:(NSString *)name{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:frame];
    imgV.image = [UIImage imageNamed:name];
    return imgV;
}

+(void)AddImg:(CGRect)frame name:(NSString *)name in:(UIView *)view{
    UIImageView *imgV = [GwqUI CreateImg:frame name:name];
    [view addSubview:imgV];
}

//textfield
+(UITextField *)CreateTextField:(CGRect)frame font:(UIFont *)font color:(UIColor *)color align:(NSTextAlignment)align placeholder:(NSString *)placeholder isSecure:(BOOL)isSecure{
    UITextField *txtfield = [[UITextField alloc]initWithFrame:frame];
    txtfield.backgroundColor = [UIColor clearColor];
    txtfield.textColor = color;
    txtfield.textAlignment = align;
    txtfield.font = font;
    txtfield.placeholder = placeholder;
    txtfield.secureTextEntry = isSecure;
    [txtfield setReturnKeyType:UIReturnKeyDone];
    return txtfield;
}

//arrow
+(void)AddArrowIn:(UIView *)view x:(CGFloat)x y:(CGFloat)y{
    UIImageView * arrow = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 15, 15)];
    arrow.image = [UIImage imageNamed:@"ic_youjiantou"];
    [view addSubview:arrow];
}

//scroll
+(UIScrollView *)CreateScroll:(CGRect)frame{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:frame];
    scroll.backgroundColor = [UIColor clearColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    return scroll;
}

//table
+(UITableView *)CreateTable:(CGRect)frame target:(id)target{
    UITableView *table = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.delegate = target;
    table.dataSource = target;
    if (@available(iOS 11.0, *)) {
        table.estimatedRowHeight = 0;
        table.estimatedSectionHeaderHeight = 0;
        table.estimatedSectionFooterHeight = 0;
        table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    table.tableFooterView = [UIView new];
    return table;
}

//添加视图
+(void)AddViewIn:(UIView *)view frame:(CGRect)frame color:(UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    [view addSubview:line];
}

//底部带颜色视图
+(UIView *)CreateBottomView:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = UIColorFromRGB(0xf4f4f4);
    [GwqUI AddViewIn:view frame:CGRectMake(0, 0, view.width,LINE_VALUE) color:UIColorFromRGB(0xaaaaaa)];
    return view;
}
//line
+(void)addLineView:(CGRect)frame in:(UIView *)view{
    [self addLineView:frame in:view color:LINE_COLOR];
}
+ (void)addLineView:(CGRect)frame in:(UIView *)view color:(UIColor *)color{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    [view addSubview:line];
}
+ (UIView *)createLineView:(CGRect)frame{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = LINE_COLOR;
    return line;
}
//tableview 无数据空白页面
+(UIView *)GetNullFootView:(CGRect)frame title:(NSString *)title imgName:(NSString *)imgName{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = MAIN_BACKGROUND_COLOR;
    
    [GwqUI AddImg:CGRectMake((view.width -110)/2, (view.height-110)/2 - 40, 110, 110) name:imgName in:view];
    UILabel *tipLbl = [GwqUI CreateLbl:CGRectMake(10, (view.height-110)/2 - 40 + 110 + 10, view.width - 20, 40) font:Font(17) color:UIColorFromRGB(0xaaaaaa) text:title align:NSTextAlignmentCenter];
    tipLbl.numberOfLines = 2;
    tipLbl.adjustsFontSizeToFitWidth = YES;
    [view addSubview:tipLbl];
    return view;
}

//空视图
+(UIView *)GetNilView{
    return [[UIView alloc]initWithFrame:CGRectZero];
}
//获取最上层viewcontroller
+ (UIViewController *)getTopViewController{
    UIViewController *resultVC;
    resultVC = [self topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}
+ (UIViewController *)topViewController:(UIViewController *)vc{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}
+ (void)showAlertTitle:(NSString *)title detail:(NSString *)detail confirmName:(NSString *)confirmName confirmHandel:(void (^)(UIAlertAction *))confirmHandel{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:detail preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:confirmName style:UIAlertActionStyleDefault handler:confirmHandel]];
    [[self getTopViewController] presentViewController:alertController animated:YES completion:nil];
}
+ (void)showAlertTitle:(NSString *)title detail:(NSString *)detail cancleName:(NSString *)cancleName confirmName:(NSString *)confirmName cancleHandel:(void (^)(UIAlertAction *))cancleHandel confirmHandel:(void (^)(UIAlertAction *))confirmHandel{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:detail preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:cancleName style:UIAlertActionStyleCancel handler:cancleHandel]];
    [alertController addAction:[UIAlertAction actionWithTitle:confirmName style:UIAlertActionStyleDefault handler:confirmHandel]];
    [[self getTopViewController] presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertTitle:(NSString *)title detail:(NSString *)detail placeHolder:(NSString *)placeholder cancleName:(NSString *)cancleName confirmName:(NSString *)confirmName cancleHandel:(void (^)(UIAlertAction *))cancleHandel confirmHandel:(void (^)(UIAlertAction *))confirmHandel fieldHandel:(void (^)(NSString *text))fhandle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:detail preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:cancleName style:UIAlertActionStyleCancel handler:cancleHandel]];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    
    __weak typeof(alertController) weakAlert = alertController;
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:confirmName style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (fhandle) {
            fhandle(weakAlert.textFields.firstObject.text);
        }
    }];
    [alertController addAction:doneAction];
    
    [[self getTopViewController] presentViewController:alertController animated:YES completion:nil];
}
//+ (void)showImagesWithImageData:(NSArray *)imageDatas startPage:(NSInteger)page{
//    ImagesShowViewController *vc = [ImagesShowViewController new];
//    vc.imgDatasArray = imageDatas;
//    vc.page = page;
//    [[self getTopViewController] presentViewController:vc animated:YES completion:nil];
//}
//+ (void)showImages:(NSArray * _Nonnull)images startPage:(NSInteger)page{
//    if (IsValidateArr(images)) {
//        ImagesShowViewController *vc = [ImagesShowViewController new];
//        vc.urlsArray = [self encodeUrlStringUTF8With:images];
//        vc.page = page;
//        [[self getTopViewController] presentViewController:vc animated:YES completion:nil];
//    }
//}
//+ (void)showImages:(NSArray *)images startPage:(NSInteger)page target:(UIViewController *)vc{
//    if (IsValidateArr(images)) {
//        ImagesShowViewController *vcs = [ImagesShowViewController new];
//        vcs.urlsArray = [self encodeUrlStringUTF8With:images];
//        vcs.page = page;
//        [vc presentViewController:vcs animated:YES completion:nil];
//    }
//}
+ (NSArray *)encodeUrlStringUTF8With:(NSArray *)sourceArr{
    NSMutableArray *arrr = [NSMutableArray new];
    for (NSString *sttr in sourceArr) {
        NSString *url = [sttr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [arrr addObject:url];
    }
    return arrr;
}

+ (void)addColorView:(UIView *)view color:(UIColor *)color{
    UIView *colorV = ({
        UIView *tmp = [[UIView alloc] initWithFrame:CGRectMake(0, (view.height - Scale375(20))/2, Scale375(3), Scale375(20))];
        tmp.backgroundColor = color;
        tmp;
    });
    [view addSubview:colorV];
}
+ (void)addThemeColorView:(UIView *)view{
    [self addColorView:view color:THEME_TINY_COLOR];
}




//图片压缩
+ (NSData *)compressImage:(UIImage *)sourceImage toWidth:(CGFloat)targetWidth quality:(CGFloat)quality{
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width) * height;
    
    //如果原图比预期的小，就不用改大小了
    if (width < targetWidth) {
        targetWidth = width;
        targetHeight = height;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImageJPEGRepresentation(newImage, quality);
}
+ (void)showLoading{
    [SVProgressHUD show];
}
+ (void)showLoadingText:(NSString *)text{
    [SVProgressHUD showWithStatus:text];
}
+ (void)dismiss{
    [SVProgressHUD dismiss];
}
+ (void)showInfo:(NSString *)info{
    [SVProgressHUD showInfoWithStatus:info];
}

+ (void)showSuccessInfo:(NSString *)info{
    [SVProgressHUD showSuccessWithStatus:info];
}

+ (void)showFailInfo:(NSString *)info{
    [SVProgressHUD showErrorWithStatus:info];
}


+ (BOOL)validPhoneNumber:(NSString *)phone{
    NSString *str = @"^1\\d{10}$";
    NSPredicate *reg = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    return [reg evaluateWithObject:phone];
}

@end
