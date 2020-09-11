.class public Lcom/ss/ttm/utils/HardWareInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static mArmArchitecture:[I

.field private static mCpuType:I


# instance fields
.field private batteryReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x3

    .line 24
    new-array v0, v0, [I

    sput-object v0, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    new-instance v0, Lcom/ss/ttm/utils/HardWareInfo$1;

    invoke-direct {v0, p0}, Lcom/ss/ttm/utils/HardWareInfo$1;-><init>(Lcom/ss/ttm/utils/HardWareInfo;)V

    iput-object v0, p0, Lcom/ss/ttm/utils/HardWareInfo;->batteryReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static getCpuArchitecture()[I
    .registers 14

    .line 101
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    const-string v1, "/proc/cpuinfo"

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 102
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 103
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_e5

    :try_start_11
    const-string v3, "Processor"

    const-string v4, "Features"

    const-string v5, "model name"

    const-string v6, "cpu family"

    .line 110
    :cond_19
    :goto_19
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7
    :try_end_1d
    .catchall {:try_start_11 .. :try_end_1d} :catchall_da

    if-nez v7, :cond_2a

    .line 157
    :try_start_1f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 158
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 159
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_28} :catch_e5

    goto/16 :goto_e5

    :cond_2a
    :try_start_2a
    const-string v8, "\t"

    const-string v9, ""

    .line 115
    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v8, ":"

    .line 116
    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 117
    array-length v8, v7

    const/4 v9, 0x2

    if-eq v8, v9, :cond_3d

    goto :goto_19

    :cond_3d
    const/4 v8, 0x0

    .line 119
    aget-object v10, v7, v8

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    .line 120
    aget-object v7, v7, v11

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 121
    invoke-virtual {v10, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v12

    if-nez v12, :cond_9e

    const-string v9, ""

    const-string v10, "ARMv"

    .line 123
    invoke-virtual {v7, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    add-int/lit8 v10, v10, 0x4

    :goto_5b
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v10, v12, :cond_90

    .line 124
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "\\d"

    .line 125
    invoke-virtual {v12, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_90

    .line 126
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v10, v10, 0x1

    goto :goto_5b

    .line 131
    :cond_90
    sget-object v7, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v11, v7, v8

    .line 132
    sget-object v7, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v7, v11

    goto/16 :goto_19

    .line 136
    :cond_9e
    invoke-virtual {v10, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v12

    if-nez v12, :cond_b2

    const-string v10, "neon"

    .line 137
    invoke-virtual {v7, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 138
    sget-object v7, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v8, v7, v9

    goto/16 :goto_19

    .line 143
    :cond_b2
    invoke-virtual {v10, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v12

    if-nez v12, :cond_ca

    const-string v10, "Intel"

    .line 144
    invoke-virtual {v7, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 145
    sget-object v7, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v9, v7, v8

    .line 146
    sget-object v7, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v11, v7, v9

    goto/16 :goto_19

    .line 151
    :cond_ca
    invoke-virtual {v10, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_19

    .line 152
    sget-object v8, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    aput v7, v8, v11
    :try_end_d8
    .catchall {:try_start_2a .. :try_end_d8} :catchall_da

    goto/16 :goto_19

    :catchall_da
    move-exception v3

    .line 157
    :try_start_db
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 158
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 159
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_e5
    .catch Ljava/lang/Exception; {:try_start_db .. :try_end_e5} :catch_e5

    .line 165
    :catch_e5
    :goto_e5
    sget-object v0, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    return-object v0
.end method

.method public static getCpuFamily()I
    .registers 2

    .line 232
    sget v0, Lcom/ss/ttm/utils/HardWareInfo;->mCpuType:I

    if-nez v0, :cond_e

    .line 233
    invoke-static {}, Lcom/ss/ttm/utils/HardWareInfo;->getCpuInfo()[I

    .line 234
    sget-object v0, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    sput v0, Lcom/ss/ttm/utils/HardWareInfo;->mCpuType:I

    .line 236
    :cond_e
    sget v0, Lcom/ss/ttm/utils/HardWareInfo;->mCpuType:I

    return v0
.end method

.method public static getCpuInfo()[I
    .registers 12

    .line 36
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    const-string v1, "/proc/cpuinfo"

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 37
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 38
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_da

    :try_start_11
    const-string v3, "processor"

    const-string v4, "features"

    const-string v5, "model name"

    .line 44
    :cond_17
    :goto_17
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_1f

    goto/16 :goto_c5

    :cond_1f
    const-string v7, "\t"

    const-string v8, ""

    .line 49
    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, ":"

    .line 50
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 51
    array-length v7, v6

    const/4 v8, 0x2

    if-eq v7, v8, :cond_36

    goto :goto_17

    :cond_36
    const/4 v7, 0x0

    .line 53
    aget-object v9, v6, v7

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    .line 54
    aget-object v6, v6, v10

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_17

    if-nez v9, :cond_49

    goto :goto_17

    .line 58
    :cond_49
    invoke-virtual {v9, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v11

    if-nez v11, :cond_72

    const-string v9, "armv"

    .line 59
    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6d

    const-string v9, "aarch64"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_60

    goto :goto_6d

    :cond_60
    const-string v9, "intel"

    .line 62
    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 63
    sget-object v3, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v8, v3, v7

    goto :goto_c5

    .line 60
    :cond_6d
    :goto_6d
    sget-object v3, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v10, v3, v7

    goto :goto_c5

    .line 69
    :cond_72
    invoke-virtual {v9, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v11

    if-nez v11, :cond_a6

    const-string v8, "neon"

    .line 70
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_a0

    const-string v8, "thumb"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_a0

    const-string v8, "vfpv"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_a0

    const-string v8, "asimd"

    .line 71
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_a0

    const-string v8, "simd"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 72
    :cond_a0
    sget-object v6, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v10, v6, v7

    goto/16 :goto_17

    .line 77
    :cond_a6
    invoke-virtual {v9, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_17

    const-string v9, "intel"

    .line 78
    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_b9

    .line 79
    sget-object v3, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v8, v3, v7

    goto :goto_c5

    :cond_b9
    const-string v8, "arm"

    .line 81
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 82
    sget-object v3, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    aput v10, v3, v7
    :try_end_c5
    .catchall {:try_start_11 .. :try_end_c5} :catchall_cf

    .line 89
    :goto_c5
    :try_start_c5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 90
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 91
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_da

    :catchall_cf
    move-exception v3

    .line 89
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 90
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 91
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_da
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_da} :catch_da

    .line 97
    :catch_da
    :goto_da
    sget-object v0, Lcom/ss/ttm/utils/HardWareInfo;->mArmArchitecture:[I

    return-object v0
.end method

.method public static getProcessCpuInfo()J
    .registers 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 204
    :try_start_3
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 205
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v6, Ljava/io/FileInputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "/proc/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "/stat"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v3, 0x3e8

    invoke-direct {v4, v5, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_2e} :catch_70
    .catchall {:try_start_3 .. :try_end_2e} :catchall_6b

    .line 207
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 208
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    const-string v3, " "

    .line 209
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_3b} :catch_69
    .catchall {:try_start_2e .. :try_end_3b} :catchall_66

    .line 214
    :try_start_3b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_3e

    :catch_3e
    const/16 v3, 0xd

    .line 221
    :try_start_40
    aget-object v3, v2, v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    const/16 v5, 0xe

    aget-object v5, v2, v5

    .line 222
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    const/4 v7, 0x0

    add-long/2addr v3, v5

    const/16 v5, 0xf

    aget-object v5, v2, v5

    .line 223
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    const/4 v7, 0x0

    add-long/2addr v3, v5

    const/16 v5, 0x10

    aget-object v2, v2, v5

    .line 224
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5
    :try_end_62
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_40 .. :try_end_62} :catch_65

    const/4 v0, 0x0

    add-long/2addr v3, v5

    return-wide v3

    :catch_65
    return-wide v0

    :catchall_66
    move-exception v0

    move-object v2, v4

    goto :goto_6c

    :catch_69
    move-object v2, v4

    goto :goto_70

    :catchall_6b
    move-exception v0

    .line 214
    :goto_6c
    :try_start_6c
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_6f

    .line 217
    :catch_6f
    throw v0

    .line 214
    :catch_70
    :goto_70
    :try_start_70
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_73} :catch_73

    :catch_73
    return-wide v0
.end method

.method public static getSDCardSize()[J
    .registers 8

    const/4 v0, 0x2

    .line 168
    new-array v0, v0, [J

    .line 169
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    .line 170
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 171
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 172
    new-instance v2, Landroid/os/StatFs;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v1

    int-to-long v3, v1

    .line 174
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockCount()I

    move-result v1

    int-to-long v5, v1

    .line 175
    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v1

    int-to-long v1, v1

    const/4 v7, 0x0

    mul-long v5, v5, v3

    aput-wide v5, v0, v7

    const/4 v5, 0x1

    mul-long v3, v3, v1

    aput-wide v3, v0, v5

    :cond_35
    return-object v0
.end method


# virtual methods
.method public getOtherInfo(Landroid/content/Context;)[Ljava/lang/String;
    .registers 6

    const/4 v0, 0x2

    .line 189
    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "null"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "null"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-string v1, "wifi"

    .line 190
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    .line 191
    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object p1

    .line 192
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_26

    .line 193
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v2

    goto :goto_2a

    :cond_26
    const-string p1, "Fail"

    aput-object p1, v0, v2

    :goto_2a
    return-object v0
.end method
