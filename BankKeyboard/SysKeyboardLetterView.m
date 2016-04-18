//
//  SysKeyboardLetterView.m
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import "SysKeyboardLetterView.h"
#import "SysKeyButton.h"
#import "UIColor+SysExtension.h"

static NSInteger const kSysKeyboardNumberDelIndex = 27;
static NSInteger const kSysKeyboardNumberDoneIndex = 30;
static NSInteger const kSysKeyboardNumberSwitch = 28;
static NSInteger const kSysKeyboardNumberHidden = 19;
static NSInteger const kSysKeyboardNumberClear = 29;

@interface SysKeyboardLetterView ()

@property (copy, nonatomic) SysKeyboardBlock block;

@end

@implementation SysKeyboardLetterView


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    NSArray *contentArr = @[@"Q", @"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O", @"P", @"A", @"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L", @"隐藏",@"Z", @"X", @"C", @"V", @"B", @"N", @"M", @"删除", @"123", @"清空", @"完成"];
    int row = 4;
    int column = 10;
    CGFloat letterWidth = frame.size.width/column;
    CGFloat letterHeight = frame.size.height/row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;
    for(int i = 0; i < contentArr.count; i ++){
        SysKeyButton *button = [SysKeyButton keyButtonWithFrame:CGRectMake(keyX, keyY, letterWidth, letterHeight)];
        [button setTitle:contentArr[i] forState:UIControlStateNormal];
        [self addSubview:button];
        __weak __typeof(&*self)weakSelf = self;
        [button setButtonClickBlock:^(SysKeyButtonType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        //加入类型判断
        if(kSysKeyboardNumberDelIndex == i){
            button.type =  SysKeyButtonTypeDel;
        }else if (kSysKeyboardNumberClear == i){
            button.type = SysKeyButtonTypeClear;
        }else if (kSysKeyboardNumberDoneIndex == i){
            button.type = SysKeyButtonTypeDone;
        }else if (kSysKeyboardNumberHidden == i){
            button.type = SysKeyButtonTypeHidden;
        }else if (kSysKeyboardNumberSwitch == i){
            button.type = SysKeyButtonTypeSwitch;
        }else{
            button.type = SysKeyButtonTypeOther;
        }
        if(i < 10){
            if(i == 9){
                keyX = 0;
                keyY += letterHeight;
                CGFloat space = (frame.size.width - 7 * letterWidth)/2;
                letterWidth = space;
            }else{
                keyX += letterWidth;
            }
        }else if(i > 9 && i < 19){
            if(i == 18){
                keyX = 0;
                keyY += letterHeight;
                letterWidth = frame.size.width/column;
                letterWidth = (frame.size.width - 7 * letterWidth)/2;
            }else if(i == 10){
                letterWidth = frame.size.width/column;
                CGFloat space = (frame.size.width - 7 * letterWidth)/2;
                keyX += space;
            }else if(i == 17){
                keyX += letterWidth;
                CGFloat space = (frame.size.width - 7 * letterWidth)/2;
                letterWidth = space;
                
            }else{
                letterWidth = frame.size.width/column;
                keyX += letterWidth;
            }
        }else if (i > 18 && i < 28){
            letterWidth = frame.size.width/column;
            CGFloat space = (frame.size.width - 7 * letterWidth)/2;
            if(i == 19){
                keyX += space;
                letterWidth = frame.size.width/column;
            }else if(i == 27){
                keyX = 0;
                keyY += letterHeight;
                letterWidth = frame.size.width/3;
            }else if ( i == 26){
                keyX += letterWidth;
                letterWidth = (frame.size.width - 7 * letterWidth)/2;
            }else{
                keyX += letterWidth;
            }
        }else{
            CGFloat space = frame.size.width/3;
            keyX += space;
        }
        
        //垂直线
        if(i != 9){
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(keyX - 0.5, keyY, 0.5, button.frame.size.height)];
            view.backgroundColor = [UIColor colorWithHexString:@"#9dacb6"];
            [self addSubview:view];
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
        
        viewY += letterHeight;
    }
}


@end
