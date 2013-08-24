//
//  CartViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@protocol removeItemDelegate <NSObject>

-(void)menuItemRemoved:(MenuItem *)item;

@end

@interface CartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)checkoutButtonPressed:(id)sender;

@property (nonatomic, weak) id<removeItemDelegate> removeItemDelegate;
@property (weak, nonatomic) IBOutlet UITableView *cartTableView;

@property (nonatomic, strong) NSMutableArray *cartArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkoutButtonItem;

@end
