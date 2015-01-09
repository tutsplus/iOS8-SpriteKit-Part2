//
//  PhysicsScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "PhysicsScene.h"

@implementation PhysicsScene {
    SKFieldNode *magneticFieldNode;
}

-(void)didMoveToView:(SKView *)view {
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self.physicsWorld setGravity:CGVectorMake(0, -9)];
    [self setPhysicsBody:physicsBody];
    
    magneticFieldNode = [SKFieldNode magneticField];
    [magneticFieldNode setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:80]];
    [magneticFieldNode setPosition:CGPointMake(100, 100)];
    [magneticFieldNode setStrength:3];
    [self addChild:magneticFieldNode];
    
    for (int i = 0; i < 300; i++) {
        SKSpriteNode *node4 = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"wood.png"] size:CGSizeMake(25, 25)];
        [node4 setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 25)]];
        [node4 setPosition:CGPointMake(arc4random()%640, arc4random()%950)];
        [node4.physicsBody setDynamic:YES];
        [node4.physicsBody setAffectedByGravity:YES];
        [node4.physicsBody setAllowsRotation:true];
        [node4.physicsBody setMass:0.9];
        
        [self addChild:node4];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        [magneticFieldNode setPosition:[touch locationInNode:self]];
    }
}

@end
