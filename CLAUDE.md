# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## QuickJS Overview

QuickJS is a small and embeddable JavaScript engine designed to support the latest ECMAScript specifications. It was originally created by Fabrice Bellard and Charlie Gordon, and this repository is a fork maintained by the community after the original project went dormant.

Key features:
- Lightweight JavaScript engine
- ECMAScript compliance
- Bytecode compiler
- Small footprint
- Embeddable in C applications

## Build Commands

### Basic Build
```bash
# Build all targets (qjs, qjsc, run-test262)
make

# Build with debug information
make debug

# Clean build files
make clean

# Completely remove build directory
make distclean
```

### Specific Targets
```bash
# Build qjs interpreter only
cmake --build build --target qjs_exe -j $(nproc)

# Build qjsc compiler only
cmake --build build --target qjsc -j $(nproc)

# Build the amalgamated version (single C file)
make amalgam
```

### Installing
```bash
# Install to system (default: /usr/local)
make install

# Install to custom location
INSTALL_PREFIX=/custom/path make install
```

## Testing

```bash
# Run internal tests
make test

# Run test262 (ECMAScript test suite)
make test262

# Run faster subset of test262
make test262-fast

# Update test262 expected results
make test262-update

# Run a microbenchmark
make microbench
```

## Using the CLI Tools

### qjs - JavaScript Interpreter
```bash
# Run a JavaScript file
build/qjs script.js

# Run a JavaScript module
build/qjs --module module.js

# Interactive REPL
build/qjs -i

# Evaluate JavaScript expression
build/qjs -e "console.log('Hello World')"

# Include standard library modules
build/qjs --std script.js
```

### qjsc - JavaScript Compiler
```bash
# Compile a script to a standalone executable
build/qjsc -e -o output.c input.js

# Compile a module
build/qjsc -e -o output.c -m input.js

# Create a native module
build/qjsc -e -o output.c -M module_name,cname -m input.js
```

## Code Architecture

### Core Components

1. **Runtime and Contexts**
   - `JSRuntime`: Represents the JavaScript runtime (object heap)
   - `JSContext`: Represents a JavaScript context with its own global objects

2. **Core Files**
   - `quickjs.c/h`: Main engine implementation
   - `quickjs-libc.c/h`: Standard library implementation
   - `libregexp.c/h`: Regular expression engine
   - `libunicode.c/h`: Unicode support
   - `cutils.c/h`: C utilities

3. **Bytecode Execution**
   - Stack-based bytecode with no intermediate representation
   - Maximum stack size computed at compile time
   - Compressed line number table for debugging

4. **Value Representation**
   - `JSValue`: Represents JavaScript values (primitive or object)
   - NaN boxing in 32-bit version for 64-bit floating point
   - 128-bit large in 64-bit code

5. **Memory Management**
   - Reference counting for automatic object freeing
   - Separate cycle removal algorithm for handling circular references
   - `JS_SetMemoryLimit()` to set allocation limits

## C API Reference

### Runtime and Context Management

```c
// Runtime creation and management
JSRuntime *JS_NewRuntime(void);
void JS_FreeRuntime(JSRuntime *rt);
void JS_SetMemoryLimit(JSRuntime *rt, size_t limit);
void JS_SetMaxStackSize(JSRuntime *rt, size_t stack_size);
void JS_SetRuntimeOpaque(JSRuntime *rt, void *opaque);
void *JS_GetRuntimeOpaque(JSRuntime *rt);

// Context creation and management
JSContext *JS_NewContext(JSRuntime *rt);
void JS_FreeContext(JSContext *ctx);
JSContext *JS_DupContext(JSContext *ctx);
void JS_SetContextOpaque(JSContext *ctx, void *opaque);
void *JS_GetContextOpaque(JSContext *ctx);
JSRuntime *JS_GetRuntime(JSContext *ctx);

// Minimal context with only selected features
JSContext *JS_NewContextRaw(JSRuntime *rt);
void JS_AddIntrinsicBaseObjects(JSContext *ctx);
void JS_AddIntrinsicDate(JSContext *ctx);
void JS_AddIntrinsicEval(JSContext *ctx);
// ... and more intrinsic adders
```

