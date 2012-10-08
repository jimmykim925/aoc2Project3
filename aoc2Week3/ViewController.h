//
//  ViewController.h
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"

@interface ViewController : UIViewController <DatePickerDelegate> 
{

}

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)addEvent:(id)sender;

@end
