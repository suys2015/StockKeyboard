//
//  ViewController.m
//  BankKeyBoardDemo
//
//  Created by sys on 16/4/14.
//  Copyright © 2016年 sys.com. All rights reserved.
//

#import "ViewController.h"
#import "SysKeyboardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tx;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SysKeyboardView directToReverseTextFiledInputView:self.tx];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
