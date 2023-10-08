/ connected/!d;
/ connected (.*/d;
/ connected/ s/\(.*\) connected \(primary\)\? *\([0-9]\+\)x\([0-9]\+\)+\([0-9]\+\)+\([0-9]\+\) \(left\|right\|inverted\|normal\)\? *(.*).*/\1,\2,\3x\4,\5x\6,\7/g;
s/,,/,noprimary,/;
s/,$/,normal/;
