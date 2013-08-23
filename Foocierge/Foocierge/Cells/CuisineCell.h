//
//  CuisineCell.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CuisineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cusineLabel;

-(void)configureCell:(NSString *)name;


@end