### JavaScript Value Handling

```c
// Creating JavaScript values
JSValue JS_NewBool(JSContext *ctx, bool val);
JSValue JS_NewInt32(JSContext *ctx, int32_t val);
JSValue JS_NewFloat64(JSContext *ctx, double val);
JSValue JS_NewString(JSContext *ctx, const char *str);
JSValue JS_NewStringLen(JSContext *ctx, const char *str1, size_t len1);
JSValue JS_NewArray(JSContext *ctx);
JSValue JS_NewObject(JSContext *ctx);

// Special values
#define JS_NULL      JS_MKVAL(JS_TAG_NULL, 0)
#define JS_UNDEFINED JS_MKVAL(JS_TAG_UNDEFINED, 0)
#define JS_FALSE     JS_MKVAL(JS_TAG_BOOL, 0)
#define JS_TRUE      JS_MKVAL(JS_TAG_BOOL, 1)
#define JS_EXCEPTION JS_MKVAL(JS_TAG_EXCEPTION, 0)

// Type checking
bool JS_IsNumber(JSValueConst v);
bool JS_IsBool(JSValueConst v);
bool JS_IsNull(JSValueConst v);
bool JS_IsUndefined(JSValueConst v);
bool JS_IsString(JSValueConst v);
bool JS_IsObject(JSValueConst v);
bool JS_IsArray(JSValueConst val);
bool JS_IsFunction(JSContext* ctx, JSValueConst val);
bool JS_IsException(JSValueConst v);

// Type conversion
int JS_ToInt32(JSContext *ctx, int32_t *pres, JSValueConst val);
int JS_ToInt64(JSContext *ctx, int64_t *pres, JSValueConst val);
int JS_ToFloat64(JSContext *ctx, double *pres, JSValueConst val);
JSValue JS_ToString(JSContext *ctx, JSValueConst val);
const char *JS_ToCString(JSContext *ctx, JSValueConst val1);
void JS_FreeCString(JSContext *ctx, const char *ptr);

// Reference counting
void JS_FreeValue(JSContext *ctx, JSValue v);
JSValue JS_DupValue(JSContext *ctx, JSValueConst v);
```

### Executing JavaScript Code

```c
// Eval flags
#define JS_EVAL_TYPE_GLOBAL   (0 << 0) /* global code (default) */
#define JS_EVAL_TYPE_MODULE   (1 << 0) /* module code */
#define JS_EVAL_FLAG_STRICT   (1 << 3) /* force 'strict' mode */
#define JS_EVAL_FLAG_COMPILE_ONLY (1 << 5) /* compile but do not run */
#define JS_EVAL_FLAG_BACKTRACE_BARRIER (1 << 6) /* no stack trace */

// Evaluate JavaScript code
JSValue JS_Eval(JSContext *ctx, const char *input, size_t input_len,
                const char *filename, int eval_flags);

// Evaluate precompiled bytecode
void js_std_eval_binary(JSContext *ctx, const uint8_t *buf, size_t buf_len,
                        int flags);

// Load and evaluate a module
JSValue JS_LoadModule(JSContext *ctx, const char *basename,
                      const char *filename);
```

### Error Handling

```c
// Exception handling
JSValue JS_Throw(JSContext *ctx, JSValue obj);
JSValue JS_GetException(JSContext *ctx);
bool JS_IsError(JSContext *ctx, JSValueConst val);
bool JS_HasException(JSContext *ctx);

// Create and throw errors
JSValue JS_NewError(JSContext *ctx);
JSValue JS_ThrowSyntaxError(JSContext *ctx, const char *fmt, ...);
JSValue JS_ThrowTypeError(JSContext *ctx, const char *fmt, ...);
JSValue JS_ThrowReferenceError(JSContext *ctx, const char *fmt, ...);
JSValue JS_ThrowRangeError(JSContext *ctx, const char *fmt, ...);
JSValue JS_ThrowInternalError(JSContext *ctx, const char *fmt, ...);
JSValue JS_ThrowOutOfMemory(JSContext *ctx);
```

