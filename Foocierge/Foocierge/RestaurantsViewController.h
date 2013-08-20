//
//  RestaurantsViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/19/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantsViewController : UITableViewController

@property (nonatomic, strong) NSMutableDictionary *preferencesDictionary;
@property int priceValue;
@property (nonatomic, strong) NSArray *cuisineArray;

@end
