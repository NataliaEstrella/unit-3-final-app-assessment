//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import <AFNetworking/AFNetworking.h>


#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC";

@interface C4QCatFactsDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *factLabel;
@property (weak, nonatomic) IBOutlet UIImageView *kittyImage;

@property (nonatomic)NSMutableArray *kittyPicArray;
@property (nonatomic) NSArray *results;


@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.factLabel.text = self.fact;
    
//    self.kittyImage.image = [[UIImage alloc] init];
    


    [self giphyRequest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) giphyRequest {
    
        NSString *catFacts = [NSString stringWithFormat:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"];
    
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    
    
        [manager GET:catFacts
    
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    
    //             self.results = [[responseObject objectForKey:@"data"] objectForKey:@"images"];
    
                 self.results = [responseObject [@"data"]firstObject ];
                 NSLog(@"JSON: %@", self.results);
                 NSLog(@"Success: %@", responseObject);
                 
                 NSArray *data = [responseObject objectForKey:@"data"];
                 NSDictionary *object = [data objectAtIndex:(arc4random_uniform(data.count - 1) + 1)];
                 NSString *imageURL = [[[object objectForKey:@"images"]objectForKey:@"original_still"]objectForKey:@"url"];
                 
                 NSData * catData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
                 self.kittyImage.image = [UIImage imageWithData:catData];


                 }

         
         
             failure:^(NSURLSessionDataTask *task, NSError *error)
         {
             // Failure
             NSLog(@"Failure: %@", error);
         }];
    
}
    
    
    
    
    
/////////////////////////////////////////////////////////
//    NSString *catFacts = [NSString stringWithFormat:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
//    
//    
//    
//    [manager GET:catFacts
//     
//      parameters:nil
//        progress:nil
//         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//             
////             self.results = [[responseObject objectForKey:@"data"] objectForKey:@"images"];
//             
//             self.results = [responseObject [@"data"]firstObject ];
//             NSLog(@"JSON: %@", self.results);
//             NSLog(@"Success: %@", responseObject);
////
//             for (NSDictionary *result in self.results) {
//                 NSString *imageURLString = [[[[result objectForKey:@"data"]objectForKey:@"images"]objectForKey:@"original"] objectForKey:@"url"];
//                 
//
////                 NSString *imageURLString = [result[@"data"] firstObject][@"images"][@"original"][@"url"];
//                 
////                 NSString *imageURLString = [result objectForKey:@"url"];
//                 NSURL *imageURL = [NSURL URLWithString:imageURLString];
//                
//                 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//                 UIImage *image = [UIImage imageWithData: imageData];
//
//                 self.kittyImage.image = image;
//
//                 
//             }
//             
//         }
//         failure:^(NSURLSessionDataTask *task, NSError *error)
//     {
//         // Failure
//         NSLog(@"Failure: %@", error);
//     }];
    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
