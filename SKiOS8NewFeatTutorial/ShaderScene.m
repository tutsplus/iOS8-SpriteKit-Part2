//
//  ShaderScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "ShaderScene.h"

@implementation ShaderScene

-(id)initWithSize:(CGSize)size {
    if (self == [super initWithSize:size]) {
        [self setBackgroundColor:[SKColor colorWithRed:0.15 green:0.15 blue:0.95 alpha:1.0]];
         NSLog(@"initWithSize\n");
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        
        label.text = @"Initialized by: initWithSize";
        label.fontSize = 35;
        label.fontColor = [UIColor whiteColor];
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:label];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *space = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
        space.position = CGPointMake(location.x, location.y);
        [self addChild:space];
        
        SKShader *shader = [SKShader shaderWithFileNamed:@"shader02.fsh"];
        shader.uniforms = @[ [SKUniform uniformWithName:@"myTexture" texture:[SKTexture textureWithImageNamed:@"Spaceship.png"]] ];
        space.shader = shader;
    }
}

@end