//
//  ToDoItem.h
//  ToDoList
//
//  Created by Edward Byne on 11/05/2015.
//  Copyright (c) 2015 Edward Byne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
