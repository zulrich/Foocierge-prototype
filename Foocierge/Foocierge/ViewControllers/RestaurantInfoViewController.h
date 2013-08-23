//
//  RestaurantInfoViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"

@interface RestaurantInfoViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *dishTableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (nonatomic, strong) Restaurant *selectedRestaurant;
- (IBAction)phoneButtonPressed:(id)sender;
- (IBAction)menuButtonPressed:(id)sender;

@end
