//
//  SysKeyButton.m
//  ad
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 SHXHVSSUYSCOMPANY.com. All rights reserved.
//

#import "SysKeyButton.h"
#import "UIColor+SysExtension.h"
#import "UIImage+SysExtension.h"

@interface SysKeyButton()

@property (copy, nonatomic) buttonClickBlock block;

@end

@implementation SysKeyButton

+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initKeyButtonWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:SysKeyButtonFont];
        [self setTitleColor:[UIColor colorWithHexString:@"#13334d"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#d8e2e9"]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#697d91"]] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setButtonClickBlock:(buttonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(SysKeyButton *)button {
    NSString *text = @"";
    if (self.type == SysKeyButtonTypeOther) {
        text = button.titleLabel.text;
    }
    self.block(self.type, text);
}


@end
