//
//  AppDelegate.m
//  ImageHosting
//
//  Created by chars on 16/8/16.
//  Copyright © 2016年 chars. All rights reserved.
//

#import "AppDelegate.h"
#import "IHPreferencesWindowController.h"
#import "IHUploadWindowController.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) NSMenu *statusMenu;
@property (strong) IHPreferencesWindowController *preferencesWindowController;
@property (strong) IHUploadWindowController *uploadWindowController;

@end

@implementation AppDelegate

- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:_statusItem];
}

- (NSStatusItem *)statusItem
{
    if (!_statusItem) {
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [_statusItem setImage:[NSImage imageNamed:@"logo"]];
        [_statusItem setHighlightMode:YES];
    }
    return _statusItem;
}

- (NSMenu *)statusMenu
{
    if (!_statusMenu) {
        _statusMenu = [[NSMenu alloc] initWithTitle:@""];
        [_statusMenu addItemWithTitle:@"Upload" action:@selector(uploadMenuAction) keyEquivalent:@"u"];
        [_statusMenu addItemWithTitle:@"Perferences" action:@selector(perferencesMenuAction) keyEquivalent:@","];
        [_statusMenu addItemWithTitle:@"Instruction" action:@selector(instructionMenuAction) keyEquivalent:@""];
        [_statusMenu addItemWithTitle:@"Quit" action:@selector(quitMenuAction) keyEquivalent:@"q"];
    }
    return _statusMenu;
}

- (void)uploadMenuAction
{
    [self.uploadWindowController showWithCompletionHandler:nil];
}

- (void)perferencesMenuAction
{
    [self showPreferences:nil];
}

- (void)instructionMenuAction
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://charsdavy.github.io"]];
}

- (void)quitMenuAction
{
    [NSApp terminate:self];
}

- (IBAction)showPreferences:(id)sender
{
    [self.preferencesWindowController showWithCompletionHandler:nil];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self.statusItem setMenu:self.statusMenu];
    
    if (!self.preferencesWindowController) {
        self.preferencesWindowController = [[IHPreferencesWindowController alloc] init];
    }
    
    if (!self.uploadWindowController) {
        self.uploadWindowController = [[IHUploadWindowController alloc] init];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

@end
