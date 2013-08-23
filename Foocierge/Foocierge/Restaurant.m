//
//  Restaurant.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id)initFromYelpBusinessDictionary:(NSDictionary *)businessDict
{
    self = [super init];
    if (self)
    {
        self.yelpID = [businessDict objectForKey:@"id"];
        self.name = [businessDict objectForKey:@"name"];
        self.imageURL = [businessDict objectForKey:@"image_url"];
        self.phoneNumber = [businessDict objectForKey:@"display_phone"];
        self.distanceFromCurrentLocation = [businessDict objectForKey:@"distance"];
        self.yelpRating = [businessDict objectForKey:@"rating"];
        self.rating_image_url = [businessDict objectForKey:@"rating_img_url_small"];
        self.locationDictionary = [businessDict objectForKey:@"location"];
                
    }
    
    return  self;
}


@end
