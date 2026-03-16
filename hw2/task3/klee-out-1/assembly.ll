; ModuleID = 'binary_search.bc'
source_filename = "binary_search.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [2 x i8] c"x\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [9 x i8] c"a[i] < x\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [16 x i8] c"binary_search.c\00", align 1, !dbg !14
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1, !dbg !19
@.str.4 = private unnamed_addr constant [10 x i8] c"a[i] >= x\00", align 1, !dbg !25
@.str.5 = private unnamed_addr constant [41 x i8] c"The algorithm passed correctness check.\0A\00", align 1, !dbg !30

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @binary_search(ptr noundef %arr, i32 noundef %size, i32 noundef %target) #0 !dbg !45 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %target.addr = alloca i32, align 4
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  %mid = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arr.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 %target, ptr %target.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %target.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %left, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 0, ptr %left, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %right, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, ptr %size.addr, align 4, !dbg !61
  store i32 %0, ptr %right, align 4, !dbg !60
  br label %while.cond, !dbg !62

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i32, ptr %left, align 4, !dbg !63
  %2 = load i32, ptr %right, align 4, !dbg !64
  %cmp = icmp slt i32 %1, %2, !dbg !65
  br i1 %cmp, label %while.body, label %while.end, !dbg !62

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata ptr %mid, metadata !66, metadata !DIExpression()), !dbg !68
  %3 = load i32, ptr %left, align 4, !dbg !69
  %4 = load i32, ptr %right, align 4, !dbg !70
  %add = add nsw i32 %3, %4, !dbg !71
  %div = sdiv i32 %add, 2, !dbg !72
  store i32 %div, ptr %mid, align 4, !dbg !68
  %5 = load i32, ptr %target.addr, align 4, !dbg !73
  %6 = load ptr, ptr %arr.addr, align 8, !dbg !75
  %7 = load i32, ptr %mid, align 4, !dbg !76
  %idxprom = sext i32 %7 to i64, !dbg !75
  %arrayidx = getelementptr inbounds i32, ptr %6, i64 %idxprom, !dbg !75
  %8 = load i32, ptr %arrayidx, align 4, !dbg !75
  %cmp1 = icmp sle i32 %5, %8, !dbg !77
  br i1 %cmp1, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %while.body
  %9 = load i32, ptr %mid, align 4, !dbg !79
  store i32 %9, ptr %right, align 4, !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %while.body
  %10 = load i32, ptr %mid, align 4, !dbg !83
  %add2 = add nsw i32 %10, 1, !dbg !85
  store i32 %add2, ptr %left, align 4, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !62, !llvm.loop !87

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %left, align 4, !dbg !90
  ret i32 %11, !dbg !91
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @is_sorted(ptr noundef %arr, i32 noundef %size) #0 !dbg !92 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %arr.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %i, metadata !99, metadata !DIExpression()), !dbg !101
  store i32 0, ptr %i, align 4, !dbg !101
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, ptr %i, align 4, !dbg !103
  %1 = load i32, ptr %size.addr, align 4, !dbg !105
  %sub = sub nsw i32 %1, 1, !dbg !106
  %cmp = icmp slt i32 %0, %sub, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %arr.addr, align 8, !dbg !109
  %3 = load i32, ptr %i, align 4, !dbg !111
  %idxprom = sext i32 %3 to i64, !dbg !109
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom, !dbg !109
  %4 = load i32, ptr %arrayidx, align 4, !dbg !109
  %5 = load ptr, ptr %arr.addr, align 8, !dbg !112
  %6 = load i32, ptr %i, align 4, !dbg !113
  %add = add nsw i32 %6, 1, !dbg !114
  %idxprom1 = sext i32 %add to i64, !dbg !112
  %arrayidx2 = getelementptr inbounds i32, ptr %5, i64 %idxprom1, !dbg !112
  %7 = load i32, ptr %arrayidx2, align 4, !dbg !112
  %cmp3 = icmp sle i32 %4, %7, !dbg !115
  %conv = zext i1 %cmp3 to i32, !dbg !115
  %conv4 = sext i32 %conv to i64, !dbg !109
  call void @klee_assume(i64 noundef %conv4), !dbg !116
  %8 = load i32, ptr %i, align 4, !dbg !117
  %inc = add nsw i32 %8, 1, !dbg !117
  store i32 %inc, ptr %i, align 4, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  ret void, !dbg !121
}

