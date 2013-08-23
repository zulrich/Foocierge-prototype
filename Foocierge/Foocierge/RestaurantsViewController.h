//
//  RestaurantsViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/19/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define yelpRequestURL [NSURL URLWithString:@"http://api.yelp.com/v2/search?term=food&location=San+Francisco"] //2

@interface RestaurantsViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong) NSMutableDictionary *preferencesDictionary;
@property int priceValue;
@property (nonatomic, strong) NSArray *cuisineArray;

@end
