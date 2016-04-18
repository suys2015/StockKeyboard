//
//  SysKeyboardView.m
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import "SysKeyboardView.h"
#import "SysKeyboardLetterView.h"
#import "SysKeyboardNumberView.h"
#import "UITextField+SysExtension.h"

#define kINPUTVIEWHEIGHT 250

@interface SysKeyboardView()

@property (strong, nonatomic) SysKeyboardNumberView *numberKeyboardView;
@property (strong, nonatomic) SysKeyboardLetterView *letterKeyboardView;
@property (strong, nonatomic) UITextField *textField;

@end

@implementation SysKeyboardView

/**
 默认是加载数字键盘
 */
- (instancetype)initWithFrame:(CGRect)frame withTextField:(UITextField *)textField
{
    self = [super initWithFrame:frame];
    if(self){
        self.textField = textField;
        self.numberKeyboardView = [SysKeyboardNumberView keyboardWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.letterKeyboardView = [SysKeyboardLetterView keyboardWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        __weak __typeof(&*self)weakSelf = self;
        [self.letterKeyboardView setSysKeyboardBlock:^(SysKeyButtonType type, NSString *text) {
            [weakSelf changeTextField:type Text:text];
        }];
        [self.numberKeyboardView setSysKeyboardBlock:^(SysKeyButtonType type, NSString *text) {
            [weakSelf changeTextField:type Text:text];
        }];
        [self addSubview:self.numberKeyboardView];
        self.textField.inputView = self;
    }
    return self;
}

+ (SysKeyboardView *)directToReverseTextFiledInputView:(UITextField *)textField
{
    SysKeyboardView *keyboardView = [[SysKeyboardView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kINPUTVIEWHEIGHT) withTextField:textField];
    return keyboardView;
}


- (void)changeTextField:(SysKeyButtonType)type Text:(NSString *)text {
    switch (type) {
        case SysKeyButtonTypeDel:
        case SysKeyButtonTypeOther:
            [self.textField changetext:text];
            break;
        case SysKeyButtonTypeDone:
        case SysKeyButtonTypeHidden:
            [self.nextResponder resignFirstResponder];
            break;
        case SysKeyButtonTypeClear:
            self.textField.text = @"";
            break;
        case SysKeyButtonTypeSwitch:
            if([self.numberKeyboardView isDescendantOfView:self]){
                [self.numberKeyboardView removeFromSuperview];
                [self addSubview:self.letterKeyboardView];
            }else{
                [self.letterKeyboardView removeFromSuperview];
                [self addSubview:self.numberKeyboardView];
            }
            break;
        case SysKeyButtonTypePoint:
            break;
    }
}


@end