### Object and Property Manipulation

```c
// Property access
JSValue JS_GetPropertyStr(JSContext *ctx, JSValueConst this_obj, 
                         const char *prop);
JSValue JS_GetPropertyUint32(JSContext *ctx, JSValueConst this_obj,
                            uint32_t idx);
int JS_SetPropertyStr(JSContext *ctx, JSValueConst this_obj,
                     const char *prop, JSValue val);
int JS_SetPropertyUint32(JSContext *ctx, JSValueConst this_obj,
                        uint32_t idx, JSValue val);

// Property flags
#define JS_PROP_CONFIGURABLE  (1 << 0)
#define JS_PROP_WRITABLE      (1 << 1)
#define JS_PROP_ENUMERABLE    (1 << 2)
#define JS_PROP_C_W_E         (JS_PROP_CONFIGURABLE | JS_PROP_WRITABLE | JS_PROP_ENUMERABLE)

// Property definition
int JS_DefinePropertyValue(JSContext *ctx, JSValueConst this_obj,
                          JSAtom prop, JSValue val, int flags);
int JS_DefinePropertyValueStr(JSContext *ctx, JSValueConst this_obj,
                             const char *prop, JSValue val, int flags);
int JS_DefinePropertyValueUint32(JSContext *ctx, JSValueConst this_obj,
                                uint32_t idx, JSValue val, int flags);

// Calling methods and functions
JSValue JS_Call(JSContext *ctx, JSValueConst func_obj,
               JSValueConst this_obj, int argc, JSValueConst *argv);
JSValue JS_Invoke(JSContext *ctx, JSValueConst this_val, JSAtom atom,
                 int argc, JSValueConst *argv);
JSValue JS_CallConstructor(JSContext *ctx, JSValueConst func_obj,
                          int argc, JSValueConst *argv);
```

### C Functions and Modules

```c
// C function types
typedef JSValue JSCFunction(JSContext *ctx, JSValueConst this_val, 
                           int argc, JSValueConst *argv);
typedef JSValue JSCFunctionMagic(JSContext *ctx, JSValueConst this_val,
                                int argc, JSValueConst *argv, int magic);

// Creating C functions
JSValue JS_NewCFunction(JSContext *ctx, JSCFunction *func,
                       const char *name, int length);
JSValue JS_NewCFunctionMagic(JSContext *ctx, JSCFunctionMagic *func,
                            const char *name, int length,
                            JSCFunctionEnum cproto, int magic);

// Module creation
JSModuleDef *JS_NewCModule(JSContext *ctx, const char *name_str,
                          JSModuleInitFunc *func);
int JS_AddModuleExport(JSContext *ctx, JSModuleDef *m, const char *name_str);
int JS_SetModuleExport(JSContext *ctx, JSModuleDef *m, const char *export_name,
                      JSValue val);
```

### Custom JavaScript Classes

