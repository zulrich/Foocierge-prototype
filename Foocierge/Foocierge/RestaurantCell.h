//
//  RestaurantCell.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface RestaurantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImage;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;


-(void)configureCell:(Restaurant *)restaurant;

@end
