//
//  DatePickerViewController.m
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      //delegate = nil;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Sets the current date
  currentDate = [NSDate date];
}

- (void)viewWillAppear:(BOOL)animated
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  
  [super viewWillAppear:animated];

}

- (void)keyboardWillShow:(NSNotification *)notification
{

}

- (void)keyboardWillHide:(NSNotification *)notification
{

}


- (IBAction)saveButton:(id)sender {
  NSString *saveText = textField.text;
  NSLog(@"%@", saveText);
  
  if (delegate != nil){
    [delegate DidSave:textField.text];
  }
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)closeKeyboard:(id)sender {
  [textField resignFirstResponder];
}

- (IBAction)datePicker:(id)sender {
  UIDatePicker *datePicker = (UIDatePicker *)sender;
  if(datePicker != nil){
    NSDate *date = datePicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     if (dateFormat != nil) {
      [dateFormat setDateFormat:@"yyyy, MMMM, dd hh:mm aaa"];
      
    }
    NSLog(@"%@", [dateFormat stringFromDate:date]);
    
    // Sets minimum date/time to current date
    [datePicker setMinimumDate:currentDate];
  }
}
@end
