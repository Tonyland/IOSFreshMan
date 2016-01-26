//
//  BreakingNews.m
//  NewsClient
//
//  Created by maoxiaojun on 16/1/24.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "BreakingNews.h"

@interface BreakingNews ()

@property (nonatomic,strong) NSArray *sectionTitle;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *imageArray;

@end

@implementation BreakingNews

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tabBarItem.title = @"新闻头条";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"新闻头条";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;//在页面出现时取消cell被选中以后的高亮状态
    [self createGestureRecognizer];
    
    //初始化要用到的数据
    _sectionTitle = @[@"实时动态",@"开心一下"];//这是一个一维数组
    _titleArray   = @[@[@"国际",@"国内",@"社会",@"公益",@"城市"],
                      @[@"图片",@"音乐",@"视频",@"百科",@"军事",@"历史"]];//这是一个二维数组
    _imageArray = @[@"happy.png",@"toutiao.png"];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//确定tableView分成几个单元
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//确定tableView中每一个单元包含几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowsForSection = 0;
    if (section==0){
        rowsForSection = 5;
        
    }else if (section==1){
        rowsForSection = 6;
    }
    
    return rowsForSection;
}


#pragma mark - Table view delegate
//代理方法 决定每一个cell显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //单元格较少时采用这种方法初始化
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //单元格较多时采用这种方法初始化，比如有几十个甚至更多
    NSString *cellIdentifier = @"cellReuseTag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = _titleArray[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.section]];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.detailTextLabel.text = @"中国最冷村气温-58℃靠火墙御寒 室内外温差60度";
                break;
            case 1:
                cell.detailTextLabel.text = @"孔雀遛弯冻僵街头，猫躲绵羊身上取暖 用图告诉你霸王级寒潮有多冷";
                break;
            case 2:
                cell.detailTextLabel.text = @"［包邮］艺凡花艺绿植盆栽绿萝水培植物办公桌绿色盆景 吊兰带盆栽好小盆";
                break;
                
            default:
                cell.detailTextLabel.text = @"天安门雪雕现长春 雪雕制作过程大揭秘";
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                cell.detailTextLabel.text = @"我很想知道，当我的名字滑过你耳朵，你脑海中会闪现些什么。";
                break;
            case 1:
                cell.detailTextLabel.text = @"1月5日，在长春市南湖公园内，一座“天安门”雪雕吸引众多市民拍照留念。现场小朋友欢快不已，形象逼真让人难辨真假";
                break;
            case 2:
                cell.detailTextLabel.text = @"泰国官员23号表示，南部沿海地区发现疑似飞机碎片，有猜测碎片可能属于2014年失联的马航MH370客机。";
                break;
                
            default:
                cell.detailTextLabel.text = @"中国挑战全球芯片行业 准备投入千亿美元";
                break;
        }
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionTitle[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 25;
    }else
    {
        return 30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


- (void)createGestureRecognizer {
    //横扫手势识别器
    UISwipeGestureRecognizer *rightToLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightToLeftSwipeHandle:)];
    //设置手势识别器属性（扫动方向）
    rightToLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    //注册手势识别器
    [self.view addGestureRecognizer:rightToLeft];
}
#pragma mark 识别手势方法

-(void)rightToLeftSwipeHandle:(UISwipeGestureRecognizer *)recognizer
{
    self.tabBarController.selectedIndex = 1;
    NSLog(@"最新消息左滑");
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
