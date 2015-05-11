//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Edward Byne on 11/05/2015.
//  Copyright (c) 2015 Edward Byne. All rights reserved.
//

#import "AddToDoItemViewController.h"
//#import "ToDoItem.h"

@interface AddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if (sender != self.saveButton) return;
  if (self.textField.text.length > 0) {
    self.toDoItem = [[ToDoItem alloc] init];
    self.toDoItem.itemName = self.textField.text;
    self.toDoItem.completed = NO;
  }
}

@end
