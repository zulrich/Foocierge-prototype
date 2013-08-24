//
//  TotalCell.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/23/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

-(void)configureCell:(NSString *)text withPrice:(NSString *)price;
@end
