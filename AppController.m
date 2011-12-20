//
//  AppController.m
//  uppd
//
//  Created by t0rus on 16/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
//#import "JSON/JSON.h"

@implementation AppController

- (void) awakeFromNib{
	
	//Create the NSStatusBar and set its length
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];
	
	//Used to detect where our files are
	NSBundle *bundle = [NSBundle mainBundle];
	
	//Allocates and loads the images into the application which will be used for our NSStatusItem
	statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
	statusHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon-alt" ofType:@"png"]];
	
	//Sets the images in our NSStatusItem
	[statusItem setImage:statusImage];
	[statusItem setAlternateImage:statusHighlightImage];
	
	//Tells the NSStatusItem what menu to load
	[statusItem setMenu:statusMenu];
	//Sets the tooptip for our item
	[statusItem setToolTip:@"My Custom Menu Item"];
	//Enables highlighting
	[statusItem setHighlightMode:YES];
}

- (void) dealloc {
	//Releases the 2 images we loaded into memory
	[statusImage release];
	[statusHighlightImage release];
	[super dealloc];
}

-(IBAction)capScreen:(id)sender{
	//takes screenshot
	NSBundle *bundle = [NSBundle mainBundle];
	
	NSTask *task;
	task = [[NSTask alloc] init];
	[task setLaunchPath: [bundle pathForResource:@"screencap" ofType:nil]];
	//arguments -i testScreen.png
	NSArray *arguments;
	arguments = [NSArray arrayWithObjects: @"-i", @"testScreen.png", nil];
	[task setArguments: arguments];
	
	NSPipe *pipe;
	pipe = [NSPipe pipe];
	[task setStandardOutput: pipe];
	
	NSFileHandle *file;
	file = [pipe fileHandleForReading];
	
	[task launch];
	
	NSData *data;
	data = [file readDataToEndOfFile];
	
	NSString *string;
	string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
	//NSLog (@"cmd returned:\n%@", string);
	
	[string release];
	[task release];
}
-(IBAction)openSettings:(id)sender{
	//GET REQUEST
	//NSURL *url = [ NSURL URLWithString: [ NSString stringWithFormat: @"http://localhost/apps/upd"] ];
	//NSString *test = [NSString stringWithContentsOfURL:url];
	//END GET REQUEST
	
	//NSLog(test);
}



@end