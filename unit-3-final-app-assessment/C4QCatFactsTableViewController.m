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


#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSArray *results;
@property (nonatomic) NSMutableArray *factsArray;



@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self catFactRequest];

    self.factsArray = [[NSMutableArray alloc] init];
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
             
             for (NSString *fact in self.results) {
                 [self.factsArray addObject:fact];
             }
             
             [self.tableView reloadData];
             
//             for (NSDictionary *result in self.results) {
//                 CATFact *object = [[CATFact alloc]init];
//
//                 
//                 // somthing is wrong here !!!!!
//                 object.fact = [result objectForKey:@"facts"];
////                 [self.factsArray addObject:object];
//                 
//
//             }

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.factsArray[indexPath.row];
    
    return cell;
}


@end
