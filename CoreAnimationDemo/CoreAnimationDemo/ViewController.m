//
//  ViewController.m
//  CoreAnimation
//
//  Created by fanghe on 2021/2/9.
//

#import "ViewController.h"

@interface Model : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Class clz;
@end

@implementation Model
@end

static NSString * const kReuseID = @"kReuseID";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<Model *> *items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    
    self.items = [NSMutableArray array];
    {
        Model *model = [[Model alloc] init];
        model.title = @"UIView 动画";
        model.clz = NSClassFromString(@"UIViewAnimationVC");
        [self.items addObject:model];
    }
    
    {
        Model *model = [[Model alloc] init];
        model.title = @"UIView 转场动画";
        model.clz = NSClassFromString(@"TransitionAnimationVC");
        [self.items addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseID];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    Model *model = [self.items objectAtIndex:indexPath.item];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = [self.items objectAtIndex:indexPath.item];
    Class clz = model.clz;
    [self.navigationController pushViewController:[[clz alloc] init] animated:YES];
}


@end
