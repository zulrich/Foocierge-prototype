//
//  MenuInfoViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@protocol AddItemDelegate <NSObject>

-(void)menuItemAdded:(MenuItem *)item;

@end


@interface MenuInfoViewController : UIViewController

@property (nonatomic, weak) id<AddItemDelegate> addItemDelegate;

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *describitionTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *titleBarItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItemBarItem;

@property (nonatomic, strong) MenuItem *selectedMenuItem;

- (IBAction)cancelButtonPressed:(id)sender;

- (IBAction)addPressed:(id)sender;

@end
