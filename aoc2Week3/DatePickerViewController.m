//
//  DatePickerViewController.m
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (nonatomic, strong) NSMutableArray *inputToArray;

@end

@implementation DatePickerViewController

@synthesize delegate;
@synthesize inputToArray;


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
  
  if (delegate != nil){
    
    // test *********
    if (selectedDate !=nil) {
      NSString *test = [NSString stringWithFormat:@"New Event: %@\n %@\n", textField.text, selectedDate];
      [delegate DidSave:test];
    } else {
      
      NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
      [dateFormat setDateFormat:@"yyyy, MMMM, dd hh:mm aaa"];
      
      NSDate *todaysDate = [NSDate date];
      [dateFormat stringFromDate:todaysDate];
      
      NSString *test = [NSString stringWithFormat:@"New Event: %@\n %@\n", textField.text, [dateFormat stringFromDate:todaysDate]];
      
      
      
      [delegate DidSave:test];
    }
    
    
    //[delegate DidSave:[NSString stringWithFormat:@"New Event: %@\n %@", textField.text, selectedDate]];
    
    //NSLog(@"%@", textField.text);
    //NSLog(@"%@", selectedDate);
  }
  [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSMutableArray*)inputToArray
{
  if (inputToArray == nil) inputToArray = [[NSMutableArray alloc] init];
  return inputToArray;
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
    
    //NSLog(@"%@", [dateFormat stringFromDate:date]);
    
    // Sets minimum date/time to current date
    [datePicker setMinimumDate:currentDate];
    selectedDate = [dateFormat stringFromDate:date];
  }
}
@end
