//
//  GQLazyProperty.h
//  Pods
//
//  Created by 林国强 on 2018/12/3.
//

#ifndef GQLazyProperty
#define GQLazyProperty(cls,var) -(cls *)var{if (_##var == nil) {_##var = [cls new];}return _##var;}
#endif

#ifndef GQLazyPropertyWithInit
#define GQLazyPropertyWithInit(cls,var,code) -(cls *)var{if (_##var == nil) {_##var = [cls new];{code}}return _##var;}
#endif
