//
//
// LCLSystemLogConfig.h
//
//
// Copyright (c) 2008-2012 Arne Harren <ah@0xc0.de>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

//
// LCLSystemLogConfig.h template for the LCLSystemLog logging class.
//


// Rename the LCLSystemLog classes by adding your application/framework's unique
// prefix in order to avoid duplicate symbols in the global class namespace.
#ifndef LCLSystemLog
#define LCLSystemLog                                                           \
    LBLCLSystemLog
#endif
#ifndef LCLSystemLogConnection
#define LCLSystemLogConnection                                                 \
    LBLCLSystemLogConnection
#endif

// Tell LCLSystemLog whether it should mirror the log messages to stderr.
#define _LCLSystemLog_MirrorMessagesToStdErr /* (BOOL) */                      \
    NO

// Tell LCLSystemLog whether it should create ASL connections for each thread.
#define _LCLSystemLog_UsePerThreadConnections /* (BOOL) */                     \
    YES

// Tell LCLSystemLog whether it should show file names.
#define _LCLSystemLog_ShowFileNames /* (BOOL) */                               \
    YES

// Tell LCLSystemLog whether it should show line numbers.
#define _LCLSystemLog_ShowLineNumbers /* (BOOL) */                             \
    YES

// Tell LCLSystemLog whether it should show function names.
#define _LCLSystemLog_ShowFunctionNames /* (BOOL) */                           \
    YES

// Tell LCLSystemLog the last ASL log level to use, e.g. ASL_LEVEL_NOTICE.
#define _LCLSystemLog_LastASLLogLevelToUse /* (uint32_t) */                    \
    ASL_LEVEL_DEBUG