```c
// Class ID management
JSClassID JS_NewClassID(JSRuntime *rt, JSClassID *pclass_id);
int JS_NewClass(JSRuntime *rt, JSClassID class_id, const JSClassDef *class_def);

// Class definition components
typedef void JSClassFinalizer(JSRuntime *rt, JSValueConst val);
typedef void JSClassGCMark(JSRuntime *rt, JSValueConst val,
                         JS_MarkFunc *mark_func);
typedef JSValue JSClassCall(JSContext *ctx, JSValueConst func_obj,
                          JSValueConst this_val, int argc,
                          JSValueConst *argv, int flags);

// Class definition structure
typedef struct JSClassDef {
    const char *class_name;
    JSClassFinalizer *finalizer;
    JSClassGCMark *gc_mark;
    JSClassCall *call;
    JSClassExoticMethods *exotic;
} JSClassDef;

// Object creation and manipulation
JSValue JS_NewObjectClass(JSContext *ctx, int class_id);
JSValue JS_NewObjectProtoClass(JSContext *ctx, JSValueConst proto,
                              JSClassID class_id);
void JS_SetClassProto(JSContext *ctx, JSClassID class_id, JSValue obj);
JSValue JS_GetClassProto(JSContext *ctx, JSClassID class_id);
int JS_SetOpaque(JSValueConst obj, void *opaque);
void *JS_GetOpaque(JSValueConst obj, JSClassID class_id);
void *JS_GetOpaque2(JSContext *ctx, JSValueConst obj, JSClassID class_id);
```

### Standard Library

```c
// Standard library modules
JSModuleDef *js_init_module_std(JSContext *ctx, const char *module_name);
JSModuleDef *js_init_module_os(JSContext *ctx, const char *module_name);
JSModuleDef *js_init_module_bjson(JSContext *ctx, const char *module_name);

// Helper functions
void js_std_add_helpers(JSContext *ctx, int argc, char **argv);
int js_std_loop(JSContext *ctx);
JSValue js_std_await(JSContext *ctx, JSValue obj);
void js_std_init_handlers(JSRuntime *rt);
void js_std_free_handlers(JSRuntime *rt);
void js_std_dump_error(JSContext *ctx);
uint8_t *js_load_file(JSContext *ctx, size_t *pbuf_len, const char *filename);
```

### Asynchronous Programming

```c
// Promises
JSValue JS_NewPromiseCapability(JSContext *ctx, JSValue *resolving_funcs);
bool JS_IsPromise(JSValueConst val);
JSPromiseStateEnum JS_PromiseState(JSContext *ctx, JSValueConst promise);
JSValue JS_PromiseResult(JSContext *ctx, JSValueConst promise);

// Promise rejection tracking
void JS_SetHostPromiseRejectionTracker(JSRuntime *rt, 
                                      JSHostPromiseRejectionTracker *cb, 
                                      void *opaque);

// Jobs and event loop integration
int JS_EnqueueJob(JSContext *ctx, JSJobFunc *job_func,
                 int argc, JSValueConst *argv);
bool JS_IsJobPending(JSRuntime *rt);
int JS_ExecutePendingJob(JSRuntime *rt, JSContext **pctx);
```

## Common Usage Patterns

### Basic Embedding

```c
#include "quickjs.h"
#include "quickjs-libc.h"

int main(int argc, char *argv[]) {
    JSRuntime *rt;
    JSContext *ctx;
    
    /* Initialize the runtime and context */
    rt = JS_NewRuntime();
    if (!rt) {
        fprintf(stderr, "Failed to create JS runtime\n");
        return 1;
    }
    
    ctx = JS_NewContext(rt);
    if (!ctx) {
        JS_FreeRuntime(rt);
        fprintf(stderr, "Failed to create JS context\n");
        return 1;
    }
    
    /* Add standard library */
    js_init_module_std(ctx, "std");
    js_init_module_os(ctx, "os");
    
    /* Add command line arguments */
    js_std_add_helpers(ctx, argc, argv);
    
    /* Execute JavaScript code */
    JSValue result = JS_Eval(ctx, "console.log('Hello from QuickJS');", 
                             strlen("console.log('Hello from QuickJS');"),
                             "<input>", JS_EVAL_TYPE_GLOBAL);
    
    /* Check for exceptions */
    if (JS_IsException(result)) {
        js_std_dump_error(ctx);
    }
    
    /* Clean up */
    JS_FreeValue(ctx, result);
    JS_FreeContext(ctx);
    JS_FreeRuntime(rt);
    
    return 0;
}
```

### Creating a Simple Module

