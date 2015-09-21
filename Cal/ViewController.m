//
//  ViewController.m
//  Cal
//
//  Created by Jordan Medlock on 9/13/15.
//  Copyright (c) 2015 Sam Gervais. All rights reserved.
//

#import "ViewController.h"

typedef long long (^oper)(long long, long long);

#define BIOPP(OPP) ^(long long lhs, long long rhs) { \
    return lhs OPP rhs; \
} \

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentNum = 0;
    
    self.operations = @{
                          @"+": BIOPP(+),
                          @"-": BIOPP(-)
                        };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)operationPressed:(UIButton *)sender {
    
    NSString * opp = sender.titleLabel.text;
    self.currentOp = opp;
    self.newNumber = self.currentNum;
    self.currentNum = 0;
}

- (IBAction)equalPressed:(UIButton *)sender {
    oper opp = self.operations[self.currentOp];
    if (opp) {
        self.currentNum = opp(self.currentNum, self.newNumber);
        self.displayedNumber.text = [NSString stringWithFormat:@"%lld",self.currentNum];
    }
}

- (IBAction)numberButtonTouched:(UIButton *)sender {
    
    NSLog(@"%@", sender.titleLabel.text);
    
    int buttonNumber = [[sender.titleLabel.text substringToIndex:1] intValue];
    
    if (self.currentNum < (LLONG_MAX >> 4)) {
        self.currentNum = buttonNumber + self.currentNum*10;
    }
    
    
    self.displayedNumber.text = [NSString stringWithFormat:@"%lld",self.currentNum];
}
@end
