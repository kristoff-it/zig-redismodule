const redis = @import("./redismodule.zig");

export fn HelloWorld_Command(ctx: *redis.RedisModuleCtx, argv: [*]*redis.RedisModuleString, argc: c_int) c_int {
    _ = redis.RedisModule_ReplyWithSimpleString(ctx, c"Hello World!");
    return redis.REDISMODULE_OK;
}

export fn RedisModule_OnLoad(ctx: *redis.RedisModuleCtx, argv: [*]*redis.RedisModuleString, argc: c_int) c_int {
    if (redis.RedisModule_Init(ctx, c"testmodule", 1, redis.REDISMODULE_APIVER_1) 
        == redis.REDISMODULE_ERR) {
        return redis.REDISMODULE_ERR;
    } 

    if (redis.RedisModule_CreateCommand(ctx, c"test.hello", HelloWorld_Command, 
        c"readonly", 0, 0, 0) == redis.REDISMODULE_ERR) {
        return redis.REDISMODULE_ERR;
    }

    return redis.REDISMODULE_OK;

}

