//
//  DatePickerViewController.h
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePickerViewController : UIViewController
{

  IBOutlet UITextField *textField;
 
}
- (IBAction)saveButton:(id)sender;
- (IBAction)closeKeyboard:(id)sender;

@end
