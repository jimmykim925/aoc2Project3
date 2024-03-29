//
//  DatePickerViewController.h
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegate <NSObject>

-(void)DidSave:(NSString *)eventString;

@required
@end


@interface DatePickerViewController : UIViewController <UITextFieldDelegate>
{
  id<DatePickerDelegate> delegate;
  IBOutlet UITextField *textField;
  NSDate *currentDate;
  NSString *selectedDate;
}

@property (strong) id<DatePickerDelegate> delegate;

- (IBAction)saveButton:(id)sender;
- (IBAction)closeKeyboard:(id)sender;
- (IBAction)datePicker:(id)sender;

@end
