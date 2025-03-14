-keepattributes Signature

-dontwarn com.sunmi.paylib.R$string
-keep class com.prism.** { *; }
-keep class net.kazang.pegasus.** { *; }
-keep class com.google.gson.** { *; }
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.reflect.TypeToken