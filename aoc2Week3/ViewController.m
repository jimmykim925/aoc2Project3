//
//  ViewController.m
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)DidSave:(NSString *)eventString
{
  textView.text = eventString;
}

- (IBAction)addEvent:(id)sender {

  DatePickerViewController *viewController = [[DatePickerViewController alloc] initWithNibName:@"DatePickerViewController" bundle:nil];
  
  if (viewController != nil){
    viewController.delegate = self;
    [self presentViewController:viewController animated:TRUE completion:nil];
  }
}
@end
