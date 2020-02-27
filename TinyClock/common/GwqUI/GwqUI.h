//
//  GwqUI.h
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/27.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

//按钮类型
typedef enum : NSUInteger {
    ANYI_BUTTON_TYPE_NORMAL,//未指定类型
    ANYI_BUTTON_TYPE_GREEN,//绿色按钮
    ANYI_BUTTON_TYPE_WHITE,//白色按钮
    ANYI_BUTTON_TYPE_BLUE,// 蓝色按钮
    ANYI_BUTTON_TYPE_ORANGE,//橙色按钮
    ANYI_BUTTON_TYPE_THEME
} ANYI_BUTTON_TYPE;

@interface GwqUI : NSObject

//label
+(UILabel *)CreateLbl:(CGRect)frame font:(UIFont *)font color:(UIColor *)color text:(NSString *)text align:(NSTextAlignment)align;
+(void)AddLabel:(CGRect)frame font:(UIFont *)font color:(UIColor *)color text:(NSString *)text align:(NSTextAlignment)align in:(UIView *)view;

//button
+(UIButton *)CreateButton:(CGRect)frame title:(NSString *)title font:(UIFont *)font tag:(NSInteger)tag selector:(SEL)selctor type:(ANYI_BUTTON_TYPE)type response:(id)response;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rct;
//imageview
+(UIImageView *)CreateImg:(CGRect)frame name:(NSString *)name;
+(void)AddImg:(CGRect)frame name:(NSString *)name in:(UIView *)view;

//textfield
+(UITextField *)CreateTextField:(CGRect)frame font:(UIFont *)font color:(UIColor *)color align:(NSTextAlignment)align placeholder:(NSString *)placeholder isSecure:(BOOL)isSecure;

//arrow
+(void)AddArrowIn:(UIView *)view x:(CGFloat)x y:(CGFloat)y;

//scroll
+(UIScrollView *)CreateScroll:(CGRect)frame;

//table
+(UITableView *)CreateTable:(CGRect)frame target:(id)target;

//添加视图
+(void)AddViewIn:(UIView *)view frame:(CGRect)frame color:(UIColor *)color;

//底部带颜色视图
+(UIView *)CreateBottomView:(CGRect)frame;

//line
+(void)addLineView:(CGRect)frame in:(UIView *)view;
+ (void)addLineView:(CGRect)frame in:(UIView *)view color:(UIColor *)color;
+ (UIView *)createLineView:(CGRect)frame;
//tableview 无数据空白页面
+(UIView *)GetNullFootView:(CGRect)frame title:(NSString *)title imgName:(NSString *)imgName;
//空视图
+(UIView *)GetNilView;
//获取最上层viewcontroller
+(UIViewController *)getTopViewController;
//显示alertViewController
+(void)showAlertTitle:(NSString *)title detail:(NSString *)detail cancleName:(NSString *)cancleName confirmName:(NSString *)confirmName cancleHandel:(void (^)(UIAlertAction *action))cancleHandel confirmHandel:(void (^)(UIAlertAction *action))confirmHandel;
//显示alertViewController
+(void)showAlertTitle:(NSString *)title detail:(NSString *)detail placeHolder:(NSString *)placeholder cancleName:(NSString *)cancleName confirmName:(NSString *)confirmName cancleHandel:(void (^)(UIAlertAction *action))cancleHandel confirmHandel:(void (^)(UIAlertAction *action))confirmHandel fieldHandel:(void (^)(NSString *text))fhandle;
+ (void)showAlertTitle:(NSString *)title detail:(NSString *)detail confirmName:(NSString *)confirmName confirmHandel:(void (^)(UIAlertAction *))confirmHandel;
//展开图片浏览模式
//+ (void)showImages:(NSArray * _Nonnull)images startPage:(NSInteger)page;
//+ (void)showImages:(NSArray * _Nonnull)images startPage:(NSInteger)page target:(UIViewController *)vc;
//+ (void)showImagesWithImageData:(NSArray * _Nonnull)imageDatas startPage:(NSInteger)page;
+ (NSArray *)encodeUrlStringUTF8With:(NSArray *)sourceArr;

+ (void)addColorView:(UIView *)view color:(UIColor *)color;
+ (void)addThemeColorView:(UIView *)view;

//图片压缩
+ (NSData *)compressImage:(UIImage *)sourceImage toWidth:(CGFloat)targetWidth quality:(CGFloat)quality;


+ (void)showLoading;
+ (void)showLoadingText:(NSString *)text;
+ (void)dismiss;
+ (void)showInfo:(NSString *)info;
+ (void)showSuccessInfo:(NSString *)info;
+ (void)showFailInfo:(NSString *)info;

+ (BOOL)validPhoneNumber:(NSString *)phone;

@end

NS_ASSUME_NONNULL_END
