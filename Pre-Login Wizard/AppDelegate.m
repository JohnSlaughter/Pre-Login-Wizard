//
//  AppDelegate.m
//  Pre-Login Wizard
//
//  Copyright 2013 John W. Slaughter, Jr.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.


#import "AppDelegate.h"

@implementation AppDelegate

#pragma mark - Synthesized properties
@synthesize raceTrack, view0, view1, view2, view3;


#pragma mark - Application Methods


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // There are some LoginWindow issues to deal with
    [[self window] setCanBecomeVisibleWithoutLogin:YES];
    [[self window] setHidesOnDeactivate:NO];
}

- (void)awakeFromNib
{
    // Make the window frame the same size as the main screen
    NSRect windowFrame = [[self window] frame];
    windowFrame.size.height = [[NSScreen mainScreen] frame].size.height;
    windowFrame.size.width = [[NSScreen mainScreen] frame].size.width;
	windowFrame.origin.x = (double)0;
	windowFrame.origin.y = (double)0;
    [[self window] setFrame:windowFrame display:YES animate:NO];
    
    // Prepare a pallet (our race track) for the view animations
    contentView = [self raceTrack];
    [contentView setWantsLayer:YES];
    
    // Set up our animator
    transition = [CATransition animation];
    animation = [NSDictionary dictionaryWithObject:transition forKey:@"subviews"];
    [contentView setAnimations:animation];
    
    // Make sure we're the front-most window
    [[self window] makeKeyAndOrderFront:self];
    [[self window] orderFrontRegardless];
}

- (void)dealloc
{
    [contentView release];
    [transition release];
    [animation release];
    [super dealloc];
}

#pragma mark - Methods to handle view changes

- (IBAction)zeroToOne:(id)sender
{
    // Set the type of transition to use
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    
    // Set the new view's frame origin, otherwise the new view won't necessarily appear exactly where the old one was
    [self.view1 setFrameOrigin:self.view0.frame.origin];
    
    // Tell the animator to swap the two views
    [[contentView animator] replaceSubview:self.view0 with:self.view1];
}

- (IBAction)oneToTwo:(id)sender
{
    // Set the type of transition to use
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    
    // Set the new view's frame to whatever the old was was, so they line up
    [self.view2 setFrame: self.view1.frame];

    //  Tell the animator to swap the two views
    [[contentView animator] replaceSubview:self.view1 with:self.view2];
}

- (IBAction)twoToThree:(id)sender
{    
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    
    [self.view3 setFrame: self.view2.frame];
    
    [[contentView animator] replaceSubview:self.view2 with:self.view3];
}

- (IBAction)twoToOne:(id)sender
{    
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromLeft];
    
    [self.view1 setFrame: self.view2.frame];
    
    [[contentView animator] replaceSubview:self.view2 with:self.view1];
}

@end
