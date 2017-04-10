//
//  ViewController.m
//  day28_ios_xmlParsing
//
//  Created by Student 13 on 4/10/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *str=@"http://www.w3schools.com/xml/plant_catalog.xml";
    self.plantArray=[[NSMutableArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:str];
    
    self.saxParser=[[NSXMLParser alloc]initWithContentsOfURL:url];
    
    self.saxParser.delegate=self;
    [self.saxParser parse];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.plantArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[self.plantArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:( NSString *)elementName namespaceURI:( NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    
    self.charString=[[NSMutableString alloc]init];
}

-(void)parser:(NSXMLParser *)parser foundCharacters:( NSString *)string
{
    [self.charString appendString:string];
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:( NSString *)elementName namespaceURI:( NSString *)namespaceURI qualifiedName:( NSString *)qName
{
    [self.plantArray addObject:self.charString];
    NSLog(@"%@",self.plantArray);
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
