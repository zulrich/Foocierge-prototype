//
//  MenuItem.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

-(id)initWithObjID:(NSString *)objID restID:(NSString *)restID withName:(NSString *)name withPrice:(NSNumber *)priceVal withDesc:(NSString *)desc withTag:(NSString *)tag withRange:(NSNumber *)range
{
    self = [super init];
    
    if (self)
    {
        self.objectID = objID;
        self.restaurantID = restID;
        self.name = name;
        self.price = priceVal;
        self.describition = desc;
        self.tag = tag;
        self.priceRange = range;
    }
    
    return self;
}

@end
