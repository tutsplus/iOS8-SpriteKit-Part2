//
//  SceneKitScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "SceneKitScene.h"

#include <SceneKit/SceneKit.h>

@implementation SceneKitScene

-(void)didMoveToView:(SKView *)view {
    
    [self setBackgroundColor:[SKColor greenColor]];
    
    SCNScene *shipScene = [SCNScene sceneNamed:@"ship.dae"];
    
    // Example 1 - Importing external file - Simple
    SK3DNode *sk3DNodeFist = [[SK3DNode alloc] initWithViewportSize:CGSizeMake(300, 300)];
    [sk3DNodeFist setPosition:CGPointMake(200,300)];
    [sk3DNodeFist setScnScene:shipScene];
    [self addChild:sk3DNodeFist];
    
    // Example 2 - Complex SCNScene
    SK3DNode *sk3DNode = [[SK3DNode alloc] initWithViewportSize:CGSizeMake(400, 400)];
    [sk3DNode setPosition:CGPointMake(150,200)];
    
    SCNScene *sceneObject = [SCNScene scene];
    
    // Camera
    SCNCamera *camera = [SCNCamera camera];
    SCNNode *cameraNode = [SCNNode node];
    [cameraNode setCamera:camera];
    [cameraNode setPosition:SCNVector3Make(0, 0, 40)];
    [sceneObject.rootNode addChildNode:cameraNode];
    
    // Light
    SCNLight *spotLight = [SCNLight light];
    [spotLight setType:SCNLightTypeDirectional];
    [spotLight setColor:[SKColor redColor]];
    
    SCNNode *spotLightNode = [SCNNode node];
    [spotLightNode setLight:spotLight];
    [spotLightNode setPosition:SCNVector3Make(0, 0, 5)];
    [cameraNode addChildNode:spotLightNode];
    [sceneObject.rootNode addChildNode:spotLightNode];
    
    // Geometry definition
    SCNTorus *torus= [SCNTorus torusWithRingRadius:13 pipeRadius:1.5];
    SCNNode *torusNode = [SCNNode nodeWithGeometry:torus];
    [torusNode setTransform:SCNMatrix4MakeRotation(M_PI / 3, 0, 1, 0)];
    [sceneObject.rootNode addChildNode:torusNode];
    
    [sk3DNode setScnScene:sceneObject];
    [self addChild:sk3DNode];
    
    // Animation
    CABasicAnimation *torusRotation = [CABasicAnimation animationWithKeyPath:@"rotation"];
    torusRotation.byValue = [NSValue valueWithSCNVector4:SCNVector4Make(1, 1, 0, 4.0*M_PI)];
    [torusRotation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [torusRotation setRepeatCount:INFINITY];
    [torusRotation setDuration:5.0];
    
    [torusNode addAnimation:torusRotation forKey:nil];
}

@end
