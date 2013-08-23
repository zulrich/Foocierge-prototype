//
//  Restaurant.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (nonatomic, strong) NSString *yelpID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSNumber *distanceFromCurrentLocation;
@property (nonatomic, strong) NSNumber *yelpRating;
@property (nonatomic, strong) NSString *rating_image_url;
@property (nonatomic, strong) NSDictionary *locationDictionary;

@property (nonatomic, strong) NSString *restaurantID;

-(id)initFromYelpBusinessDictionary:(NSDictionary *)businessDict;



@end
