//
//  SelectCuisineViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/17/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCuisineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cuisineOptionsTable;

@end
