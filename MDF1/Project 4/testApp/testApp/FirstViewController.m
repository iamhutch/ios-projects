//
//  FirstViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/14/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "FirstViewController.h"
#import "xmlItem.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize detailView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"10-Day Forecast", @"10-Day Forecast");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    numItems = 0;
    forecasts = [[NSMutableArray alloc] init];

    
    // create url
    url = [[NSURL alloc] initWithString:@"http://lucyhutcheson.com/forecast.xml"];
    
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    requestData = [NSMutableData data];
    
    // Load xml data
    xmlData = [self GetFileDataFromFile:@"forecast.xml"];


    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    if (parser != nil)
    {
        [parser setDelegate:self];
        [parser parse];
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // check if we have valid data
    if (data !=nil)
    {
        // add this data to our existing requestData
        [requestData appendData:data];
    }
}

// this function is called when we have all the data from the request
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        // get the path to the application documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        if (documentsDirectory != nil)
        {
            // string for file path and file name = "path/to/documents/folder/index.htm"
            NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"forecast.xml"];
            if (fullPath != nil)
            {
                // save to file
                [requestData writeToFile:fullPath atomically:true];
            }
        }
        //NSLog(@"%@", requestString);
    }
}


// Parse the data from our XML file
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    // parsing Forecast tag
    if ([elementName isEqualToString:@"Forecast"])
    {
        NSString *numItemsStr = [attributeDict valueForKey:@"NumItems"];
        if (numItemsStr  != nil)
        {
            numItems = [numItemsStr intValue];
        }
    }
    // Save Forecasts
    else if ([elementName isEqualToString:@"ForecastDay"])
    {
        NSString *name = [attributeDict valueForKey:@"Name"];
        NSString *description = [attributeDict valueForKey:@"Description"];
        NSString *image = [attributeDict valueForKey:@"Image"];
        NSString *shortdesc = [attributeDict valueForKey:@"Short"];
        
        
        xmlItem *item = [[xmlItem alloc] initWithName:name itemDesc:description itemImage:image shortDesc:shortdesc];
        if (item != nil)
        {
            [forecasts addObject:item];
        }
    }
}

// Get the data from our file function
- (NSData*)GetFileDataFromFile:(NSString*)filename
{
    NSString *filePath = nil;
    
    // create the filemanager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // get the path to the application documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES     );
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // create the full path to the data file
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    
    // does the path and filename exist?
    if ([fileManager fileExistsAtPath:filePath])
    {
        NSLog(@"valid file found");
        
        // returns back the NSData for the file
        return [NSData dataWithContentsOfFile:filePath];
    }
    
    return nil;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return forecasts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    xmlItem *itemName = [forecasts objectAtIndex:indexPath.row];
   
    NSString *day = [itemName valueForKey:@"name"];
    //NSLog(@"name %@", day);
    cell.textLabel.text = day;
    return cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    xmlItem *itemName = [forecasts objectAtIndex:indexPath.row];
    
    // Pull the related information for the selected client
    NSString *selectedDay = [itemName valueForKey:@"name"];
    NSString *selectedDesc = [itemName valueForKey:@"desc"];
    NSString *selectedShort = [itemName valueForKey:@"shortDesc"];

    //NSString *selectedImage = [itemName valueForKey:@"image"];
    
    //this is the output for the detail view
    NSString *displayText = [[NSString alloc] initWithFormat: @"Day:\n%@ \n\nShort Description: \n%@ \n\nForecast: \n%@ ", selectedDay, selectedShort, selectedDesc];
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    self.detailView = myDetailView;
    
    // Setup text information for display
    detailView.textSelected = displayText;
    
    // Pull up my detail view
    [self presentViewController:myDetailView animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
