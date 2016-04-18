//
//  SysKeyboardBaseView.m
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import "SysKeyboardBaseView.h"

@interface SysKeyboardBaseView ()

@property (copy, nonatomic) SysKeyboardBlock block;

@end

@implementation SysKeyboardBaseView

- (instancetype)initKeyboardWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (instancetype)keyboardWithFrame:(CGRect)frame {
    return [[self alloc] initKeyboardWithFrame:frame];
}

- (void)setSysKeyboardBlock:(SysKeyboardBlock)block {
    self.block = block;
}


@end
