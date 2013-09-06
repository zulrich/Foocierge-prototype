//
//  MenuItemCell.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "MenuItemCell.h"

@implementation MenuItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell:(MenuItem *)item
{
    self.nameLabel.text = item.name;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:[item.price floatValue]]];
    
    NSString *price = [NSString stringWithFormat:@"$ %@", numberString];

    
    self.priceLabel.text = price;
    
    self.describtionLabel.text = item.describition;
    
    self.tag1Image.image = [UIImage imageNamed:@"pepper.png"];
}

//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    
//    UIImage *image = [UIImage imageNamed:@"TableCellGradient"];
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:image];
//    self.backgroundView = backgroundImageView;
//}


@end
