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
    
    
    if([item.primaryTag isEqualToString:@"spicy"])
    {
    
        self.tag1Image.image = [UIImage imageNamed:@"pepper.png"];
    }
    
    if ([item.secondaryTag isEqualToString:@"spicy"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"pepper.png"];
    }
    
    if ([item.primaryTag isEqualToString:@"sweet"])
    {
        self.tag1Image.image = [UIImage imageNamed:@"sweet.png"];
    }
    
    if ([item.secondaryTag isEqualToString:@"sweet"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"sweet.png"];
    }
    
    
    if ([item.primaryTag isEqualToString:@"savory"])
    {
        self.tag1Image.image = [UIImage imageNamed:@"sausage.png"];
    }
    
    if ([item.secondaryTag isEqualToString:@"savory"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"sausage.png"];
    }
    
    if ([item.primaryTag isEqualToString:@"organic"])
    {
        self.tag1Image.image = [UIImage imageNamed:@"organic.png"];
    }
    
    if ([item.secondaryTag isEqualToString:@"organic"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"organic.png"];
    }
    
    if ([item.primaryTag isEqualToString:@"seafood"])
    {
        self.tag1Image.image = [UIImage imageNamed:@"shrimp3.png"];
    }
    
    if ([item.secondaryTag isEqualToString:@"seafood"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"shrimp3.png"];
    }
    
    
    if([item.primaryTag isEqualToString:@"salty"])
    {
        self.tag1Image.image = [UIImage imageNamed:@"salt.png"];
    }

    if([item.secondaryTag isEqualToString:@"salty"])
    {
        self.tag2Image.image = [UIImage imageNamed:@"salt.png"];
    }
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