```c
#include "quickjs.h"

/* Define a C function to expose to JavaScript */
static JSValue js_hello(JSContext *ctx, JSValueConst this_val,
                       int argc, JSValueConst *argv)
{
    const char *name = "world";
    
    /* Get the name argument if provided */
    if (argc > 0) {
        name = JS_ToCString(ctx, argv[0]);
        if (!name)
            return JS_EXCEPTION;
    }
    
    /* Create a greeting string */
    JSValue msg = JS_NewStringPrintf(ctx, "Hello, %s!", name);
    
    /* Free the C string if needed */
    if (argc > 0)
        JS_FreeCString(ctx, name);
    
    return msg;
}

/* List of functions to expose */
static const JSCFunctionListEntry js_module_funcs[] = {
    JS_CFUNC_DEF("hello", 1, js_hello),
};

/* Module initialization function */
static int js_module_init(JSContext *ctx, JSModuleDef *m)
{
    /* Set all module exports */
    return JS_SetModuleExportList(ctx, m, js_module_funcs, 
                                countof(js_module_funcs));
}

/* Module initialization entry point */
JSModuleDef *js_init_module(JSContext *ctx, const char *module_name)
{
    JSModuleDef *m;
    
    /* Create the module */
    m = JS_NewCModule(ctx, module_name, js_module_init);
    if (!m)
        return NULL;
    
    /* Add exports */
    JS_AddModuleExportList(ctx, m, js_module_funcs, 
                          countof(js_module_funcs));
    
    return m;
}
```

### Creating a JavaScript Class in C

```c
#include "quickjs.h"

/* Define a class ID */
static JSClassID js_example_class_id;

/* Define the object data */
typedef struct {
    int value;
} JSExampleData;

/* Class finalizer - called when object is garbage collected */
static void js_example_finalizer(JSRuntime *rt, JSValue val)
{
    JSExampleData *data = JS_GetOpaque(val, js_example_class_id);
    /* Free the object data */
    js_free_rt(rt, data);
}

/* Constructor - called when creating a new object with 'new Example()' */
static JSValue js_example_constructor(JSContext *ctx,
                                     JSValueConst new_target,
                                     int argc, JSValueConst *argv)
{
    JSExampleData *data;
    JSValue obj;
    JSValue proto;
    
    /* Allocate the object data */
    data = js_mallocz(ctx, sizeof(*data));
    if (!data)
        return JS_EXCEPTION;
    
    /* Initialize with value from first argument or default to 0 */
    data->value = 0;
    if (argc > 0) {
        if (JS_ToInt32(ctx, &data->value, argv[0]))
            goto fail;
    }
    
    /* Get the class prototype from new_target */
    proto = JS_GetPropertyStr(ctx, new_target, "prototype");
    if (JS_IsException(proto))
        goto fail;
    
    /* Create a new object using the prototype */
    obj = JS_NewObjectProtoClass(ctx, proto, js_example_class_id);
    JS_FreeValue(ctx, proto);
    if (JS_IsException(obj))
        goto fail;
    
    /* Attach the data to the object */
    JS_SetOpaque(obj, data);
    return obj;
    
 fail:
    js_free(ctx, data);
    return JS_EXCEPTION;
}

/* Method to get the value */
static JSValue js_example_getValue(JSContext *ctx, JSValueConst this_val,
                                  int argc, JSValueConst *argv)
{
    JSExampleData *data = JS_GetOpaque2(ctx, this_val, js_example_class_id);
    if (!data)
        return JS_EXCEPTION;
    
    return JS_NewInt32(ctx, data->value);
}

/* Method to set the value */
static JSValue js_example_setValue(JSContext *ctx, JSValueConst this_val,
                                  int argc, JSValueConst *argv)
{
    JSExampleData *data = JS_GetOpaque2(ctx, this_val, js_example_class_id);
    int value;
    
    if (!data)
        return JS_EXCEPTION;
    
    if (argc < 1)
        return JS_UNDEFINED;
    
    if (JS_ToInt32(ctx, &value, argv[0]))
        return JS_EXCEPTION;
    
    data->value = value;
    return JS_UNDEFINED;
}

/* Class definition */
static JSClassDef js_example_class = {
    "Example",
    .finalizer = js_example_finalizer,
};

/* List of methods for the class prototype */
static const JSCFunctionListEntry js_example_proto_funcs[] = {
    JS_CFUNC_DEF("getValue", 0, js_example_getValue),
    JS_CFUNC_DEF("setValue", 1, js_example_setValue),
};

/* Initialize the class and add it to the module */
static int js_example_init(JSContext *ctx, JSModuleDef *m)
{
    JSValue proto, example_class;
    
    /* Create the class ID */
    JS_NewClassID(&js_example_class_id);
    JS_NewClass(JS_GetRuntime(ctx), js_example_class_id, &js_example_class);
    
    /* Create the prototype */
    proto = JS_NewObject(ctx);
    JS_SetPropertyFunctionList(ctx, proto, js_example_proto_funcs, 
                             countof(js_example_proto_funcs));
    
    /* Create the constructor */
    example_class = JS_NewCFunction2(ctx, js_example_constructor, "Example", 1,
                                   JS_CFUNC_constructor, 0);
    
    /* Link constructor and prototype */
    JS_SetConstructor(ctx, example_class, proto);
    JS_SetClassProto(ctx, js_example_class_id, proto);
    
    /* Export the class */
    JS_SetModuleExport(ctx, m, "Example", example_class);
    return 0;
}
```

