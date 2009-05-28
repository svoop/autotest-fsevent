#include <CoreServices/CoreServices.h>

static void callback(ConstFSEventStreamRef streamRef,
					 void *clientCallBackInfo,
					 size_t numEvents,
					 void *eventPaths,
					 const FSEventStreamEventFlags eventFlags[],
					 const FSEventStreamEventId eventIds[]) {
	exit(0);
}

int main (int argc, const char * argv[]) {
	// Show help
	if (argc != 2 || strncmp(argv[1], "-h", 2) == 0) {
		printf("Sleep until a file in or below the watchdir is modified.\n");
		printf("Usage: fsevent_sleep /path/to/watchdir\n");
		exit(1);
	}
	
	// Create event stream
	CFStringRef pathToWatch = CFStringCreateWithCString(kCFAllocatorDefault, argv[1], kCFStringEncodingUTF8);
    CFArrayRef pathsToWatch = CFArrayCreate(NULL, (const void **)&pathToWatch, 1, NULL);	
    void *callbackInfo = NULL;
    FSEventStreamRef stream;
    CFAbsoluteTime latency = 1.0;
    stream = FSEventStreamCreate(
								 kCFAllocatorDefault,
								 callback,
								 callbackInfo,
								 pathsToWatch,
								 kFSEventStreamEventIdSinceNow,
								 latency,
								 kFSEventStreamCreateFlagNone
								 );
	
	// Add stream to run loop
    FSEventStreamScheduleWithRunLoop(stream, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	FSEventStreamStart(stream);
	CFRunLoopRun();
	
	// Exit
	return 2;
}
