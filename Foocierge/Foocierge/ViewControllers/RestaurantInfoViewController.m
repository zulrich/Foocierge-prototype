//
//  RestaurantInfoViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/21/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "RestaurantInfoViewController.h"
#import "keys.h"
#import "MenuItemCell.h"
#import "MenuItem.h"
#import <Parse/Parse.h>
#import "MenuViewController.h"

@interface RestaurantInfoViewController ()
{
    NSMutableArray *previewMenuItems;
}

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
        
    self.scrollView.frame = CGRectMake(0, 10, 320, 504);
        
    [self.scrollView setContentSize:CGSizeMake(320, 660.0f)];
    
        
    previewMenuItems = [[NSMutableArray alloc] init];
    
    [self setupView];
    [self loadMenuItems];
    
    
    
        
}

-(void)loadMenuItems
{

    PFQuery *queryForGames = [PFQuery queryWithClassName:@"MenuItems"];
    [queryForGames whereKey:@"restaurantID" equalTo:self.selectedRestaurant.restaurantID];
    [queryForGames findObjectsInBackgroundWithBlock:^(NSArray *menuObjects, NSError *error) {
        for (PFObject *menuItem in menuObjects) {
           
            MenuItem *item = [[MenuItem alloc] initWithObjID:menuItem.objectId  restID:[menuItem objectForKey:@"restaurantID"] withName:[menuItem objectForKey:@"name"] withPrice:[menuItem objectForKey:@"price"] withDesc:[menuItem objectForKey:@"describition"] withTag:[menuItem objectForKey:@"tag"] withRange:[menuItem objectForKey:@"priceRange"]];
            
            item.primaryTag = [menuItem objectForKey:@"primaryTag"];
            item.secondaryTag = [menuItem objectForKey:@"secondaryTag"];
            
            [previewMenuItems addObject:item];
                            
        }
        
        [self.dishTableView reloadData];
    }];

}

-(void)setupView
{
    self.restaurantName.text = self.selectedRestaurant.name;
    
    //NSArray *addArr = [[NSArray alloc]initWithArray:[self.selectedRestaurant.locationDictionary objectForKey:@"address"]];
    
    NSString *address = self.selectedRestaurant.address; //[addArr objectAtIndex:0];
    //NSString *city = [self.selectedRestaurant.locationDictionary objectForKey:@"city"];
    
    //NSString *fullAddr = [[NSString alloc] initWithFormat:@"%@ , %@", address, city ];
    
    
    self.addressLabel.text = address;
    self.phoneLabel.text = self.selectedRestaurant.phoneNumber;
    
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = lattitude_hard_cord;
    zoomLocation.longitude= longitude_hard_cord;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [self.mapView setRegion:viewRegion animated:YES];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lattitude_hard_cord, longitude_hard_cord);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    [annotation setTitle:self.selectedRestaurant.name];
    [annotation setSubtitle:address];
    [self.mapView addAnnotation:annotation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuItemCell";
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    MenuItem *item = [previewMenuItems objectAtIndex:indexPath.row];
    
    [cell configureCell:item];
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([previewMenuItems count] >= 3)
    {
        return 3;
    }
    
    else return [previewMenuItems count];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MenuViewController *vc = (MenuViewController *)segue.destinationViewController;
    vc.selectedRestaurant = self.selectedRestaurant;
}


- (IBAction)phoneButtonPressed:(id)sender
{
    NSString *phoneNumber = [NSString stringWithFormat:@"telprompt://%@", self.selectedRestaurant.phoneNumber];
    
    NSString *cleanedString = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];

    
    if(![self.selectedRestaurant.phoneNumber isEqualToString:@""])
    {
        NSLog(@"PHONE NUMBER %@", cleanedString);
        NSURL *URL = [NSURL URLWithString:cleanedString];
        [[UIApplication sharedApplication] openURL:URL];
        
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Alert"
                              message: @"No phone number found"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
   
}

- (IBAction)menuButtonPressed:(id)sender
{
    [self performSegueWithIdentifier:@"viewMenuSegue" sender:self];

}
@end
