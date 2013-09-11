//
//  RestaurantsViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/19/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "RestaurantsViewController.h"
#import "keys.h"
#import "OAuthConsumer.h"
#import "SVProgressHUD.h"
#import "Restaurant.h"
#import "RestaurantCell.h"
#import "RestaurantInfoViewController.h"
#import <Parse/Parse.h>



@interface RestaurantsViewController ()
{
    NSMutableArray *restuarantsArray;
    NSMutableData *responseData;
}

@end

@implementation RestaurantsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad]; 
    
    //[SVProgressHUD showWithStatus:@"Loading Results"];
    
    restuarantsArray = [[NSMutableArray alloc] init];
    
    NSURL *URL = [NSURL URLWithString:@"http://api.yelp.com/v2/search?term=mediterranean&ll=37.348504,-121.895653"];
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:consumerKeyFoo secret:consumerSecretFoo];
    OAToken *yelpOAToken = [[OAToken alloc] initWithKey:yelptoken secret:tokenSecret];
    
    id<OASignatureProviding, NSObject> provider = [[OAHMAC_SHA1SignatureProvider alloc] init];
    NSString *realm = nil;
    
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:URL
                                                                   consumer:consumer
                                                                      token:yelpOAToken
                                                                      realm:realm
                                                          signatureProvider:provider];
    [request prepare];

    responseData = [[NSMutableData alloc] init];
    
    //NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
    NSLog(@"cusine array %@", self.cuisineArray);
    
    PFQuery *restaurantsQuery = [PFQuery queryWithClassName:@"Restaurants"];
    
    if ([self.cuisineArray count] > 0)
    {
        [restaurantsQuery whereKey:@"restaurantType" containedIn:self.cuisineArray];
   
    }
    
    [restaurantsQuery findObjectsInBackgroundWithBlock:^(NSArray *restaurantObj, NSError *error) {
        for (PFObject *restItem in restaurantObj) {
            
            Restaurant *item = [[Restaurant alloc]  init];
            item.name = [restItem objectForKey:@"name"];
            item.phoneNumber = [restItem objectForKey:@"phoneNumber"];
            item.rating_image_url = [restItem objectForKey:@"ratingImageURL"];
            item.restaurantID = restItem.objectId;
                        
            PFGeoPoint *point = [restItem objectForKey:@"location"];
            
            item.latCoord = [NSNumber numberWithDouble:point.latitude];
            item.longCoord = [NSNumber numberWithDouble:point.longitude];

            item.imageURL = [restItem objectForKey:@"imageURL"];
            item.distanceFromCurrentLocation = [NSNumber numberWithDouble:.2];
            item.address = [restItem objectForKey:@"address"];
            
            [restuarantsArray addObject:item];
        }
    
        [self.tableView reloadData];
        
    }];

    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error: %@, %@", [error localizedDescription], [error localizedFailureReason]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [SVProgressHUD showSuccessWithStatus:@"Done Enjoy"];
    NSError* error;
    
    
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSArray *businesses = [json objectForKey:@"businesses"];
    
    for (int i = 0; i < [businesses count]; i++)
    {
        NSDictionary *obj = [businesses objectAtIndex:i];
        Restaurant *restObj = [[Restaurant alloc] initFromYelpBusinessDictionary:obj];
       
        [restuarantsArray addObject:restObj];

    }
    
    [self.tableView reloadData];
    
    
    //NSLog(@"business %@", businesses);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [restuarantsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RestaurantCell";
    RestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    [cell configureCell:[restuarantsArray objectAtIndex:indexPath.row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RestaurantInfoViewController *vc = (RestaurantInfoViewController *)segue.destinationViewController;
    
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    vc.selectedRestaurant = [restuarantsArray objectAtIndex:selectedRowIndex.row];
    vc.dishTags = [self.dishTags allObjects];
}

@end
