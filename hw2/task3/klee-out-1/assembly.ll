; ModuleID = 'binary_search.bc'
source_filename = "binary_search.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [42 x i8] c"Searching for position to insert %d in:\0A[\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [5 x i8] c"%d]\0A\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [2 x i8] c"x\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [33 x i8] c"The position to insert %d is %d\0A\00", align 1, !dbg !21
@.str.6 = private unnamed_addr constant [9 x i8] c"a[i] < x\00", align 1, !dbg !26
@.str.7 = private unnamed_addr constant [16 x i8] c"binary_search.c\00", align 1, !dbg !31
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1, !dbg !36
@.str.8 = private unnamed_addr constant [10 x i8] c"a[i] >= x\00", align 1, !dbg !42
@.str.9 = private unnamed_addr constant [41 x i8] c"The algorithm passed correctness check.\0A\00", align 1, !dbg !47

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_data(ptr noundef %arr, i32 noundef %size, i32 noundef %target) #0 !dbg !62 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %target.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arr.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 %target, ptr %target.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %target.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i32, ptr %target.addr, align 4, !dbg !74
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %0), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i32 0, ptr %i, align 4, !dbg !78
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.body, %entry
  %1 = load i32, ptr %i, align 4, !dbg !80
  %2 = load i32, ptr %size.addr, align 4, !dbg !82
  %sub = sub nsw i32 %2, 1, !dbg !83
  %cmp = icmp slt i32 %1, %sub, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %arr.addr, align 8, !dbg !86
  %4 = load i32, ptr %i, align 4, !dbg !88
  %idxprom = sext i32 %4 to i64, !dbg !86
  %arrayidx = getelementptr inbounds i32, ptr %3, i64 %idxprom, !dbg !86
  %5 = load i32, ptr %arrayidx, align 4, !dbg !86
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %5), !dbg !89
  %6 = load i32, ptr %i, align 4, !dbg !90
  %inc = add nsw i32 %6, 1, !dbg !90
  store i32 %inc, ptr %i, align 4, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %7 = load ptr, ptr %arr.addr, align 8, !dbg !95
  %8 = load i32, ptr %size.addr, align 4, !dbg !96
  %sub2 = sub nsw i32 %8, 1, !dbg !97
  %idxprom3 = sext i32 %sub2 to i64, !dbg !95
  %arrayidx4 = getelementptr inbounds i32, ptr %7, i64 %idxprom3, !dbg !95
  %9 = load i32, ptr %arrayidx4, align 4, !dbg !95
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %9), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @binary_search(ptr noundef %arr, i32 noundef %size, i32 noundef %target) #0 !dbg !100 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %target.addr = alloca i32, align 4
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  %mid = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arr.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 %target, ptr %target.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %target.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load ptr, ptr %arr.addr, align 8, !dbg !109
  %1 = load i32, ptr %size.addr, align 4, !dbg !110
  %2 = load i32, ptr %target.addr, align 4, !dbg !111
  call void @print_data(ptr noundef %0, i32 noundef %1, i32 noundef %2), !dbg !112
  call void @llvm.dbg.declare(metadata ptr %left, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 0, ptr %left, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata ptr %right, metadata !115, metadata !DIExpression()), !dbg !116
  %3 = load i32, ptr %size.addr, align 4, !dbg !117
  store i32 %3, ptr %right, align 4, !dbg !116
  br label %while.cond, !dbg !118

while.cond:                                       ; preds = %if.end, %entry
  %4 = load i32, ptr %left, align 4, !dbg !119
  %5 = load i32, ptr %right, align 4, !dbg !120
  %cmp = icmp slt i32 %4, %5, !dbg !121
  br i1 %cmp, label %while.body, label %while.end, !dbg !118

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata ptr %mid, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = load i32, ptr %left, align 4, !dbg !125
  %7 = load i32, ptr %right, align 4, !dbg !126
  %add = add nsw i32 %6, %7, !dbg !127
  %div = sdiv i32 %add, 2, !dbg !128
  store i32 %div, ptr %mid, align 4, !dbg !124
  %8 = load i32, ptr %target.addr, align 4, !dbg !129
  %9 = load ptr, ptr %arr.addr, align 8, !dbg !131
  %10 = load i32, ptr %mid, align 4, !dbg !132
  %idxprom = sext i32 %10 to i64, !dbg !131
  %arrayidx = getelementptr inbounds i32, ptr %9, i64 %idxprom, !dbg !131
  %11 = load i32, ptr %arrayidx, align 4, !dbg !131
  %cmp1 = icmp sle i32 %8, %11, !dbg !133
  br i1 %cmp1, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %while.body
  %12 = load i32, ptr %mid, align 4, !dbg !135
  store i32 %12, ptr %right, align 4, !dbg !137
  br label %if.end, !dbg !138

if.else:                                          ; preds = %while.body
  %13 = load i32, ptr %mid, align 4, !dbg !139
  %add2 = add nsw i32 %13, 1, !dbg !141
  store i32 %add2, ptr %left, align 4, !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !118, !llvm.loop !143

while.end:                                        ; preds = %while.cond
  %14 = load i32, ptr %left, align 4, !dbg !145
  ret i32 %14, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @is_sorted(ptr noundef %arr, i32 noundef %size) #0 !dbg !147 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arr.addr, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata ptr %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i32 0, ptr %i, align 4, !dbg !156
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, ptr %i, align 4, !dbg !158
  %1 = load i32, ptr %size.addr, align 4, !dbg !160
  %sub = sub nsw i32 %1, 1, !dbg !161
  %cmp = icmp slt i32 %0, %sub, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %arr.addr, align 8, !dbg !164
  %3 = load i32, ptr %i, align 4, !dbg !166
  %idxprom = sext i32 %3 to i64, !dbg !164
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom, !dbg !164
  %4 = load i32, ptr %arrayidx, align 4, !dbg !164
  %5 = load ptr, ptr %arr.addr, align 8, !dbg !167
  %6 = load i32, ptr %i, align 4, !dbg !168
  %add = add nsw i32 %6, 1, !dbg !169
  %idxprom1 = sext i32 %add to i64, !dbg !167
  %arrayidx2 = getelementptr inbounds i32, ptr %5, i64 %idxprom1, !dbg !167
  %7 = load i32, ptr %arrayidx2, align 4, !dbg !167
  %cmp3 = icmp sle i32 %4, %7, !dbg !170
  %conv = zext i1 %cmp3 to i32, !dbg !170
  %conv4 = sext i32 %conv to i64, !dbg !164
  call void @klee_assume(i64 noundef %conv4), !dbg !171
  %8 = load i32, ptr %i, align 4, !dbg !172
  %inc = add nsw i32 %8, 1, !dbg !172
  store i32 %inc, ptr %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  ret void, !dbg !176
}

declare void @klee_assume(i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %x = alloca i32, align 4
  %pos = alloca i32, align 4
  %i = alloca i32, align 4
  %i5 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.dbg.declare(metadata ptr %a, metadata !180, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !183
  call void @klee_make_symbolic(ptr noundef %arraydecay, i64 noundef 40, ptr noundef @.str.3), !dbg !184
  call void @llvm.dbg.declare(metadata ptr %x, metadata !185, metadata !DIExpression()), !dbg !186
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef @.str.4), !dbg !187
  %arraydecay1 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !188
  call void @is_sorted(ptr noundef %arraydecay1, i32 noundef 10), !dbg !189
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !190, metadata !DIExpression()), !dbg !191
  %arraydecay2 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !192
  %0 = load i32, ptr %x, align 4, !dbg !193
  %call = call i32 @binary_search(ptr noundef %arraydecay2, i32 noundef 10, i32 noundef %0), !dbg !194
  store i32 %call, ptr %pos, align 4, !dbg !191
  %1 = load i32, ptr %x, align 4, !dbg !195
  %2 = load i32, ptr %pos, align 4, !dbg !196
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %1, i32 noundef %2), !dbg !197
  call void @llvm.dbg.declare(metadata ptr %i, metadata !198, metadata !DIExpression()), !dbg !200
  store i32 0, ptr %i, align 4, !dbg !200
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, ptr %i, align 4, !dbg !202
  %4 = load i32, ptr %pos, align 4, !dbg !204
  %cmp = icmp slt i32 %3, %4, !dbg !205
  br i1 %cmp, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !207
  %idxprom = sext i32 %5 to i64, !dbg !207
  %arrayidx = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 %idxprom, !dbg !207
  %6 = load i32, ptr %arrayidx, align 4, !dbg !207
  %7 = load i32, ptr %x, align 4, !dbg !207
  %cmp4 = icmp slt i32 %6, %7, !dbg !207
  br i1 %cmp4, label %for.inc, label %if.else, !dbg !211