declare void @klee_assume(i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %x = alloca i32, align 4
  %pos = alloca i32, align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.dbg.declare(metadata ptr %a, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !128
  call void @klee_make_symbolic(ptr noundef %arraydecay, i64 noundef 40, ptr noundef @.str), !dbg !129
  call void @llvm.dbg.declare(metadata ptr %x, metadata !130, metadata !DIExpression()), !dbg !131
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef @.str.1), !dbg !132
  %arraydecay1 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !133
  call void @is_sorted(ptr noundef %arraydecay1, i32 noundef 10), !dbg !134
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay2 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 0, !dbg !137
  %0 = load i32, ptr %x, align 4, !dbg !138
  %call = call i32 @binary_search(ptr noundef %arraydecay2, i32 noundef 10, i32 noundef %0), !dbg !139
  store i32 %call, ptr %pos, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata ptr %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i32 0, ptr %i, align 4, !dbg !142
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4, !dbg !144
  %2 = load i32, ptr %pos, align 4, !dbg !146
  %cmp = icmp slt i32 %1, %2, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %3 = load i32, ptr %i, align 4, !dbg !149
  %idxprom = sext i32 %3 to i64, !dbg !149
  %arrayidx = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 %idxprom, !dbg !149
  %4 = load i32, ptr %arrayidx, align 4, !dbg !149
  %5 = load i32, ptr %x, align 4, !dbg !149
  %cmp3 = icmp slt i32 %4, %5, !dbg !149
  br i1 %cmp3, label %for.inc, label %if.else, !dbg !153

if.else:                                          ; preds = %for.body
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.3, i32 noundef 64, ptr noundef @__PRETTY_FUNCTION__.main) #4, !dbg !149
  unreachable, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i32, ptr %i, align 4, !dbg !154
  %inc = add nsw i32 %6, 1, !dbg !154
  store i32 %inc, ptr %i, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %i4, metadata !158, metadata !DIExpression()), !dbg !160
  %7 = load i32, ptr %pos, align 4, !dbg !161
  store i32 %7, ptr %i4, align 4, !dbg !160
  br label %for.cond5, !dbg !162

for.cond5:                                        ; preds = %for.inc14, %for.end
  %8 = load i32, ptr %i4, align 4, !dbg !163
  %cmp6 = icmp slt i32 %8, 10, !dbg !165
  br i1 %cmp6, label %for.body7, label %for.end16, !dbg !166

for.body7:                                        ; preds = %for.cond5
  %9 = load i32, ptr %i4, align 4, !dbg !167
  %idxprom8 = sext i32 %9 to i64, !dbg !167
  %arrayidx9 = getelementptr inbounds [10 x i32], ptr %a, i64 0, i64 %idxprom8, !dbg !167
  %10 = load i32, ptr %arrayidx9, align 4, !dbg !167
  %11 = load i32, ptr %x, align 4, !dbg !167
  %cmp10 = icmp sge i32 %10, %11, !dbg !167
  br i1 %cmp10, label %for.inc14, label %if.else12, !dbg !171

if.else12:                                        ; preds = %for.body7
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.3, i32 noundef 67, ptr noundef @__PRETTY_FUNCTION__.main) #4, !dbg !167
  unreachable, !dbg !167

for.inc14:                                        ; preds = %for.body7
  %12 = load i32, ptr %i4, align 4, !dbg !172
  %inc15 = add nsw i32 %12, 1, !dbg !172
  store i32 %inc15, ptr %i4, align 4, !dbg !172
  br label %for.cond5, !dbg !173, !llvm.loop !174

