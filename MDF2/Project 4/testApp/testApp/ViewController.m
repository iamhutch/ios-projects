//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/25/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "MovieListingCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize detailView, movieList;

- (void)viewDidLoad
{
    // Setup movie data
    movieList = [[NSMutableArray alloc] init];
    NSArray *keys = [[NSArray alloc] initWithObjects:@"movieName", @"showTime", @"imageURL", @"trailer", nil];

    // 15 movies and info
    NSDictionary *mov1 = [NSDictionary dictionaryWithObjects:@[
                          @"Grace Card",
                          @"11:00 AM, 1:00 PM, 3:00 PM",
                          @"https://lh6.googleusercontent.com/public/-f8Fa2rPvbhUGKIlgxXmEXcpzTestHKKEMWKmUpvOtA1zpKAkMWLZJj-a9wWCDLGkYVL_5uW5iJ047dhkeCV8M2zB8L-8EXtx4KkhQl11M6PAKqM_fAeA49vp_-L_HtBYaQZTgUM_ro97hWx9nc1Poc=s90-c",
                          @"http://trailers.apple.com/movies/wb/thehobbit1/hobbit-clip1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov2 = [NSDictionary dictionaryWithObjects:@[
                          @"Forgiven",
                          @"11:15 AM, 1:15 PM, 3:15 PM",
                          @"https://lh6.googleusercontent.com/public/bHCNAg_S3U_IVyI3nHTXELMDKNpMtMAQMWa22n4n670STs-MRYHOOAGl87vAZXF4R0gAw_f-ZR7dKUsSwuj5AwD5f37Gu661RsPlvbbZPqmBt3URAO4r8Jq_Hg24BISh1I5amH0hoBrk6EmTHE9ijws=s90-c",
                          @"http://trailers.apple.com/movies/wb/thehobbit1/thehobbit-tlr1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov3 = [NSDictionary dictionaryWithObjects:@[
                          @"Mighty Macs",
                          @"11:30 AM, 1:30 PM, 3:30 PM",
                          @"https://lh5.googleusercontent.com/public/XNvnWB39BxskAAh1o3kDLWfu_-bJd6FoMCdjeFnsqPK1SLwNaJN_hwn0_w-rlgUK7vpO0J9hc7NMhZL1PzExUuPaDXMUwgHlzjjY_XiY2JiU1VhA0OB8lT9TwNETr2DmNYbb_rPCbr2a3Cwguwt-xwI=s90-c",
                          @"http://trailers.apple.com/movies/disney/wreckitralph/wreckitralph-fte1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov4 = [NSDictionary dictionaryWithObjects:@[
                          @"Monumental",
                          @"11:45 AM, 1:45 PM, 3:45 PM",
                          @"https://lh5.googleusercontent.com/public/TbsUAQWRkJMANj8PJDDfqU3dX6ID1cNn12ZJl421WcBiAp_LhcGgVvgsYptUhIPqy53CkNNt1czgljmSO-wtHh4UoRPVkNFxTrZ-1UCAs3CxWyK-HUUUp2GtNxU1y6fap1Zf_4HW2qLXLSMlkAM6Es8=s90-c",
                          @"http://trailers.apple.com/movies/disney/wreckitralph/wreckitralph-tlr2_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov5 = [NSDictionary dictionaryWithObjects:@[
                          @"Love Takes Wing",
                          @"12:00 PM, 2:00 PM, 4:00 PM",
                          @"https://lh4.googleusercontent.com/public/sX2TxyhCvjBwNcEU8jyOUhmwa8RUTt0YxHW83Zhit6D2MzB1OC0R6c2jrEMgW1pg7bFMZ4SBLCuBh1OmQTXbxWijv2qvg6KPeCAazMK7g58uDEC8A6nu4GUsLzSEx5eTkh8rbXKpFUsgVZaHop6UX8E=s90-c",
                          @"http://trailers.apple.com/movies/independent/delhisafari/delhisafari-tlr1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov6 = [NSDictionary dictionaryWithObjects:@[
                          @"We Bought a Zoo",
                          @"12:15 PM, 2:15 PM, 4:15 PM",
                          @"https://lh6.googleusercontent.com/public/PApFGM6hBuwBgtm72X6mp-NllfZTz9mKs43MjP2wFYK_AyFdD19ZsPEU7Ko4y7OWsDgVZsPsc3gecRvwcUmehR60purZO7TuAmIxNxSfpCnQ5Ba1OLz7nN_Y7Rc6QeXoXbU6rwjGVUjBkg6nbOeJwoc=s90-c",
                          @"http://trailers.apple.com/movies/disney/planes/planes-tlr1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov7 = [NSDictionary dictionaryWithObjects:@[
                          @"Encounter",
                          @"12:30 PM, 2:30 PM, 4:30 PM",
                          @"https://lh5.googleusercontent.com/public/XimMaFmVnwqRzKI0gBpfi8LJJgf1RkSyWC3dUKizapPQYorHyBosSQJpJ-dMqjHIYpw76QLmH3pJs9ZmgeleKCB5TPK1dCy3C12O4dtt6tcszjdngJcsYr_ZfiJB0t-sXz_lA6IkLnVIKIbCVsVViB8=s90-c",
                          @"http://trailers.apple.com/movies/weinstein/escapefromplanetearth/escapefromplanetearth-fte1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov8 = [NSDictionary dictionaryWithObjects:@[
                          @"October Baby",
                          @"12:45 PM, 2:45 PM, 4:45 PM",
                          @"https://lh5.googleusercontent.com/public/dYsxDMKDxJncnblIMeECD76ewbGYexldIzrELPt-d8JIFcdLJ_nfX__2caMEouCQzWSaLn5nCSiZ6aaM_g90pR4etFAEkNPFd2VZIYM5ZzDQEOCmBpAAvR_SPwTv4G0c4_qIpgbxB9OIWS-X4MTXpRU=s90-c",
                          @"http://trailers.apple.com/movies/weinstein/escapefromplanetearth/escapefromplanetearth-tlr1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov9 = [NSDictionary dictionaryWithObjects:@[
                          @"Unconditional",
                          @"1:00 PM, 3:00 PM, 5:00 PM",
                          @"https://lh6.googleusercontent.com/public/lH4-pflx983-dEiZ4bQhttTuT6vn7gf-yXggUKc3Mgi5enDdSwv6P_J3CEAPSH3LzbAglanmzHMFveWXP2piSNHS3L4nBsF88JmyyPU8snNL9-ECbtpr7BznMpxhTIBw2C1-GiSzvXoRPnHCLi-Nv8Y=s90-c",
                          @"http://trailers.apple.com/movies/independent/fromuponpoppyhill/fromuponpoppyhill-tlr1_h320.mov"
                          ] forKeys:keys];
    NSDictionary *mov10 = [NSDictionary dictionaryWithObjects:@[
                           @"Gifted Hands",
                           @"1:15 PM, 3:15 PM, 5:15 PM",
                           @"https://lh6.googleusercontent.com/public/cYb-2a0BKtSuY5ktZUDrom-LX5GwQleJ2dilKyBbCMdHP3LOgdLSX5_byPfCvbbgKQb1o-ZBDgkfU_WnKzqymWucysu4e4whkiAhH-QIWmm1wZGH8zl-dT63Fy3vUws3Stb74n6MWL6E6TaUjapufBk=s90-c",
                           @"http://trailers.apple.com/movies/independent/horridhenry/horridhenry-tlr1_h320.mov"
                           ] forKeys:keys];
    NSDictionary *mov11 = [NSDictionary dictionaryWithObjects:@[
                           @"Hachi: A Dogs Tale",
                           @"1:30 PM, 3:30 PM, 5:30 PM",
                           @"https://lh5.googleusercontent.com/public/DJ4G05K4vOU_N1Dqt6IMSzg0b89gZyxZnlgMM3VhisVLcLdJjrsB5pnok2uioUCZUOLuoBwIlALM5hLOk2iQubfZORdIB0-DYqBiITUJ-96uLFkYoi18q1LMUnl2bh_pdIK8AKHORo4XFz0gArywxg4=s90-c",
                           @"http://trailers.apple.com/movies/dreamworks/turbo/turbo-tlr2_h320.mov"
                           ] forKeys:keys];
    NSDictionary *mov12 = [NSDictionary dictionaryWithObjects:@[
                           @"Courageous",
                           @"1:45 PM, 3:45 PM, 5:45 PM",
                           @"https://lh6.googleusercontent.com/public/gYoY8_Rsazp6v5CwfXJwsu5rryrmKv66hYotTRYU5wE0ml7HnFYQv06gKcBcT6rrrlRmfewT92WdRBEYY5OMj0ovAwdA7AIDFja-KtZcbYm9U5hbOJa1IklJKLyz2drVi4r0FdqPM8Tc9gqVRZ3XPDo=s90-c",
                           @"http://trailers.apple.com/movies/dreamworks/turbo/turbo-tlr1_h320.mov"
                           ] forKeys:keys];
    NSDictionary *mov13 = [NSDictionary dictionaryWithObjects:@[
                           @"Soul Surfer",
                           @"2:00 PM, 4:00 PM, 6:00 PM",
                           @"https://lh5.googleusercontent.com/public/L9xd5FxzKbZ24Y8BdmFpWgZbSTrmRlzEG6ghaSsyNNRJBQ8w6KOF7bAGz8dbFex_npdT0WPUiFRgs78pxtxn6PH48n8klJ-fRk2mu0OObniXbcNAaiO35vQWtprhkztGqKSE_sT8zKhFX-gjesJjiG4=s90-c",
                           @"http://trailers.apple.com/movies/disney/wreckitralph/wreakitralph-tlr1_h320.mov"
                           ] forKeys:keys];
    NSDictionary *mov14 = [NSDictionary dictionaryWithObjects:@[
                           @"Left Behind",
                           @"2:15 PM, 4:15 PM, 6:15 PM",
                           @"https://lh3.googleusercontent.com/public/3PDebpe4dX6_HbtH4k5FrL1hAMZShVSQImH1pAmqEVdIG3ouoJSv0OmQHzLodJxJ6GibkKcC32jXAbt7vNf6xCB0MGhQsOg6sPg-1H52vwqS_J6sOMwlAPcTGRNMrwFmHsjdcJvs0zVq0eKaaei-Ir6s=s90-c",
                           @"http://trailers.apple.com/movies/focus_features/admission/admission-momitsme_h320.mov"
                           ] forKeys:keys];
    NSDictionary *mov15 = [NSDictionary dictionaryWithObjects:@[
                           @"Voyage of the Dawn Treader",
                           @"2:30 PM, 4:30 PM, 6:30 PM",
                           @"https://lh3.googleusercontent.com/public/SmzcId_R4gs2nmcuMXhmA0NC1BOPiGjGzQSz_SK4kiCa4gOqlP5MfRfvAUeOeCcuJs79FYYlgtYOas-nCDwxPM8f5gT2V-2tKAgTwz1ErGu-hE58aC3DthoDc-ap4KAbxtyDb63XGp1xr_2uICw58BI=s90-c",
                           @"http://trailers.apple.com/movies/focus_features/admission/admission-fte1_h320.mov"
                           ] forKeys:keys];

    NSArray *theaterOne = [NSArray arrayWithObjects:mov1, mov2, mov3, mov4, mov5, nil];
    NSArray *theaterTwo = [NSArray arrayWithObjects:mov6, mov7, mov8, mov9, mov10, nil];
    NSArray *theaterThree = [NSArray arrayWithObjects:mov11, mov12, mov13, mov14, mov15, nil];
    
    [movieList addObject:theaterOne];
    [movieList addObject:theaterTwo];
    [movieList addObject:theaterThree];
  
   


    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title= @"Movie Showtimes";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewWillAppear:animated ];
	// Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dictionary = [movieList objectAtIndex:section];
    return [dictionary count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [movieList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MovieListingCell *newCell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (newCell == nil)
    {
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MovieListingCell" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[UITableViewCell class]])
            {
                newCell = (MovieListingCell*)view;
                NSDictionary *dictionary = [movieList objectAtIndex:indexPath.section][indexPath.row];
                newCell.movieLabel.text = [dictionary  objectForKey:@"movieName"];
                newCell.showtimeLabel.text = [dictionary  objectForKey:@"showTime"];
                
                NSURL *url = [NSURL URLWithString:[dictionary  objectForKey:@"imageURL"]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *img = [[UIImage alloc] initWithData:data];
                newCell.movieImageView.image = img;
            }
        }
    }
    return newCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, myTableView.frame.size.width, 100.0f)];
    [headerView setBackgroundColor:[UIColor colorWithRed:0.588 green:0.082 blue:0.341 alpha:1] /*#961557*/
];

    if (section == 0)
    {
        // Setup image
        NSURL *url = [NSURL URLWithString:@"http://profile.ak.fbcdn.net/hprofile-ak-frc1/c11.11.160.160/554560_557825727570277_364246030_n.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.frame = CGRectMake(10.0f,10.0f,myTableView.frame.size.width/4,50.0f);        
        [headerView addSubview:imageView];
        
        // Setup labels
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 10.0f, myTableView.frame.size.width*0.8, 30.0f)];
        labelView.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        labelView.text = @" Cove Theater";
        [headerView addSubview:labelView];

        UILabel *locationView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 40.0f, myTableView.frame.size.width*0.8, 20.0f)];
        [locationView setFont:[UIFont systemFontOfSize:9]];
        locationView.text = @"402 Constitution Dr, Copperas Cove, TX 76522";
        [headerView addSubview:locationView];

    }
    else if (section == 1)
    {
        // Setup image
        NSURL *url = [NSURL URLWithString:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNUdADBy_cNQ9iw0qIC9jyC4bTO1grjr-0uF5RJ0ejbkufXyI"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.frame = CGRectMake(10.0f,10.0f,myTableView.frame.size.width/4,50.0f);
        [headerView addSubview:imageView];

        // Setup labels
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 10.0f, myTableView.frame.size.width*0.8, 30.0f)];
        labelView.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        labelView.text = @" Killeen Theater";
        [headerView addSubview:labelView];
        
        UILabel *locationView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 40.0f, myTableView.frame.size.width*0.8, 20.0f)];
        [locationView setFont:[UIFont systemFontOfSize:9]];
        locationView.text = @"2501 E Central Texas Expy, Killeen, TX 76549";
        [headerView addSubview:locationView];

    }
    else if (section == 2)
    {
        // Setup image
        NSURL *url = [NSURL URLWithString:@"http://api.ning.com/files/vqigXGRecFfvc3IxtoPTOs34PibUTC658K-U19IFaEHERiONbIe2fvZqOowGL0aSf9vQkMGYFQ2qwf**dhyqK7p-L59VxEU8/cinemark_logo_onblack.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.frame = CGRectMake(10.0f,10.0f,myTableView.frame.size.width/4,50.0f);
        [headerView addSubview:imageView];
        
        // Setup labels
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 10.0f, myTableView.frame.size.width*0.8, 30.0f)];
        labelView.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        labelView.text = @" Heights Theater";
        [headerView addSubview:labelView];

        UILabel *locationView = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 40.0f, myTableView.frame.size.width*0.8, 20.0f)];
        [locationView setFont:[UIFont systemFontOfSize:9]];
        locationView.text = @"201 E. Central Texas Expy, Harker Heights, TX 76548";
        [headerView addSubview:locationView];

    }

    return headerView;
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 70;
}


- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Pull the related information for the selected movie
    NSDictionary *dictionary = [movieList objectAtIndex:indexPath.section][indexPath.row];    

    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup info for display
    detailView.selectedTitle = [dictionary  objectForKey:@"movieName"];
    detailView.selectedTimes = [dictionary  objectForKey:@"showTime"];
    detailView.selectedImage = [dictionary  objectForKey:@"imageURL"];
    detailView.selectedTrailer = [dictionary objectForKey:@"trailer"];
    
    // Pull up my detail view    
    [self.navigationController pushViewController:myDetailView animated:true];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
