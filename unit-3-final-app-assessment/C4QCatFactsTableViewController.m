//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "CATFact.h"
#import "C4QCatFactsDetailViewController.h"
#import "TableViewCell.h"


#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSArray *results;
@property (nonatomic) NSMutableArray *factsArray;



@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self catFactRequest];
    
        [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCellID"];

    self.factsArray = [[NSMutableArray alloc] init];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //
    self.tableView.estimatedRowHeight = 80;

}
- (IBAction)saveButtonTapped:(id)sender {

    
}


-(void) catFactRequest {
    
    NSString *catFacts = [NSString stringWithFormat:@"http://catfacts-api.appspot.com/api/facts?number=100"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/javascript", nil];


    
    [manager GET:catFacts
     
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             self.results = responseObject[@"facts"];
       //x
//             self.results = [responseObject objectForKey:@"facts"];
             NSLog(@"JSON: %@", self.results);
             NSLog(@"Success: %@", responseObject);
             
             for (NSString *result in self.results) {
                 [self.factsArray addObject:result];
             }
             
             [self.tableView reloadData];
             
     }
         failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure: %@", error);
     }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.factsArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID"];

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    cell.factLabel.text = self.factsArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [self performSegueWithIdentifier:@"WeatherDetailSegue" sender:self];
    [self performSegueWithIdentifier:@"detailView" sender:indexPath];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return UITableViewAutomaticDimension;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"detailView"]) {

        C4QCatFactsDetailViewController *vc = segue.destinationViewController;
        
        vc.fact = self.factsArray[indexPath.row];
    }
    
    
}



@end
