//
//  JJCFViewController.m
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "JJCFViewController.h"
#import "Posts.h"
#import "PostsTableViewCell.h"

@interface JJCFViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *posts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JJCFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *posts = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        Posts *post = [[Posts alloc]initWithUserName:@"Jeff" title:@"Title" content:@"Content" timeStamp:[NSDate date]];
        [posts addObject:post];
    }
    self.posts = posts;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostsCell" forIndexPath:indexPath];
    
    Posts *post = [self.posts objectAtIndex:indexPath.row];
    
    [PostsTableViewCell setPost:post];
    
    return cell;
}

@end
