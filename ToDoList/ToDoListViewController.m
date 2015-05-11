//
//  ToDoListViewController.m
//  ToDoList
//
//  Created by Edward Byne on 11/05/2015.
//  Copyright (c) 2015 Edward Byne. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListViewController ()

@property NSMutableArray *toDoItems;

@end


@implementation ToDoListViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
  AddToDoItemViewController *source = [segue sourceViewController];
  ToDoItem *item = source.toDoItem;
  if (item != nil) {
    [self.toDoItems addObject:item];
    [self.tableView reloadData];
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.toDoItems = [[NSMutableArray alloc] init];
  [self loadInitialData];
}

- (void)loadInitialData {
  ToDoItem *item1 = [[ToDoItem alloc] init];
  item1.itemName = @"Buy milk";
  [self.toDoItems addObject: item1];
  ToDoItem *item2 = [[ToDoItem alloc] init];
  item2.itemName = @"Buy eggs";
  [self.toDoItems addObject:item2];
  ToDoItem *item3 = [[ToDoItem alloc] init];
  item3.itemName = @"Read a book";
  [self.toDoItems addObject: item3];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
  (NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView
    dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
  ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
  cell.textLabel.text = toDoItem.itemName;
  if (toDoItem.completed) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  } else {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
  tappedItem.completed = !tappedItem.completed;
  [tableView reloadRowsAtIndexPaths:@[indexPath]
    withRowAnimation:UITableViewRowAnimationNone];
}

@end
