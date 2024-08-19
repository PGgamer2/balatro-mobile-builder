﻿using BalatroMobileBuilder;

Console.WriteLine("[Balatro Mobile Builder]");

// Additional parameters
bool silentMode = false;
string? platformParam = null;
string? outFilePath = null;
for (int i = 0; i < args.Length; i++) {
    switch (args[i]) {
    case "-s":
        if (args.Length > i + 1) {
            silentMode = true;
            platformParam = args[i + 1].ToLower();
        }
        break;
    case "-o":
        if (args.Length > i + 1) {
            outFilePath = args[i + 1];
        }
        break;
    }
}

if (ConsoleInterface.askQuestion("Open the Android save manager", silentMode, false))
    ConsoleInterface.saveManager(silentMode, platformParam);
else
    ConsoleInterface.buildManager(silentMode, platformParam, outFilePath);