if.else:                                          ; preds = %for.body
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 64, ptr noundef @__PRETTY_FUNCTION__.main) #4, !dbg !207
  unreachable, !dbg !207

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !212
  %inc = add nsw i32 %8, 1, !dbg !212
  store i32 %inc, ptr %i, align 4, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %i5, metadata !216, metadata !DIExpression()), !dbg !218
  %9 = load i32, ptr %pos, align 4, !dbg !219
  store i32 %9, ptr %i5, align 4, !dbg !218
  br label %for.cond6, !dbg !220

for.cond6:                                        ; preds = %for.inc15, %for.end
  %10 = load i32, ptr %i5, align 4, !dbg !221
  %cmp7 = icmp slt i32 %10, 10, !dbg !223
  br i1 %cmp7, label %for.body8, label %for.end17, !dbg !224

for.body8:                                        ; preds = %for.cond6
  %11 = load i32, ptr %i5, align 4, !dbg !225
  %idxprom9 = sext i32 %11 to i64, !dbg !225
  %arrayidx10 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 %idxprom9, !dbg !225
  %12 = load i32, ptr %arrayidx10, align 4, !dbg !225
  %13 = load i32, ptr %x, align 4, !dbg !225
  %cmp11 = icmp sge i32 %12, %13, !dbg !225
  br i1 %cmp11, label %for.inc15, label %if.else13, !dbg !229

if.else13:                                        ; preds = %for.body8
  call void @__assert_fail(ptr noundef @.str.8, ptr noundef @.str.7, i32 noundef 67, ptr noundef @__PRETTY_FUNCTION__.main) #4, !dbg !225
  unreachable, !dbg !225

for.inc15:                                        ; preds = %for.body8
  %14 = load i32, ptr %i5, align 4, !dbg !230
  %inc16 = add nsw i32 %14, 1, !dbg !230
  store i32 %inc16, ptr %i5, align 4, !dbg !230
  br label %for.cond6, !dbg !231, !llvm.loop !232

