//
//  SysKeyButton.h
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SysKeyboardDefine.h"

static CGFloat const SysKeyButtonFont = 17;

typedef void(^buttonClickBlock)(SysKeyButtonType buttonType, NSString *text);

@interface SysKeyButton : UIButton

@property (assign, nonatomic) SysKeyButtonType type;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)setButtonClickBlock:(buttonClickBlock)block;



@end
