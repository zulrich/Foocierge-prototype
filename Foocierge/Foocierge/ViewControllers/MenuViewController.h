//
//  MenuViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "MenuInfoViewController.h"
#import "CartViewController.h"

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, AddItemDelegate, removeItemDelegate>


@property (nonatomic, strong) Restaurant *selectedRestaurant;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

- (IBAction)cartPressed:(id)sender;
- (IBAction)checkoutPressed:(id)sender;

@end
