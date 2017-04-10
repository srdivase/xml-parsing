//
//  ViewController.h
//  day28_ios_xmlParsing
//
//  Created by Student 13 on 4/10/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property NSMutableString *charString;
@property NSMutableArray *plantArray;
@property NSXMLParser *saxParser;

@end

