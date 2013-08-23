//
//  RestaurantInfoViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "RestaurantInfoViewController.h"
#import "keys.h"

@interface RestaurantInfoViewController ()

@end

@implementation RestaurantInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"view load");
    
    self.scrollView.frame = CGRectMake(0, 10, 320, 504);
        
    [self.scrollView setContentSize:CGSizeMake(320, 660.0f)];
    
    self.restaurantName.text = self.selectedRestaurant.name;
    
    NSArray *addArr = [[NSArray alloc]initWithArray:[self.selectedRestaurant.locationDictionary objectForKey:@"address"]];
    
    NSString *address = [addArr objectAtIndex:0];
    NSString *city = [self.selectedRestaurant.locationDictionary objectForKey:@"city"];
    
    NSString *fullAddr = [[NSString alloc] initWithFormat:@"%@ , %@", address, city ];

    
    self.addressLabel.text = fullAddr;
    
    //NSLog(@"phone number %@", self.selectedRestaurant.phoneNumber);
    
    self.phoneButton.titleLabel.text = self.selectedRestaurant.phoneNumber;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = lattitude_hard_cord;
    zoomLocation.longitude= longitude_hard_cord;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [self.mapView setRegion:viewRegion animated:YES];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lattitude_hard_cord, longitude_hard_cord);
    
    
    
    
    
    
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"item";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}


- (IBAction)phoneButtonPressed:(id)sender
{
    
}
@end
