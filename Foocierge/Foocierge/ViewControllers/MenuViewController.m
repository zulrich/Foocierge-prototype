//
//  MenuViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuItemCell.h"
#import "MenuItem.h"
#import <Parse/Parse.h>
#import "SVProgressHUD.h"
#import "CheckOutViewController.h"

@interface MenuViewController ()
{
    NSMutableArray *menuArray;
    NSMutableArray *cartArray;
    NSMutableArray *numInSections;
    NSMutableArray *sectionNames;
}

@end

@implementation MenuViewController

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
    
    menuArray = [[NSMutableArray alloc] init];
    cartArray = [[NSMutableArray alloc] init];
    numInSections = [[NSMutableArray alloc] init];
    sectionNames = [[NSMutableArray alloc] init];
    
    
    [self loadMenu];
        
    [self loadMenuItems];
}

-(void)loadMenu
{
    PFQuery *menuQuery = [PFQuery queryWithClassName:@"Menus"];
    [menuQuery whereKey:@"RestaurantName" equalTo:self.selectedRestaurant.name];
    
    PFObject *menuObj = [menuQuery getFirstObject];
    
    sectionNames = [menuObj objectForKey:@"MenuSections"];
    numInSections = [menuObj objectForKey:@"NumInSections"];
}

-(void)loadMenuItems
{
    
    [menuArray removeAllObjects];
    
    PFQuery *queryForGames = [PFQuery queryWithClassName:@"MenuItems"];
    [queryForGames whereKey:@"restaurantID" equalTo:self.selectedRestaurant.restaurantID];
    [queryForGames orderByAscending:@"dishTypeNum"];
    [queryForGames findObjectsInBackgroundWithBlock:^(NSArray *menuObjects, NSError *error) {
        
    for (PFObject *menuItem in menuObjects) {
        
        
        
            MenuItem *item = [[MenuItem alloc] initWithObjID:menuItem.objectId  restID:[menuItem objectForKey:@"restaurantID"] withName:[menuItem objectForKey:@"name"] withPrice:[menuItem objectForKey:@"price"] withDesc:[menuItem objectForKey:@"describition"] withTag:[menuItem objectForKey:@"tag"] withRange:[menuItem objectForKey:@"priceRange"]];
        
        item.primaryTag = [menuItem objectForKey:@"primaryTag"];
        item.secondaryTag = [menuItem objectForKey:@"secondaryTag"];
        
            [menuArray addObject:item];
            
        }
        
        
        
        [self.menuTableView reloadData];
    }];
    
}

-(int)getCorrectIndex:(NSIndexPath *)indexPath
{
    int index = 0;
    
    for (int i = 0; i < indexPath.section; i++)
    {
        index += [[numInSections objectAtIndex:i] intValue];
    }
    
    index += indexPath.row;
    
    return index;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSLog(@"index path %@", indexPath);
    
    static NSString *CellIdentifier = @"MenuItemCell";
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    MenuItem *item = [menuArray objectAtIndex:[self getCorrectIndex:indexPath]];
    
    [cell configureCell:item];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if ([menuArray count] > 0)
    {
        return  [sectionNames count];
    }
    
    return 1;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [sectionNames objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([menuArray count] > 0)
    {
        return [[numInSections objectAtIndex:section] intValue];
    }
    
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"addMenuItemSegue" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     if ([[segue identifier] isEqualToString:@"addMenuItemSegue"])
     {
         MenuInfoViewController *vc = (MenuInfoViewController *)segue.destinationViewController;
         
         NSIndexPath *selectedRowIndex = [self.menuTableView indexPathForSelectedRow];

         
         vc.selectedMenuItem = [menuArray objectAtIndex:[self getCorrectIndex:selectedRowIndex]];
         [vc setAddItemDelegate:self];
     }
    
    else if ([[segue identifier] isEqualToString:@"viewCartSegue"])
    {
        CartViewController *vc = (CartViewController *)segue.destinationViewController;
        vc.cartArray = cartArray;
        [vc setRemoveItemDelegate:self];
        
    }
    
    else if([[segue identifier] isEqualToString:@"checkOutSegue"])
    {
        CheckOutViewController *vc = (CheckOutViewController *)segue.destinationViewController;
        vc.cartArray = cartArray;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuItemRemoved:(MenuItem *)item
{
    [cartArray removeObject:item];
}

-(void)menuItemAdded:(MenuItem *)item
{
    [cartArray addObject:item];
    [SVProgressHUD showSuccessWithStatus:@"Added to Cart"];
    
}

- (IBAction)cartPressed:(id)sender
{
    [self performSegueWithIdentifier:@"viewCartSegue" sender:nil];
}

- (IBAction)checkoutPressed:(id)sender
{
    
    if([cartArray count] > 0)
    {
        [self performSegueWithIdentifier:@"checkOutSegue" sender:nil];
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:@"Nothing in Cart"];
    }
}
@end
