//
//  TotalCell.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/23/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "TotalCell.h"

@implementation TotalCell

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

-(void)configureCell:(NSString *)text withPrice:(NSString *)price
{
    self.typeLabel.text = text;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    //[formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:[price floatValue]]];
    
    NSString *priceForm = [NSString stringWithFormat:@"$ %@", numberString];
    
    self.priceLabel.text = priceForm;
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