for.end16:                                        ; preds = %for.cond5
  %call17 = call i32 (ptr, ...) @printf(ptr noundef @.str.5), !dbg !176
  ret i32 0, !dbg !177
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!35}
!llvm.module.flags = !{!37, !38, !39, !40, !41, !42, !43}
!llvm.ident = !{!44}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 45, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "binary_search.c", directory: "/workspace/hw2/task3", checksumkind: CSK_MD5, checksum: "fa1da4e33b0df74db27bae89b9df8a1a")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 2)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 9)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 16)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !21, isLocal: true, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 88, elements: !23)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !2, line: 67, type: !27, isLocal: true, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !2, line: 70, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 41)
!35 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !36, splitDebugInlining: false, nameTableKind: None)
!36 = !{!0, !7, !9, !14, !19, !25, !30}
!37 = !{i32 7, !"Dwarf Version", i32 5}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 8, !"PIC Level", i32 2}
!41 = !{i32 7, !"PIE Level", i32 2}
!42 = !{i32 7, !"uwtable", i32 2}
!43 = !{i32 7, !"frame-pointer", i32 2}
!44 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!45 = distinct !DISubprogram(name: "binary_search", scope: !2, file: !2, line: 17, type: !46, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !50)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !49, !48, !48}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!50 = !{}
!51 = !DILocalVariable(name: "arr", arg: 1, scope: !45, file: !2, line: 17, type: !49)
!52 = !DILocation(line: 17, column: 23, scope: !45)
!53 = !DILocalVariable(name: "size", arg: 2, scope: !45, file: !2, line: 17, type: !48)
!54 = !DILocation(line: 17, column: 34, scope: !45)
!55 = !DILocalVariable(name: "target", arg: 3, scope: !45, file: !2, line: 17, type: !48)
!56 = !DILocation(line: 17, column: 44, scope: !45)
!57 = !DILocalVariable(name: "left", scope: !45, file: !2, line: 21, type: !48)
!58 = !DILocation(line: 21, column: 9, scope: !45)
!59 = !DILocalVariable(name: "right", scope: !45, file: !2, line: 22, type: !48)
!60 = !DILocation(line: 22, column: 9, scope: !45)
!61 = !DILocation(line: 22, column: 17, scope: !45)
!62 = !DILocation(line: 23, column: 5, scope: !45)
!63 = !DILocation(line: 23, column: 12, scope: !45)
!64 = !DILocation(line: 23, column: 19, scope: !45)
!65 = !DILocation(line: 23, column: 17, scope: !45)
!66 = !DILocalVariable(name: "mid", scope: !67, file: !2, line: 24, type: !48)
!67 = distinct !DILexicalBlock(scope: !45, file: !2, line: 23, column: 26)
!68 = !DILocation(line: 24, column: 13, scope: !67)
!69 = !DILocation(line: 24, column: 20, scope: !67)
!70 = !DILocation(line: 24, column: 27, scope: !67)
!71 = !DILocation(line: 24, column: 25, scope: !67)
!72 = !DILocation(line: 24, column: 34, scope: !67)
!73 = !DILocation(line: 25, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !67, file: !2, line: 25, column: 13)
!75 = !DILocation(line: 25, column: 23, scope: !74)
!76 = !DILocation(line: 25, column: 27, scope: !74)
!77 = !DILocation(line: 25, column: 20, scope: !74)
!78 = !DILocation(line: 25, column: 13, scope: !67)
!79 = !DILocation(line: 26, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !2, line: 25, column: 33)
!81 = !DILocation(line: 26, column: 19, scope: !80)
!82 = !DILocation(line: 27, column: 9, scope: !80)
!83 = !DILocation(line: 28, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !2, line: 27, column: 16)
!85 = !DILocation(line: 28, column: 24, scope: !84)
!86 = !DILocation(line: 28, column: 18, scope: !84)
!87 = distinct !{!87, !62, !88, !89}
!88 = !DILocation(line: 30, column: 5, scope: !45)
!89 = !{!"llvm.loop.mustprogress"}
!90 = !DILocation(line: 31, column: 12, scope: !45)
!91 = !DILocation(line: 31, column: 5, scope: !45)
!92 = distinct !DISubprogram(name: "is_sorted", scope: !2, file: !2, line: 35, type: !93, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !50)
!93 = !DISubroutineType(types: !94)
!94 = !{null, !49, !48}
!95 = !DILocalVariable(name: "arr", arg: 1, scope: !92, file: !2, line: 35, type: !49)
!96 = !DILocation(line: 35, column: 20, scope: !92)
!97 = !DILocalVariable(name: "size", arg: 2, scope: !92, file: !2, line: 35, type: !48)
!98 = !DILocation(line: 35, column: 31, scope: !92)
!99 = !DILocalVariable(name: "i", scope: !100, file: !2, line: 36, type: !48)
!100 = distinct !DILexicalBlock(scope: !92, file: !2, line: 36, column: 5)
!101 = !DILocation(line: 36, column: 14, scope: !100)
!102 = !DILocation(line: 36, column: 10, scope: !100)
!103 = !DILocation(line: 36, column: 19, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 36, column: 5)
!105 = !DILocation(line: 36, column: 23, scope: !104)
!106 = !DILocation(line: 36, column: 27, scope: !104)
!107 = !DILocation(line: 36, column: 21, scope: !104)
!108 = !DILocation(line: 36, column: 5, scope: !100)
!109 = !DILocation(line: 37, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !2, line: 36, column: 36)
!111 = !DILocation(line: 37, column: 25, scope: !110)
!112 = !DILocation(line: 37, column: 31, scope: !110)
!113 = !DILocation(line: 37, column: 35, scope: !110)
!114 = !DILocation(line: 37, column: 36, scope: !110)
!115 = !DILocation(line: 37, column: 28, scope: !110)
!116 = !DILocation(line: 37, column: 9, scope: !110)
!117 = !DILocation(line: 36, column: 32, scope: !104)
!118 = !DILocation(line: 36, column: 5, scope: !104)
!119 = distinct !{!119, !108, !120, !89}
!120 = !DILocation(line: 38, column: 5, scope: !100)
!121 = !DILocation(line: 39, column: 5, scope: !92)
!122 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 43, type: !123, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !50)
!123 = !DISubroutineType(types: !124)
!124 = !{!48}
!125 = !DILocalVariable(name: "a", scope: !122, file: !2, line: 44, type: !126)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 320, elements: !28)
!127 = !DILocation(line: 44, column: 9, scope: !122)
!128 = !DILocation(line: 45, column: 24, scope: !122)
!129 = !DILocation(line: 45, column: 5, scope: !122)
!130 = !DILocalVariable(name: "x", scope: !122, file: !2, line: 46, type: !48)
!131 = !DILocation(line: 46, column: 9, scope: !122)
!132 = !DILocation(line: 47, column: 5, scope: !122)
!133 = !DILocation(line: 55, column: 15, scope: !122)
!134 = !DILocation(line: 55, column: 5, scope: !122)
!135 = !DILocalVariable(name: "pos", scope: !122, file: !2, line: 57, type: !48)
!136 = !DILocation(line: 57, column: 9, scope: !122)
!137 = !DILocation(line: 57, column: 29, scope: !122)
!138 = !DILocation(line: 57, column: 36, scope: !122)
!139 = !DILocation(line: 57, column: 15, scope: !122)
!140 = !DILocalVariable(name: "i", scope: !141, file: !2, line: 63, type: !48)
!141 = distinct !DILexicalBlock(scope: !122, file: !2, line: 63, column: 5)
!142 = !DILocation(line: 63, column: 14, scope: !141)
!143 = !DILocation(line: 63, column: 10, scope: !141)
!144 = !DILocation(line: 63, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !2, line: 63, column: 5)
!146 = !DILocation(line: 63, column: 25, scope: !145)
!147 = !DILocation(line: 63, column: 23, scope: !145)
!148 = !DILocation(line: 63, column: 5, scope: !141)
!149 = !DILocation(line: 64, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !2, line: 64, column: 9)
!151 = distinct !DILexicalBlock(scope: !152, file: !2, line: 64, column: 9)
!152 = distinct !DILexicalBlock(scope: !145, file: !2, line: 63, column: 35)
!153 = !DILocation(line: 64, column: 9, scope: !151)
!154 = !DILocation(line: 63, column: 31, scope: !145)
!155 = !DILocation(line: 63, column: 5, scope: !145)
!156 = distinct !{!156, !148, !157, !89}
!157 = !DILocation(line: 65, column: 5, scope: !141)
!158 = !DILocalVariable(name: "i", scope: !159, file: !2, line: 66, type: !48)
!159 = distinct !DILexicalBlock(scope: !122, file: !2, line: 66, column: 5)
!160 = !DILocation(line: 66, column: 14, scope: !159)
!161 = !DILocation(line: 66, column: 18, scope: !159)
!162 = !DILocation(line: 66, column: 10, scope: !159)
!163 = !DILocation(line: 66, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !2, line: 66, column: 5)
!165 = !DILocation(line: 66, column: 25, scope: !164)
!166 = !DILocation(line: 66, column: 5, scope: !159)
!167 = !DILocation(line: 67, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !169, file: !2, line: 67, column: 9)
!169 = distinct !DILexicalBlock(scope: !170, file: !2, line: 67, column: 9)
!170 = distinct !DILexicalBlock(scope: !164, file: !2, line: 66, column: 36)
!171 = !DILocation(line: 67, column: 9, scope: !169)
!172 = !DILocation(line: 66, column: 32, scope: !164)
!173 = !DILocation(line: 66, column: 5, scope: !164)
!174 = distinct !{!174, !166, !175, !89}
!175 = !DILocation(line: 68, column: 5, scope: !159)
!176 = !DILocation(line: 70, column: 5, scope: !122)
!177 = !DILocation(line: 71, column: 5, scope: !122)
