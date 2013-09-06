//
//  MenuItem.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *objectID;
@property (nonatomic, strong) NSString *restaurantID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSString *describition;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSNumber *priceRange;
@property (nonatomic, strong) NSString *primaryTag;
@property (nonatomic, strong) NSString *secondaryTag;

-(id)initWithObjID:(NSString *)objID restID:(NSString *)restID withName:(NSString *)name withPrice:(NSNumber *)priceVal withDesc:(NSString *)desc withTag:(NSString *)tag withRange:(NSNumber *)range;

@end
