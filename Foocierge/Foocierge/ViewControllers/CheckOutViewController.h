//
//  CheckOutViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/23/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckOutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *checkoutTableView;

@property (nonatomic, strong) NSMutableArray *cartArray;
- (IBAction)checkOutPressed:(id)sender;

- (IBAction)cancelButtonPressed:(id)sender;
@end
