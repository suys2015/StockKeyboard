//
//  SysKeyboardBaseView.h
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SysKeyboardDefine.h"

static CGFloat SysKeyboardViewNumberHeight = 250;

typedef void(^SysKeyboardBlock)(SysKeyButtonType type, NSString *text);

@interface SysKeyboardBaseView : UIView

- (instancetype)initKeyboardWithFrame:(CGRect)frame;

+ (instancetype)keyboardWithFrame:(CGRect)frame;

- (void)setSysKeyboardBlock:(SysKeyboardBlock)block;


@end
