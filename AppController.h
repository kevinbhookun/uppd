//
//  AppController.h
//  uppd
//
//  Created by t0rus on 16/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	/* Our outlets which allow us to access the interface */
	IBOutlet NSMenu *statusMenu;
	
	/* The other stuff :P */
	NSStatusItem *statusItem;
	NSImage *statusImage;
	NSImage *statusHighlightImage;
}

/* Our IBAction which will call the helloWorld method when our connected Menu Item is pressed */
-(IBAction)capScreen:(id)sender;

-(IBAction)openSettings:(id)sender;


@end
