//
//  ViewController.h
//  Cal
//
//  Created by Jordan Medlock on 9/13/15.
//  Copyright (c) 2015 Sam Gervais. All rights reserved.
//

#import <UIKit/UIKit.h>

enum CardinalDirection {
    HEAD, TAIL
};


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayedNumber;
@property (nonatomic) long long currentNum;
@property (nonatomic) long long newNumber;
@property (strong, nonatomic) NSString * currentOp;
@property (strong, nonatomic) NSDictionary * operations;


@end