### Event Loop Integration

```c
#include "quickjs.h"
#include "quickjs-libc.h"

/* Basic event loop to handle promises */
int run_event_loop(JSContext *ctx)
{
    JSContext *ctx1;
    int err;
    
    for (;;) {
        /* Execute pending jobs until there are no more */
        for (;;) {
            int ret = JS_ExecutePendingJob(JS_GetRuntime(ctx), &ctx1);
            if (ret < 0) {
                /* Error executing job */
                return -1;
            } else if (ret == 0) {
                /* No more pending jobs */
                break;
            }
        }
        
        /* Check if we should exit the loop */
        if (!JS_IsJobPending(JS_GetRuntime(ctx)))
            break;
        
        /* Wait for external events - in a real app, you'd use select/poll/etc. */
        usleep(10000); /* 10ms - just an example, replace with real event handling */
    }
    
    return 0;
}

/* Example async/await handler */
int main(int argc, char *argv[])
{
    JSRuntime *rt;
    JSContext *ctx;
    
    rt = JS_NewRuntime();
    ctx = JS_NewContext(rt);
    
    /* Add standard library with promises */
    js_std_add_helpers(ctx, argc, argv);
    JS_AddIntrinsicBaseObjects(ctx);
    JS_AddIntrinsicDate(ctx);
    JS_AddIntrinsicPromise(ctx);
    
    /* Example async code */
    const char *async_code = 
        "async function test() { \n"
        "    console.log('Start'); \n"
        "    await new Promise(resolve => setTimeout(resolve, 1000)); \n"
        "    console.log('End'); \n"
        "    return 'Done'; \n"
        "} \n"
        "test().then(result => console.log('Result:', result)); \n"
        "console.log('After test() call'); \n";
    
    JSValue result = JS_Eval(ctx, async_code, strlen(async_code), 
                            "<input>", JS_EVAL_TYPE_GLOBAL);
    
    if (JS_IsException(result)) {
        js_std_dump_error(ctx);
        JS_FreeValue(ctx, result);
        JS_FreeContext(ctx);
        JS_FreeRuntime(rt);
        return 1;
    }
    
    JS_FreeValue(ctx, result);
    
    /* Run the event loop to process promises */
    run_event_loop(ctx);
    
    JS_FreeContext(ctx);
    JS_FreeRuntime(rt);
    return 0;
}
```