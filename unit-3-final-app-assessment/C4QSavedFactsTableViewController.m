//
//  C4QSavedFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Natalia Estrella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedFactsTableViewController.h"
#import "TableViewCell.h"
#import "SavedFactCell.h"


@interface C4QSavedFactsTableViewController ()

//@property (nonatomic) NSString *factString;
//@property (nonatomic) NSMutableArray *factString;

@end

@implementation C4QSavedFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.savedCatFacts = [[NSUserDefaults standardUserDefaults] arrayForKey:@"factLabel"];
    
    /////////////////////I am the one who nibs//////////////////
    [self.tableView registerNib:[UINib nibWithNibName:@"SavedFactCell" bundle:nil] forCellReuseIdentifier:@"SavedFactCell"];

    
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.tableView.estimatedRowHeight = 80;
 
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
    
     SavedFactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedFactCell"];
    
    cell.savedFactCellLabel.text = self.savedCatFacts[indexPath.row];

    return cell;
}


@end
