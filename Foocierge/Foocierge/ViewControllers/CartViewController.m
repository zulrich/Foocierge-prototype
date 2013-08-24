//
//  CartViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "CartViewController.h"
#import "MenuItemCell.h"
#import "CheckOutViewController.h"

@interface CartViewController ()
{
    
}

@end

@implementation CartViewController

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
    
    [self setPriceValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cartArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuItemCell";
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    MenuItem *item = [self.cartArray objectAtIndex:indexPath.row];
    
    [cell configureCell:item];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        MenuItem *item = [self.cartArray objectAtIndex:indexPath.row];
        [self.cartArray removeObjectAtIndex:indexPath.row];
        [self.cartTableView reloadData];
        [self.removeItemDelegate menuItemRemoved:item];
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"checkOutFromCartSegue"])
    {
        CheckOutViewController *vc = (CheckOutViewController *)segue.destinationViewController;
        vc.cartArray = self.cartArray;
    }
}

-(void)setPriceValue
{
    
    float totalPrice = 0;
    
    for (int i = 0; i < [self.cartArray count]; i++)
    {
        MenuItem *item = [self.cartArray objectAtIndex:i];
        totalPrice += [item.price floatValue];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:totalPrice]];
    
    NSString *price = [NSString stringWithFormat:@"Checkout $ %@", numberString];
    
    self.checkoutButtonItem.title = price;
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)checkoutButtonPressed:(id)sender
{
    [self performSegueWithIdentifier:@"checkOutFromCartSegue" sender:nil];
    
}
@end
