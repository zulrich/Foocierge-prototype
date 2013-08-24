//
//  CheckOutViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/23/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "CheckOutViewController.h"
#import "MenuItemCell.h"
#import "MenuItem.h"
#import "TotalCell.h"

@interface CheckOutViewController ()
{
    double totalPrice, taxValue, subTotal;
    
}

@end

@implementation CheckOutViewController

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
    totalPrice = 0;
    taxValue = 0;
    subTotal = 0;
    
    [self setPriceValue];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        static NSString *CellIdentifier = @"MenuItemCell";
        MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        MenuItem *item = [self.cartArray objectAtIndex:indexPath.row];
        
        [cell configureCell:item];
        return cell;

    
    }
    
    else if (indexPath.section == 1)
    {
        static NSString *CellIdentifier = @"TotalCell";
        TotalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        
        switch (indexPath.row)
        {
            case 0:
            {
                NSString * price = [NSString stringWithFormat:@"%f", subTotal];
                [cell configureCell:@"Subtotal" withPrice:price];
                break;

            }
            case 1:
            {
                NSString * price = [NSString stringWithFormat:@"%f", taxValue];
                [cell configureCell:@"Tax" withPrice:price];
                break;
            }
            
            case 2:
            {
                NSString * price = [NSString stringWithFormat:@"%f", totalPrice];
                [cell configureCell:@"Total" withPrice:price];
                break;
            }
                
            default:
                break;
        }
        
        
        return cell;
    }
    
}

-(void)setPriceValue
{
        
    for (int i = 0; i < [self.cartArray count]; i++)
    {
        MenuItem *item = [self.cartArray objectAtIndex:i];
        subTotal += [item.price floatValue];
    }
    
    taxValue = subTotal * .07;
    totalPrice = subTotal + taxValue;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [self.cartArray count];
    }
    
    else
    {
        return 3;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
