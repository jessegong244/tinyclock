//
//  Macros.h
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/27.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


#endif /* Macros_h */


#define WEAKSELF        @weakify(self);
#define STRONGSELF      @strongify(self);


#define Scale375(x) (x*(kScreenWidth/375.0))

//设备
#define Device_iPhone4_4s   (kScreenWidth == 320.f && kScreenHeight == 480.f ? YES : NO)
#define Device_iPhone5_5s   (kScreenWidth == 320.f && kScreenHeight == 568.f ? YES : NO)


//字体
#define  Font(a)          [UIFont systemFontOfSize:a]
#define  BFont(a)         [UIFont boldSystemFontOfSize:a]
#define DAFont(fontSize)    [UIFont fontWithName:@"DINAlternate-Bold" size:fontSize]
// 等宽字体 用于数字显示
#define AYDigitalFont(fontSize)    [UIFont fontWithName:@"Asap-Medium" size:(fontSize)*AYWidthScale]
#define AYWidthScale ([UIScreen mainScreen].bounds.size.width/375.0f)

#define DSFont(fontSize)    [UIFont fontWithName:@"DS-Digital" size:fontSize]
#define DDFont(fontSize)    [UIFont fontWithName:@"DigitalDismay" size:fontSize]

// MARK: - 系统相关

#ifndef IOS7_OR_LATER
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 )
#endif

#ifndef IOS8_OR_LATER
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 )
#endif

#ifndef IOS9_OR_LATER
#define IOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 )
#endif

#ifndef IOS10_OR_LATER
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#endif

#ifndef IOS11_OR_LATER
#define IOS11_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#endif

//高度、iPhoneX判断
#define LINE_VALUE (1 / [UIScreen mainScreen].scale)
#define statusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define TopNavHeight ([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height)
#define tabBarHeight self.navigationController.tabBarController.tabBar.frame.size.height

#define Is_iPhoneX_or_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define Is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define Is_iPhoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define Is_iPhoneX (Is_iPhoneX_or_XS || Is_iPhoneXR || Is_iPhoneXSMax)

#define kNavBarHeight              (Is_iPhoneX ? 88.0 : 64.0)
#define kBottomBarHeight        (Is_iPhoneX ? 34.0 : 0)
#define kContentHeight             (kScreenHeight - kNavBarHeight-kBottomBarHeight)


#define TOPHEIGHT   (Is_iPhoneX ? 88 : 64)

//颜色
#define UIColorFromRGB(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue,a)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
//各种颜色
#define THEME_COLOR UIColorFromRGB(0x00A199) //主题色
#define THEME_TINY_COLOR UIColorFromRGB(0x009e96)//主题tiny色
#define THEME_GREEN UIColorFromRGB(0x17cb9f) //绿色

#define MAIN_FONT_COLOR [UIColor colorWithRed:0x18/255.0 green:0x90/255.0 blue:0xff/255.0 alpha:1.0] //主题色
#define MAIN_BACKGROUND_COLOR UIColorFromRGB(0xF1F3F8)
#define TRADE_BLACK_COLOR UIColorFromRGB(0x252525) //黑色
#define TRADE_DARKTEXT_COLOR UIColorFromRGB(0x686868) //浅一点的灰色
#define TRADE_GRAY_COLOR UIColorFromRGB(0x999999) //灰色
#define TRADE_RED_COLOR UIColorFromRGB(0xFF4D4F)
#define LINE_COLOR  UIColorFromRGB(0xdadada)

//Block安全回调
#define SAFE_BLOCK_CALL_NO_P(b) (b == nil ?: b())
#define SAFE_BLOCK_CALL(b, p) (b == nil ? : b(p) )
#define SAFE_BLOCK_CALL_2_P(b, p1, p2) (b == nil ? : b(p1, p2))
//主线程处理
#define dispatch_inMainThread(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

// 判断一个NSString是否合法
#define IsValidateString(str) ((nil != str) && ([str isKindOfClass:[NSString class]]) && ([str length] > 0) && (![str isEqualToString:@"(null)"]) && ((NSNull *) str != [NSNull null]))
#define validateString(str) (IsValidateString(str)?str:@"")
// 判断一个数组是否合法
#define IsValidateArr(obj) ((obj && [obj isKindOfClass:[NSArray class]]))
// 判断一个字典是否合法
#define IsValidateDic(obj) (nil != obj && [obj isKindOfClass:[NSDictionary class]])

//通知处理
#define addN(_selector,_name) ([[NSNotificationCenter defaultCenter] addObserver:self selector:_selector name:_name object:nil])
#define removeNObserverWithName(_name) ([[NSNotificationCenter defaultCenter] removeObserver:self name:_name object:nil])
#define removeNObserver() ([[NSNotificationCenter defaultCenter] removeObserver:self])
#define postN(_name) ([[NSNotificationCenter defaultCenter] postNotificationName:_name object:nil userInfo:nil])
#define postNWithObj(_name,_obj) ([[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj userInfo:nil])
#define postNWithInfos(_name,_obj,_infos) ([[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj userInfo:_infos])

//APP的版本
#define AppBundleVersion   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//沙盒
#define USERDEFAULT_SAVE(__value__,__key__)    [[NSUserDefaults standardUserDefaults] setObject:__value__ forKey:__key__]
#define USERDEFAULT_GET(__key__)               [[NSUserDefaults standardUserDefaults] objectForKey:__key__]
#define USERDEFAULT_REMOVE(__key__)            [[NSUserDefaults standardUserDefaults] removeObjectForKey:__key__]
#define USERDEFAULT_SYNCHRONIZE                [[NSUserDefaults standardUserDefaults] synchronize]

//文件目录
#define DocumentBasePath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DocumentPath(__name__)   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:__name__]
//SLog 打印代码位置
#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif
//网络请求超时时间
#ifdef DEBUG
#define ReqDelayTime    20.0f
#else
#define ReqDelayTime    20.0f
#endif
//bugly app Key
#define BUGLY_APPID     @"87bf0a2166"



//通知
#define NOTIFICENTER    [NSNotificationCenter defaultCenter]
//user default
#define USERDEFAULT    [NSUserDefaults standardUserDefaults]

