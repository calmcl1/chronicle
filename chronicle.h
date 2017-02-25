#ifdef __unix__
/* libsndfile uses __int64 type, which isn't available on Linux... */
#include <cinttypes>
typedef int64_t __int64;
#endif


#include "RtAudio.h"

extern "C"{
	#include "sndfile.h"
}

#include <boost/filesystem.hpp>

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <chrono>
#include <thread>
#include <iomanip>
#include <csignal>
#include <cstring>


std::string const SOFTWARE_NAME = "chronicle";
std::string const VERSION = "0.1.2rc1";

using namespace std;

// So, you've decided to make some logger software...

int main(int argc, char* argv[]);
void doRecord(boost::filesystem::path directory, string fileNameFormat);

chrono::time_point<chrono::system_clock> calculateRecordEndTimeFromNow();

int cb_record(void *outputBuffer, void *inputBuffer, unsigned int nFrames, double    me, RtAudioStreamStatus status, void *userData);
void stopRecord();
void signalHandler(int sigNum);

void removeOldAudioFiles(chrono::seconds age, boost::filesystem::path directory);

void printLicence();
void printHelp();