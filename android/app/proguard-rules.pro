-keepattributes Signature
-ignorewarnings
-dontwarn com.sunmi.paylib.R$string
-keep class net.kazang.pegasus.** { *; }
-keep class com.google.gson.** { *; }
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.reflect.TypeToken

# Retrofit rules to work around Call parameterization issues
-keep class retrofit2.** { *; }
-keep interface retrofit2.** { *; }
-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations