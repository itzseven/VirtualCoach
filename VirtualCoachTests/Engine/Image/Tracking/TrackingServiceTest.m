//
//  TrackingServiceTest.m
//  VirtualCoach
//
//  Created by Romain Dubreucq on 12/03/2016.
//  Copyright © 2016 itzseven. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TrackingService.h"

#include <io.h>
#include <labelling.h>
#include <arithmetic.h>

@interface TrackingServiceTest : XCTestCase

@end

@implementation TrackingServiceTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOverlappingOnOneSquare
{
    const char *oneSquare1filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/OneSquare/oneSquare1.pgm"] UTF8String];
    
    const char *oneSquare2filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/OneSquare/oneSquare2.pgm"] UTF8String];;
    
    const char *oneSquare3filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/OneSquare/oneSquare3.pgm"] UTF8String];;
    
    const char *oneSquare4filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/OneSquare/oneSquare4.pgm"] UTF8String];;
    
    gray8i_t *oneSquare1 = pgmopen(oneSquare1filePathC);
    
    bini_t *oneSquare1Bin = binarise(oneSquare1, 10);
    labels_t *oneSquare1Labels = label(oneSquare1Bin);
    charact_t *oneSquare1Charact = characterize(NULL, oneSquare1, oneSquare1Labels);
    
    gray8i_t *oneSquare2 = pgmopen(oneSquare2filePathC);
    
    bini_t *oneSquare2Bin = binarise(oneSquare2, 10);
    labels_t *oneSquare2Labels = label(oneSquare2Bin);
    
    int32_t reg1in2Id = [TrackingService trackRegion:oneSquare1Charact->data[0] byOverlapping:oneSquare2Labels withReferenceLabels:oneSquare1Labels];
    
    XCTAssertEqual(reg1in2Id, 1);
    
    charact_t *oneSquare2Charact = characterize(NULL, oneSquare2, oneSquare2Labels);
    
    gray8i_t *oneSquare3 = pgmopen(oneSquare3filePathC);
    
    bini_t *oneSquare3Bin = binarise(oneSquare3, 10);
    labels_t *oneSquare3Labels = label(oneSquare3Bin);
    
    int32_t reg2in3Id = [TrackingService trackRegion:oneSquare2Charact->data[0] byOverlapping:oneSquare3Labels withReferenceLabels:oneSquare2Labels];
    
    XCTAssertEqual(reg2in3Id, 1);
    
    charact_t *oneSquare3Charact = characterize(NULL, oneSquare3, oneSquare3Labels);
    
    gray8i_t *oneSquare4 = pgmopen(oneSquare4filePathC);
    
    bini_t *oneSquare4Bin = binarise(oneSquare4, 10);
    labels_t *oneSquare4Labels = label(oneSquare4Bin);
    
    int32_t reg3in4Id = [TrackingService trackRegion:oneSquare3Charact->data[0] byOverlapping:oneSquare4Labels withReferenceLabels:oneSquare3Labels];
    
    XCTAssertEqual(reg3in4Id, 1);
    
    int32_t reg1in4Id = [TrackingService trackRegion:oneSquare1Charact->data[0] byOverlapping:oneSquare4Labels withReferenceLabels:oneSquare1Labels];
    
    XCTAssertEqual(reg1in4Id, -1);
    
    
    gray8ifree(oneSquare1);
    binifree(oneSquare1Bin);
    labfree(oneSquare1Labels);
    charactfree(oneSquare1Charact);
    
    gray8ifree(oneSquare2);
    binifree(oneSquare2Bin);
    labfree(oneSquare2Labels);
    charactfree(oneSquare2Charact);
    
    gray8ifree(oneSquare3);
    binifree(oneSquare3Bin);
    labfree(oneSquare3Labels);
    charactfree(oneSquare3Charact);
    
    gray8ifree(oneSquare4);
    binifree(oneSquare4Bin);
    labfree(oneSquare4Labels);
}

