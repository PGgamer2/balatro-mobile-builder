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

if (BuilderConInter.askQuestion("Open the Android save manager", silentMode, false))
    BuilderConInter.saveManager(silentMode, platformParam);
else
    BuilderConInter.buildManager(silentMode, platformParam, outFilePath);