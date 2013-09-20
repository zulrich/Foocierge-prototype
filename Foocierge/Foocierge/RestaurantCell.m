//
//  RestaurantCell.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "RestaurantCell.h"

@implementation RestaurantCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    
//    UIImage *image = [UIImage imageNamed:@"TableCellGradient"];
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:image];
//    self.backgroundView = backgroundImageView;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell:(Restaurant *)restaurant
{
    self.restaurantName.text = restaurant.name;
    
    float miles = [restaurant.distanceFromCurrentLocation floatValue] * 0.000621371;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:miles]];
    
    
    self.distanceLabel.text = [NSString stringWithFormat:@"%@ mi", numberString];
    
    dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
    
        NSURL *ratingURL = [NSURL URLWithString:restaurant.rating_image_url];
        NSURL *imageURL = [NSURL URLWithString:restaurant.imageURL];
                
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
        NSData *ratingImageData = [[NSData alloc] initWithContentsOfURL:ratingURL];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.restaurantImage.image = [UIImage imageWithData:imageData];
            self.ratingImage.image = [UIImage imageWithData:ratingImageData];

        });
    
    });
}


@end
