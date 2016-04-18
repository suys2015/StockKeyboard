//
//  SysKeyboardNumberView.m
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import "SysKeyboardNumberView.h"
#import "UIColor+SysExtension.h"
#import "SysKeyButton.h"

static NSInteger const kSysKeyboardNumberDelIndex = 4;
static NSInteger const kSysKeyboardNumberDoneIndex = 19;
static NSInteger const kSysKeyboardNumberSwitch = 15;
static NSInteger const kSysKeyboardNumberHidden = 16;
static NSInteger const kSysKeyboardNumberClear = 18;
static NSInteger const kSysKeyboardNumberPoint = 14;

@interface SysKeyboardNumberView ()

@property (copy, nonatomic) SysKeyboardBlock block;

@end

@implementation SysKeyboardNumberView

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    
    NSArray *contentArr = @[@"600", @"1", @"2", @"3", @"删除", @"000", @"4", @"5",@"6", @"002", @"300", @"7", @"8", @"9", @".", @"ABC", @"隐藏", @"0", @"清空", @"完成"];
    
    int row = 4;
    int column = 5;
    
    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;
    
    for (int i = 0; i < contentArr.count; i++) {
        SysKeyButton *button = [SysKeyButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidth, keyHeight)];
        [button setTitle:contentArr[i] forState:UIControlStateNormal];
        [self addSubview:button];
        __weak __typeof(&*self)weakSelf = self;
        [button setButtonClickBlock:^(SysKeyButtonType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        
        if (i == kSysKeyboardNumberDelIndex) {
            button.type = SysKeyButtonTypeDel;
        } else if (i == kSysKeyboardNumberDoneIndex) {
            button.type = SysKeyButtonTypeDone;
        }else if (i == kSysKeyboardNumberSwitch){
            button.type = SysKeyButtonTypeSwitch;
        }else if (i == kSysKeyboardNumberClear){
            button.type = SysKeyButtonTypeClear;
        }else if (i == kSysKeyboardNumberHidden){
            button.type = SysKeyButtonTypeHidden;
        }else if (i == kSysKeyboardNumberPoint){
            button.type = SysKeyButtonTypePoint;
        }else {
            button.type = SysKeyButtonTypeOther;
        }
        keyX += keyWidth;
        if ((i + 1) % column == 0) {
            keyX = 0;
            keyY += keyHeight;
        }
    }
    // 水平分隔线
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = frame.size.width;
    CGFloat viewH = 0.5;
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorWithHexString:@"#9dacb6"];
        [self addSubview:view];
        
        viewY += keyHeight;
    }
    
    // 垂直分隔线
    viewX = keyWidth;
    viewY = 0;
    viewW = 0.5;
    viewH = frame.size.height;
    for (int i = 0; i < column - 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorWithHexString:@"#9dacb6"];
        [self addSubview:view];
        
        viewX += keyWidth;
    }
}


@end
