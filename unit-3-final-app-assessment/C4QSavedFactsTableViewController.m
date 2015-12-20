//
//  C4QSavedFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Natalia Estrella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedFactsTableViewController.h"
#import "TableViewCell.h"


@interface C4QSavedFactsTableViewController ()

@property (nonatomic) NSString *factString;

@end

@implementation C4QSavedFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.savedCatFacts = [[NSMutableArray alloc] init];
    self.factString = [[NSUserDefaults standardUserDefaults]  objectForKey:@"factLabel"];
    
    [self.savedCatFacts addObject:self.factString];
    
//    self.savedCatFacts = [NSArray arrayWithObjects:self.factString];
//    [self.savedCatFacts addObject:self.factString];
    
//    [self.savedCatFacts addObject:self.factString];
    
    
//    self.savedCatFacts = [NSMutableArray arrayWithObjects:self.factString, nil];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];

 //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedCellIdentifier" forIndexPath:indexPath];

    cell.textLabel.text = self.savedCatFacts[indexPath.row];
    

    
    return cell;
}


@end