for.end17:                                        ; preds = %for.cond6
  %call18 = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !234
  ret i32 0, !dbg !235
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!52}
!llvm.module.flags = !{!54, !55, !56, !57, !58, !59, !60}
!llvm.ident = !{!61}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 9, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "binary_search.c", directory: "/workspace/hw2/task3", checksumkind: CSK_MD5, checksum: "635e62ab990c4cdfc34338a2f0cba1cf")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 42)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 5)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !9, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 45, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 2)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !16, isLocal: true, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(scope: null, file: !2, line: 59, type: !23, isLocal: true, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 33)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 9)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 16)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 88, elements: !40)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !2, line: 67, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !2, line: 70, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 41)
!52 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !53, splitDebugInlining: false, nameTableKind: None)
!53 = !{!0, !7, !12, !14, !19, !21, !26, !31, !36, !42, !47}
!54 = !{i32 7, !"Dwarf Version", i32 5}
!55 = !{i32 2, !"Debug Info Version", i32 3}
!56 = !{i32 1, !"wchar_size", i32 4}
!57 = !{i32 8, !"PIC Level", i32 2}
!58 = !{i32 7, !"PIE Level", i32 2}
!59 = !{i32 7, !"uwtable", i32 2}
!60 = !{i32 7, !"frame-pointer", i32 2}
!61 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!62 = distinct !DISubprogram(name: "print_data", scope: !2, file: !2, line: 8, type: !63, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !67)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !65, !66, !66}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !{}
!68 = !DILocalVariable(name: "arr", arg: 1, scope: !62, file: !2, line: 8, type: !65)
!69 = !DILocation(line: 8, column: 21, scope: !62)
!70 = !DILocalVariable(name: "size", arg: 2, scope: !62, file: !2, line: 8, type: !66)
!71 = !DILocation(line: 8, column: 32, scope: !62)
!72 = !DILocalVariable(name: "target", arg: 3, scope: !62, file: !2, line: 8, type: !66)
!73 = !DILocation(line: 8, column: 42, scope: !62)
!74 = !DILocation(line: 9, column: 58, scope: !62)
!75 = !DILocation(line: 9, column: 5, scope: !62)
!76 = !DILocalVariable(name: "i", scope: !77, file: !2, line: 10, type: !66)
!77 = distinct !DILexicalBlock(scope: !62, file: !2, line: 10, column: 5)
!78 = !DILocation(line: 10, column: 14, scope: !77)
!79 = !DILocation(line: 10, column: 10, scope: !77)
!80 = !DILocation(line: 10, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !2, line: 10, column: 5)
!82 = !DILocation(line: 10, column: 23, scope: !81)
!83 = !DILocation(line: 10, column: 27, scope: !81)
!84 = !DILocation(line: 10, column: 21, scope: !81)
!85 = !DILocation(line: 10, column: 5, scope: !77)
!86 = !DILocation(line: 11, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !2, line: 10, column: 36)
!88 = !DILocation(line: 11, column: 28, scope: !87)
!89 = !DILocation(line: 11, column: 9, scope: !87)
!90 = !DILocation(line: 10, column: 32, scope: !81)
!91 = !DILocation(line: 10, column: 5, scope: !81)
!92 = distinct !{!92, !85, !93, !94}
!93 = !DILocation(line: 12, column: 5, scope: !77)
!94 = !{!"llvm.loop.mustprogress"}
!95 = !DILocation(line: 13, column: 21, scope: !62)
!96 = !DILocation(line: 13, column: 25, scope: !62)
!97 = !DILocation(line: 13, column: 29, scope: !62)
!98 = !DILocation(line: 13, column: 5, scope: !62)
!99 = !DILocation(line: 14, column: 1, scope: !62)
!100 = distinct !DISubprogram(name: "binary_search", scope: !2, file: !2, line: 17, type: !101, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !67)
!101 = !DISubroutineType(types: !102)
!102 = !{!66, !65, !66, !66}
!103 = !DILocalVariable(name: "arr", arg: 1, scope: !100, file: !2, line: 17, type: !65)
!104 = !DILocation(line: 17, column: 23, scope: !100)
!105 = !DILocalVariable(name: "size", arg: 2, scope: !100, file: !2, line: 17, type: !66)
!106 = !DILocation(line: 17, column: 34, scope: !100)
!107 = !DILocalVariable(name: "target", arg: 3, scope: !100, file: !2, line: 17, type: !66)
!108 = !DILocation(line: 17, column: 44, scope: !100)
!109 = !DILocation(line: 19, column: 16, scope: !100)
!110 = !DILocation(line: 19, column: 21, scope: !100)
!111 = !DILocation(line: 19, column: 27, scope: !100)
!112 = !DILocation(line: 19, column: 5, scope: !100)
!113 = !DILocalVariable(name: "left", scope: !100, file: !2, line: 21, type: !66)
!114 = !DILocation(line: 21, column: 9, scope: !100)
!115 = !DILocalVariable(name: "right", scope: !100, file: !2, line: 22, type: !66)
!116 = !DILocation(line: 22, column: 9, scope: !100)
!117 = !DILocation(line: 22, column: 17, scope: !100)
!118 = !DILocation(line: 23, column: 5, scope: !100)
!119 = !DILocation(line: 23, column: 12, scope: !100)
!120 = !DILocation(line: 23, column: 19, scope: !100)
!121 = !DILocation(line: 23, column: 17, scope: !100)
!122 = !DILocalVariable(name: "mid", scope: !123, file: !2, line: 24, type: !66)
!123 = distinct !DILexicalBlock(scope: !100, file: !2, line: 23, column: 26)
!124 = !DILocation(line: 24, column: 13, scope: !123)
!125 = !DILocation(line: 24, column: 20, scope: !123)
!126 = !DILocation(line: 24, column: 27, scope: !123)
!127 = !DILocation(line: 24, column: 25, scope: !123)
!128 = !DILocation(line: 24, column: 34, scope: !123)
!129 = !DILocation(line: 25, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !2, line: 25, column: 13)
!131 = !DILocation(line: 25, column: 23, scope: !130)
!132 = !DILocation(line: 25, column: 27, scope: !130)
!133 = !DILocation(line: 25, column: 20, scope: !130)
!134 = !DILocation(line: 25, column: 13, scope: !123)
!135 = !DILocation(line: 26, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !2, line: 25, column: 33)
!137 = !DILocation(line: 26, column: 19, scope: !136)
!138 = !DILocation(line: 27, column: 9, scope: !136)
!139 = !DILocation(line: 28, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !2, line: 27, column: 16)
!141 = !DILocation(line: 28, column: 24, scope: !140)
!142 = !DILocation(line: 28, column: 18, scope: !140)
!143 = distinct !{!143, !118, !144, !94}
!144 = !DILocation(line: 30, column: 5, scope: !100)
!145 = !DILocation(line: 31, column: 12, scope: !100)
!146 = !DILocation(line: 31, column: 5, scope: !100)
!147 = distinct !DISubprogram(name: "is_sorted", scope: !2, file: !2, line: 35, type: !148, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !67)
!148 = !DISubroutineType(types: !149)
!149 = !{null, !65, !66}
!150 = !DILocalVariable(name: "arr", arg: 1, scope: !147, file: !2, line: 35, type: !65)
!151 = !DILocation(line: 35, column: 20, scope: !147)
!152 = !DILocalVariable(name: "size", arg: 2, scope: !147, file: !2, line: 35, type: !66)
!153 = !DILocation(line: 35, column: 31, scope: !147)
!154 = !DILocalVariable(name: "i", scope: !155, file: !2, line: 36, type: !66)
!155 = distinct !DILexicalBlock(scope: !147, file: !2, line: 36, column: 5)
!156 = !DILocation(line: 36, column: 14, scope: !155)
!157 = !DILocation(line: 36, column: 10, scope: !155)
!158 = !DILocation(line: 36, column: 19, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !2, line: 36, column: 5)
!160 = !DILocation(line: 36, column: 23, scope: !159)
!161 = !DILocation(line: 36, column: 27, scope: !159)
!162 = !DILocation(line: 36, column: 21, scope: !159)
!163 = !DILocation(line: 36, column: 5, scope: !155)
!164 = !DILocation(line: 37, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !159, file: !2, line: 36, column: 36)
!166 = !DILocation(line: 37, column: 25, scope: !165)
!167 = !DILocation(line: 37, column: 31, scope: !165)
!168 = !DILocation(line: 37, column: 35, scope: !165)
!169 = !DILocation(line: 37, column: 36, scope: !165)
!170 = !DILocation(line: 37, column: 28, scope: !165)
!171 = !DILocation(line: 37, column: 9, scope: !165)
!172 = !DILocation(line: 36, column: 32, scope: !159)
!173 = !DILocation(line: 36, column: 5, scope: !159)
!174 = distinct !{!174, !163, !175, !94}
!175 = !DILocation(line: 38, column: 5, scope: !155)
!176 = !DILocation(line: 39, column: 5, scope: !147)
!177 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 43, type: !178, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !52, retainedNodes: !67)
!178 = !DISubroutineType(types: !179)
!179 = !{!66}
!180 = !DILocalVariable(name: "a", scope: !177, file: !2, line: 44, type: !181)
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 320, elements: !45)
!182 = !DILocation(line: 44, column: 9, scope: !177)
!183 = !DILocation(line: 45, column: 24, scope: !177)
!184 = !DILocation(line: 45, column: 5, scope: !177)
!185 = !DILocalVariable(name: "x", scope: !177, file: !2, line: 46, type: !66)
!186 = !DILocation(line: 46, column: 9, scope: !177)
!187 = !DILocation(line: 47, column: 5, scope: !177)
!188 = !DILocation(line: 55, column: 15, scope: !177)
!189 = !DILocation(line: 55, column: 5, scope: !177)
!190 = !DILocalVariable(name: "pos", scope: !177, file: !2, line: 57, type: !66)
!191 = !DILocation(line: 57, column: 9, scope: !177)
!192 = !DILocation(line: 57, column: 29, scope: !177)
!193 = !DILocation(line: 57, column: 36, scope: !177)
!194 = !DILocation(line: 57, column: 15, scope: !177)
!195 = !DILocation(line: 59, column: 49, scope: !177)
!196 = !DILocation(line: 59, column: 52, scope: !177)
!197 = !DILocation(line: 59, column: 5, scope: !177)
!198 = !DILocalVariable(name: "i", scope: !199, file: !2, line: 63, type: !66)
!199 = distinct !DILexicalBlock(scope: !177, file: !2, line: 63, column: 5)
!200 = !DILocation(line: 63, column: 14, scope: !199)
!201 = !DILocation(line: 63, column: 10, scope: !199)
!202 = !DILocation(line: 63, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !2, line: 63, column: 5)
!204 = !DILocation(line: 63, column: 25, scope: !203)
!205 = !DILocation(line: 63, column: 23, scope: !203)
!206 = !DILocation(line: 63, column: 5, scope: !199)
!207 = !DILocation(line: 64, column: 9, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !2, line: 64, column: 9)
!209 = distinct !DILexicalBlock(scope: !210, file: !2, line: 64, column: 9)
!210 = distinct !DILexicalBlock(scope: !203, file: !2, line: 63, column: 35)
!211 = !DILocation(line: 64, column: 9, scope: !209)
!212 = !DILocation(line: 63, column: 31, scope: !203)
!213 = !DILocation(line: 63, column: 5, scope: !203)
!214 = distinct !{!214, !206, !215, !94}
!215 = !DILocation(line: 65, column: 5, scope: !199)
!216 = !DILocalVariable(name: "i", scope: !217, file: !2, line: 66, type: !66)
!217 = distinct !DILexicalBlock(scope: !177, file: !2, line: 66, column: 5)
!218 = !DILocation(line: 66, column: 14, scope: !217)
!219 = !DILocation(line: 66, column: 18, scope: !217)
!220 = !DILocation(line: 66, column: 10, scope: !217)
!221 = !DILocation(line: 66, column: 23, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !2, line: 66, column: 5)
!223 = !DILocation(line: 66, column: 25, scope: !222)
!224 = !DILocation(line: 66, column: 5, scope: !217)
!225 = !DILocation(line: 67, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !227, file: !2, line: 67, column: 9)
!227 = distinct !DILexicalBlock(scope: !228, file: !2, line: 67, column: 9)
!228 = distinct !DILexicalBlock(scope: !222, file: !2, line: 66, column: 36)
!229 = !DILocation(line: 67, column: 9, scope: !227)
!230 = !DILocation(line: 66, column: 32, scope: !222)
!231 = !DILocation(line: 66, column: 5, scope: !222)
!232 = distinct !{!232, !224, !233, !94}
!233 = !DILocation(line: 68, column: 5, scope: !217)
!234 = !DILocation(line: 70, column: 5, scope: !177)
!235 = !DILocation(line: 71, column: 5, scope: !177)
