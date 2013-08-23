//
//  MenuItemCell.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@interface MenuItemCell : UITableViewCell

-(void)configureCell:(MenuItem *)item;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *describtionLabel;



@end
