package com.ss.ttm.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Environment;
import android.os.StatFs;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class HardWareInfo {
    private static int[] mArmArchitecture = new int[3];
    private static int mCpuType;
    private BroadcastReceiver batteryReceiver = new 1(this);

    /* JADX WARNING: Code restructure failed: missing block: B:24:0x006d, code lost:
        com.ss.ttm.utils.HardWareInfo.mArmArchitecture[0] = 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int[] getCpuInfo() {
        /*
            java.io.FileInputStream r0 = new java.io.FileInputStream     // Catch:{ Exception -> 0x00da }
            java.lang.String r1 = "/proc/cpuinfo"
            r0.<init>(r1)     // Catch:{ Exception -> 0x00da }
            java.io.InputStreamReader r1 = new java.io.InputStreamReader     // Catch:{ Exception -> 0x00da }
            r1.<init>(r0)     // Catch:{ Exception -> 0x00da }
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch:{ Exception -> 0x00da }
            r2.<init>(r1)     // Catch:{ Exception -> 0x00da }
            java.lang.String r3 = "processor"
            java.lang.String r4 = "features"
            java.lang.String r5 = "model name"
        L_0x0017:
            java.lang.String r6 = r2.readLine()     // Catch:{ all -> 0x00cf }
            if (r6 != 0) goto L_0x001f
            goto L_0x00c5
        L_0x001f:
            java.lang.String r7 = "\t"
            java.lang.String r8 = ""
            java.lang.String r6 = r6.replaceAll(r7, r8)     // Catch:{ all -> 0x00cf }
            java.lang.String r6 = r6.toLowerCase()     // Catch:{ all -> 0x00cf }
            java.lang.String r7 = ":"
            java.lang.String[] r6 = r6.split(r7)     // Catch:{ all -> 0x00cf }
            int r7 = r6.length     // Catch:{ all -> 0x00cf }
            r8 = 2
            if (r7 == r8) goto L_0x0036
            goto L_0x0017
        L_0x0036:
            r7 = 0
            r9 = r6[r7]     // Catch:{ all -> 0x00cf }
            java.lang.String r9 = r9.trim()     // Catch:{ all -> 0x00cf }
            r10 = 1
            r6 = r6[r10]     // Catch:{ all -> 0x00cf }
            java.lang.String r6 = r6.trim()     // Catch:{ all -> 0x00cf }
            if (r6 == 0) goto L_0x0017
            if (r9 != 0) goto L_0x0049
            goto L_0x0017
        L_0x0049:
            int r11 = r9.compareTo(r3)     // Catch:{ all -> 0x00cf }
            if (r11 != 0) goto L_0x0072
            java.lang.String r9 = "armv"
            boolean r9 = r6.contains(r9)     // Catch:{ all -> 0x00cf }
            if (r9 != 0) goto L_0x006d
            java.lang.String r9 = "aarch64"
            boolean r9 = r6.contains(r9)     // Catch:{ all -> 0x00cf }
            if (r9 == 0) goto L_0x0060
            goto L_0x006d
        L_0x0060:
            java.lang.String r9 = "intel"
            boolean r6 = r6.contains(r9)     // Catch:{ all -> 0x00cf }
            if (r6 == 0) goto L_0x0017
            int[] r3 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture     // Catch:{ all -> 0x00cf }
            r3[r7] = r8     // Catch:{ all -> 0x00cf }
            goto L_0x00c5
        L_0x006d:
            int[] r3 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture     // Catch:{ all -> 0x00cf }
            r3[r7] = r10     // Catch:{ all -> 0x00cf }
            goto L_0x00c5
        L_0x0072:
            int r11 = r9.compareToIgnoreCase(r4)     // Catch:{ all -> 0x00cf }
            if (r11 != 0) goto L_0x00a6
            java.lang.String r8 = "neon"
            boolean r8 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r8 != 0) goto L_0x00a0
            java.lang.String r8 = "thumb"
            boolean r8 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r8 != 0) goto L_0x00a0
            java.lang.String r8 = "vfpv"
            boolean r8 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r8 != 0) goto L_0x00a0
            java.lang.String r8 = "asimd"
            boolean r8 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r8 != 0) goto L_0x00a0
            java.lang.String r8 = "simd"
            boolean r6 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r6 == 0) goto L_0x0017
        L_0x00a0:
            int[] r6 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture     // Catch:{ all -> 0x00cf }
            r6[r7] = r10     // Catch:{ all -> 0x00cf }
            goto L_0x0017
        L_0x00a6:
            int r9 = r9.compareToIgnoreCase(r5)     // Catch:{ all -> 0x00cf }
            if (r9 != 0) goto L_0x0017
            java.lang.String r9 = "intel"
            boolean r9 = r6.contains(r9)     // Catch:{ all -> 0x00cf }
            if (r9 == 0) goto L_0x00b9
            int[] r3 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture     // Catch:{ all -> 0x00cf }
            r3[r7] = r8     // Catch:{ all -> 0x00cf }
            goto L_0x00c5
        L_0x00b9:
            java.lang.String r8 = "arm"
            boolean r6 = r6.contains(r8)     // Catch:{ all -> 0x00cf }
            if (r6 == 0) goto L_0x0017
            int[] r3 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture     // Catch:{ all -> 0x00cf }
            r3[r7] = r10     // Catch:{ all -> 0x00cf }
        L_0x00c5:
            r2.close()
            r1.close()
            r0.close()
            goto L_0x00da
        L_0x00cf:
            r3 = move-exception
            r2.close()
            r1.close()
            r0.close()
            throw r3
        L_0x00da:
            int[] r0 = com.ss.ttm.utils.HardWareInfo.mArmArchitecture
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.ttm.utils.HardWareInfo.getCpuInfo():int[]");
    }

    public static int[] getCpuArchitecture() {
        try {
            FileInputStream fileInputStream = new FileInputStream("/proc/cpuinfo");
            InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            while (true) {
                try {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    String[] split = readLine.replace("\t", "").split(":");
                    if (split.length == 2) {
                        String trim = split[0].trim();
                        String trim2 = split[1].trim();
                        if (trim.compareTo("Processor") == 0) {
                            String str = "";
                            for (int indexOf = trim2.indexOf("ARMv") + 4; indexOf < trim2.length(); indexOf++) {
                                String str2 = trim2.charAt(indexOf) + "";
                                if (!str2.matches("\\d")) {
                                    break;
                                }
                                str = str + str2;
                            }
                            mArmArchitecture[0] = 1;
                            mArmArchitecture[1] = Integer.parseInt(str);
                        } else if (trim.compareToIgnoreCase("Features") == 0) {
                            if (trim2.contains("neon")) {
                                mArmArchitecture[2] = 0;
                            }
                        } else if (trim.compareToIgnoreCase("model name") == 0) {
                            if (trim2.contains("Intel")) {
                                mArmArchitecture[0] = 2;
                                mArmArchitecture[2] = 1;
                            }
                        } else if (trim.compareToIgnoreCase("cpu family") == 0) {
                            mArmArchitecture[1] = Integer.parseInt(trim2);
                        }
                    }
                } finally {
                    bufferedReader.close();
                    inputStreamReader.close();
                    fileInputStream.close();
                }
            }
        } catch (Exception unused) {
        }
        return mArmArchitecture;
    }

    public static long[] getSDCardSize() {
        long[] jArr = new long[2];
        if ("mounted".equals(Environment.getExternalStorageState())) {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            long blockSize = (long) statFs.getBlockSize();
            jArr[0] = ((long) statFs.getBlockCount()) * blockSize;
            jArr[1] = blockSize * ((long) statFs.getAvailableBlocks());
        }
        return jArr;
    }

    public String[] getOtherInfo(Context context) {
        String[] strArr = {"null", "null"};
        WifiInfo connectionInfo = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo();
        if (connectionInfo.getMacAddress() != null) {
            strArr[0] = connectionInfo.getMacAddress();
        } else {
            strArr[0] = "Fail";
        }
        return strArr;
    }

    /* JADX WARNING: Missing exception handler attribute for start block: B:24:0x0070 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static long getProcessCpuInfo() {
        /*
            r0 = 0
            r2 = 0
            int r3 = android.os.Process.myPid()     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.io.BufferedReader r4 = new java.io.BufferedReader     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.io.InputStreamReader r5 = new java.io.InputStreamReader     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.io.FileInputStream r6 = new java.io.FileInputStream     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.lang.StringBuilder r7 = new java.lang.StringBuilder     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            r7.<init>()     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.lang.String r8 = "/proc/"
            r7.append(r8)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            r7.append(r3)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.lang.String r3 = "/stat"
            r7.append(r3)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.lang.String r3 = r7.toString()     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            r6.<init>(r3)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            r5.<init>(r6)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            r3 = 1000(0x3e8, float:1.401E-42)
            r4.<init>(r5, r3)     // Catch:{ IOException -> 0x0070, all -> 0x006b }
            java.lang.String r2 = r4.readLine()     // Catch:{ IOException -> 0x0069, all -> 0x0066 }
            r4.close()     // Catch:{ IOException -> 0x0069, all -> 0x0066 }
            java.lang.String r3 = " "
            java.lang.String[] r2 = r2.split(r3)     // Catch:{ IOException -> 0x0069, all -> 0x0066 }
            r4.close()     // Catch:{ Exception -> 0x003e }
        L_0x003e:
            r3 = 13
            r3 = r2[r3]     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            long r3 = java.lang.Long.parseLong(r3)     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            r5 = 14
            r5 = r2[r5]     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            long r5 = java.lang.Long.parseLong(r5)     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            r7 = 0
            long r3 = r3 + r5
            r5 = 15
            r5 = r2[r5]     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            long r5 = java.lang.Long.parseLong(r5)     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            r7 = 0
            long r3 = r3 + r5
            r5 = 16
            r2 = r2[r5]     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            long r5 = java.lang.Long.parseLong(r2)     // Catch:{ ArrayIndexOutOfBoundsException -> 0x0065 }
            r0 = 0
            long r3 = r3 + r5
            return r3
        L_0x0065:
            return r0
        L_0x0066:
            r0 = move-exception
            r2 = r4
            goto L_0x006c
        L_0x0069:
            r2 = r4
            goto L_0x0070
        L_0x006b:
            r0 = move-exception
        L_0x006c:
            r2.close()     // Catch:{ Exception -> 0x006f }
        L_0x006f:
            throw r0
        L_0x0070:
            r2.close()     // Catch:{ Exception -> 0x0073 }
        L_0x0073:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.ttm.utils.HardWareInfo.getProcessCpuInfo():long");
    }

    public static int getCpuFamily() {
        if (mCpuType == 0) {
            getCpuInfo();
            mCpuType = mArmArchitecture[0];
        }
        return mCpuType;
    }
}