- (void)testOverlappingOnTwoSquares
{
    const char *twoSquare1filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/TwoSquares/twoSquare1.pgm"] UTF8String];
    
    const char *twoSquare2filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/TwoSquares/twoSquare2.pgm"] UTF8String];;
    
    const char *twoSquare3filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/TwoSquares/twoSquare3.pgm"] UTF8String];;
    
    const char *twoSquare4filePathC = [[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/TwoSquares/twoSquare4.pgm"] UTF8String];;
    
    gray8i_t *twoSquare1 = pgmopen(twoSquare1filePathC);
    
    bini_t *twoSquare1Bin = binarise(twoSquare1, 10);
    labels_t *twoSquare1Labels = label(twoSquare1Bin);
    charact_t *twoSquare1Charact = characterize(NULL, twoSquare1, twoSquare1Labels);
    
    gray8i_t *twoSquare2 = pgmopen(twoSquare2filePathC);
    
    bini_t *twoSquare2Bin = binarise(twoSquare2, 10);
    labels_t *twoSquare2Labels = label(twoSquare2Bin);
    
    int32_t reg1in2Id = [TrackingService trackRegion:twoSquare1Charact->data[0] byOverlapping:twoSquare2Labels withReferenceLabels:twoSquare1Labels];
    
    XCTAssertEqual(reg1in2Id, 2);
    
    charact_t *twoSquare2Charact = characterize(NULL, twoSquare2, twoSquare2Labels);
    
    gray8i_t *twoSquare3 = pgmopen(twoSquare3filePathC);
    
    bini_t *twoSquare3Bin = binarise(twoSquare3, 10);
    labels_t *twoSquare3Labels = label(twoSquare3Bin);
    
    int32_t reg2in3Id = [TrackingService trackRegion:twoSquare2Charact->data[1] byOverlapping:twoSquare3Labels withReferenceLabels:twoSquare2Labels];
    
    XCTAssertEqual(reg2in3Id, 2);
    
    charact_t *twoSquare3Charact = characterize(NULL, twoSquare3, twoSquare3Labels);
    
    gray8i_t *twoSquare4 = pgmopen(twoSquare4filePathC);
    
    bini_t *twoSquare4Bin = binarise(twoSquare4, 10);
    labels_t *twoSquare4Labels = label(twoSquare4Bin);
    
    int32_t reg3in4Id = [TrackingService trackRegion:twoSquare3Charact->data[1] byOverlapping:twoSquare4Labels withReferenceLabels:twoSquare3Labels];
    
    XCTAssertEqual(reg3in4Id, 2);
    
    
    gray8ifree(twoSquare1);
    binifree(twoSquare1Bin);
    labfree(twoSquare1Labels);
    charactfree(twoSquare1Charact);
    
    gray8ifree(twoSquare2);
    binifree(twoSquare2Bin);
    labfree(twoSquare2Labels);
    charactfree(twoSquare2Charact);
    
    gray8ifree(twoSquare3);
    binifree(twoSquare3Bin);
    labfree(twoSquare3Labels);
    charactfree(twoSquare3Charact);
    
    gray8ifree(twoSquare4);
    binifree(twoSquare4Bin);
    labfree(twoSquare4Labels);
}

- (void)testTrackingOnOneSquareWithNoise
{
    NSString *imagesPath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingString:@"/Engine/Image/Tracking/OneSquareWithNoise/"];
    
    int i = 1;
    
    regchar_t *previousReg = regcharalloc(0);
    
    labels_t *previousLabels = NULL;
    
    while (i <= 10)
    {
        const char *imagePath = [[imagesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"oneQuareWithNoise%d.pgm", i]] UTF8String];
        
        gray8i_t *img = pgmopen(imagePath);
        bini_t *binary = binarise(img, 10);
        labels_t *nextLabels = label(binary);
        charact_t *ch = characterize(NULL, img, nextLabels);
        
        if (previousReg->id == 0)
        {
            uint32_t firstRegIndex = 0, firstRegSize = 0;
            
            int a = 0;
            
            for (a = 0; a < ch->count; a++)
            {
                if (ch->data[a]->size > firstRegSize)
                {
                    firstRegSize = ch->data[a]->size;
                    firstRegIndex = a;
                }
            }
            
            free(previousReg);
            previousReg = regcharcpy(ch->data[firstRegIndex]);
            previousLabels = nextLabels;
        }
        
        else
        {
            int32_t regIdFound = [TrackingService trackRegion:previousReg byOverlapping:nextLabels withReferenceLabels:previousLabels];
            
            if ((regIdFound > 0) && (regIdFound <= ch->count))
            {
                free(previousReg);
                previousReg = regcharcpy(ch->data[regIdFound-1]);
                labfree(previousLabels);
                previousLabels = nextLabels;
            }
            
            else
            {
                labfree(nextLabels);
            }
        }
        
        charactfree(ch);
        binifree(binary);
        gray8ifree(img);
        i++;
    }
    
    XCTAssertEqual(previousReg->id, 1);
}

@end