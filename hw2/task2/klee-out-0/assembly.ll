; ModuleID = 'maze.bc'
source_filename = "maze.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@maze = dso_local global [10 x [12 x i8]] [[12 x i8] c"+---------+\00", [12 x i8] c"|         |\00", [12 x i8] c"| +---+ | |\00", [12 x i8] c"| |   | | |\00", [12 x i8] c"| | | | | |\00", [12 x i8] c"| | +-+ +-+\00", [12 x i8] c"| |   |   |\00", [12 x i8] c"| +-+ +-- |\00", [12 x i8] c"|  #|     |\00", [12 x i8] c"+---+-----+\00"], align 16, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1, !dbg !5
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !11
@.str.2 = private unnamed_addr constant [8 x i8] c"program\00", align 1, !dbg !16
@.str.3 = private unnamed_addr constant [24 x i8] c"Maze dimensions: %dx%d\0A\00", align 1, !dbg !21
@.str.4 = private unnamed_addr constant [19 x i8] c"Player pos: %dx%d\0A\00", align 1, !dbg !26
@.str.5 = private unnamed_addr constant [18 x i8] c"Iteration no. %d\0A\00", align 1, !dbg !31
@.str.6 = private unnamed_addr constant [67 x i8] c"Program the player moves with a sequence of 'w', 's', 'a' and 'd'\0A\00", align 1, !dbg !36
@.str.7 = private unnamed_addr constant [28 x i8] c"Try to reach the price(#)!\0A\00", align 1, !dbg !41
@.str.8 = private unnamed_addr constant [40 x i8] c"Wrong command!(only w,s,a,d accepted!)\0A\00", align 1, !dbg !46
@.str.9 = private unnamed_addr constant [11 x i8] c"You lose!\0A\00", align 1, !dbg !51
@.str.10 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1, !dbg !56
@.str.11 = private unnamed_addr constant [22 x i8] c"Your solution <%42s>\0A\00", align 1, !dbg !61
@.str.12 = private unnamed_addr constant [2 x i8] c"0\00", align 1, !dbg !66
@.str.13 = private unnamed_addr constant [7 x i8] c"maze.c\00", align 1, !dbg !68
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1, !dbg !73
@.str.14 = private unnamed_addr constant [34 x i8] c"Iteration no. %d. Action: %c. %s\0A\00", align 1, !dbg !79
@.str.15 = private unnamed_addr constant [9 x i8] c"Blocked!\00", align 1, !dbg !84
@.str.16 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !89
@.str.17 = private unnamed_addr constant [10 x i8] c"You lose\0A\00", align 1, !dbg !94

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw() #0 !dbg !107 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %i, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata ptr %j, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 0, ptr %i, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.end, %entry
  %0 = load i32, ptr %i, align 4, !dbg !119
  %cmp = icmp slt i32 %0, 10, !dbg !121
  br i1 %cmp, label %for.body, label %for.end9, !dbg !122

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4, !dbg !123
  br label %for.cond1, !dbg !126

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, ptr %j, align 4, !dbg !127
  %cmp2 = icmp slt i32 %1, 12, !dbg !129
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !130

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, ptr %i, align 4, !dbg !131
  %idxprom = sext i32 %2 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom, !dbg !132
  %3 = load i32, ptr %j, align 4, !dbg !133
  %idxprom4 = sext i32 %3 to i64, !dbg !132
  %arrayidx5 = getelementptr inbounds [12 x i8], ptr %arrayidx, i64 0, i64 %idxprom4, !dbg !132
  %4 = load i8, ptr %arrayidx5, align 1, !dbg !132
  %conv = sext i8 %4 to i32, !dbg !132
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %conv), !dbg !134
  %5 = load i32, ptr %j, align 4, !dbg !135
  %inc = add nsw i32 %5, 1, !dbg !135
  store i32 %inc, ptr %j, align 4, !dbg !135
  br label %for.cond1, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond1
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !140
  %6 = load i32, ptr %i, align 4, !dbg !141
  %inc8 = add nsw i32 %6, 1, !dbg !141
  store i32 %inc8, ptr %i, align 4, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end9:                                         ; preds = %for.cond
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !147 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %ox = alloca i32, align 4
  %oy = alloca i32, align 4
  %i = alloca i32, align 4
  %program = alloca [38 x i8], align 16
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !152, metadata !DIExpression()), !dbg !153
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata ptr %x, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata ptr %y, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata ptr %ox, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata ptr %oy, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata ptr %i, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 0, ptr %i, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata ptr %program, metadata !166, metadata !DIExpression()), !dbg !170
  %arraydecay = getelementptr inbounds [38 x i8], ptr %program, i64 0, i64 0, !dbg !171
  call void @klee_make_symbolic(ptr noundef %arraydecay, i64 noundef 38, ptr noundef @.str.2), !dbg !172
  store i32 5, ptr %x, align 4, !dbg !173
  store i32 4, ptr %y, align 4, !dbg !174
  %0 = load i32, ptr %y, align 4, !dbg !175
  %idxprom = sext i32 %0 to i64, !dbg !176
  %arrayidx = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom, !dbg !176
  %1 = load i32, ptr %x, align 4, !dbg !177
  %idxprom1 = sext i32 %1 to i64, !dbg !176
  %arrayidx2 = getelementptr inbounds [12 x i8], ptr %arrayidx, i64 0, i64 %idxprom1, !dbg !176
  store i8 88, ptr %arrayidx2, align 1, !dbg !178
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef 12, i32 noundef 10), !dbg !179
  %2 = load i32, ptr %x, align 4, !dbg !180
  %3 = load i32, ptr %y, align 4, !dbg !181
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %2, i32 noundef %3), !dbg !182
  %4 = load i32, ptr %i, align 4, !dbg !183
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %4), !dbg !184
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !dbg !185
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7), !dbg !186
  call void @draw(), !dbg !187
  br label %while.cond, !dbg !188

while.cond:                                       ; preds = %if.end67, %entry
  %5 = load i32, ptr %i, align 4, !dbg !189
  %cmp = icmp slt i32 %5, 38, !dbg !190
  br i1 %cmp, label %while.body, label %while.end, !dbg !188

while.body:                                       ; preds = %while.cond
  %6 = load i32, ptr %x, align 4, !dbg !191
  store i32 %6, ptr %ox, align 4, !dbg !193
  %7 = load i32, ptr %y, align 4, !dbg !194
  store i32 %7, ptr %oy, align 4, !dbg !195
  %8 = load i32, ptr %i, align 4, !dbg !196
  %idxprom7 = sext i32 %8 to i64, !dbg !197
  %arrayidx8 = getelementptr inbounds [38 x i8], ptr %program, i64 0, i64 %idxprom7, !dbg !197
  %9 = load i8, ptr %arrayidx8, align 1, !dbg !197
  %conv = sext i8 %9 to i32, !dbg !197
  switch i32 %conv, label %sw.default [
    i32 119, label %sw.bb
    i32 115, label %sw.bb9
    i32 97, label %sw.bb10
    i32 100, label %sw.bb12
  ], !dbg !198

sw.bb:                                            ; preds = %while.body
  %10 = load i32, ptr %y, align 4, !dbg !199
  %dec = add nsw i32 %10, -1, !dbg !199
  store i32 %dec, ptr %y, align 4, !dbg !199
  br label %sw.epilog, !dbg !201

sw.bb9:                                           ; preds = %while.body
  %11 = load i32, ptr %y, align 4, !dbg !202
  %inc = add nsw i32 %11, 1, !dbg !202
  store i32 %inc, ptr %y, align 4, !dbg !202
  br label %sw.epilog, !dbg !203

sw.bb10:                                          ; preds = %while.body
  %12 = load i32, ptr %x, align 4, !dbg !204
  %dec11 = add nsw i32 %12, -1, !dbg !204
  store i32 %dec11, ptr %x, align 4, !dbg !204
  br label %sw.epilog, !dbg !205

sw.bb12:                                          ; preds = %while.body
  %13 = load i32, ptr %x, align 4, !dbg !206
  %inc13 = add nsw i32 %13, 1, !dbg !206
  store i32 %inc13, ptr %x, align 4, !dbg !206
  br label %sw.epilog, !dbg !207

sw.default:                                       ; preds = %while.body
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !dbg !208
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !209
  call void @exit(i32 noundef -1) #4, !dbg !210
  unreachable, !dbg !210

sw.epilog:                                        ; preds = %sw.bb12, %sw.bb10, %sw.bb9, %sw.bb
  %14 = load i32, ptr %y, align 4, !dbg !211
  %idxprom16 = sext i32 %14 to i64, !dbg !213
  %arrayidx17 = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom16, !dbg !213
  %15 = load i32, ptr %x, align 4, !dbg !214
  %idxprom18 = sext i32 %15 to i64, !dbg !213
  %arrayidx19 = getelementptr inbounds [12 x i8], ptr %arrayidx17, i64 0, i64 %idxprom18, !dbg !213
  %16 = load i8, ptr %arrayidx19, align 1, !dbg !213
  %conv20 = sext i8 %16 to i32, !dbg !213
  %cmp21 = icmp eq i32 %conv20, 35, !dbg !215
  br i1 %cmp21, label %if.then, label %if.end, !dbg !216

if.then:                                          ; preds = %sw.epilog
  %call23 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !217
  %arraydecay24 = getelementptr inbounds [38 x i8], ptr %program, i64 0, i64 0, !dbg !219
  %call25 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %arraydecay24), !dbg !220
  call void @__assert_fail(ptr noundef @.str.12, ptr noundef @.str.13, i32 noundef 109, ptr noundef @__PRETTY_FUNCTION__.main) #4, !dbg !221
  unreachable, !dbg !221

if.end:                                           ; preds = %sw.epilog
  %17 = load i32, ptr %y, align 4, !dbg !222
  %idxprom26 = sext i32 %17 to i64, !dbg !224
  %arrayidx27 = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom26, !dbg !224
  %18 = load i32, ptr %x, align 4, !dbg !225
  %idxprom28 = sext i32 %18 to i64, !dbg !224
  %arrayidx29 = getelementptr inbounds [12 x i8], ptr %arrayidx27, i64 0, i64 %idxprom28, !dbg !224
  %19 = load i8, ptr %arrayidx29, align 1, !dbg !224
  %conv30 = sext i8 %19 to i32, !dbg !224
  %cmp31 = icmp ne i32 %conv30, 32, !dbg !226
  br i1 %cmp31, label %land.lhs.true, label %if.end50, !dbg !227

land.lhs.true:                                    ; preds = %if.end
  %20 = load i32, ptr %y, align 4, !dbg !228
  %cmp33 = icmp eq i32 %20, 3, !dbg !229
  br i1 %cmp33, label %land.lhs.true35, label %if.then49, !dbg !230

land.lhs.true35:                                  ; preds = %land.lhs.true
  %21 = load i32, ptr %y, align 4, !dbg !231
  %idxprom36 = sext i32 %21 to i64, !dbg !232
  %arrayidx37 = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom36, !dbg !232
  %22 = load i32, ptr %x, align 4, !dbg !233
  %idxprom38 = sext i32 %22 to i64, !dbg !232
  %arrayidx39 = getelementptr inbounds [12 x i8], ptr %arrayidx37, i64 0, i64 %idxprom38, !dbg !232
  %23 = load i8, ptr %arrayidx39, align 1, !dbg !232
  %conv40 = sext i8 %23 to i32, !dbg !232
  %cmp41 = icmp eq i32 %conv40, 124, !dbg !234
  %24 = load i32, ptr %x, align 4
  %cmp44 = icmp sgt i32 %24, 0
  %or.cond = select i1 %cmp41, i1 %cmp44, i1 false, !dbg !235
  %25 = load i32, ptr %x, align 4
  %cmp47 = icmp slt i32 %25, 12
  %or.cond1 = select i1 %or.cond, i1 %cmp47, i1 false, !dbg !235
  br i1 %or.cond1, label %if.end50, label %if.then49, !dbg !235

if.then49:                                        ; preds = %land.lhs.true35, %land.lhs.true
  %26 = load i32, ptr %ox, align 4, !dbg !236
  store i32 %26, ptr %x, align 4, !dbg !238
  %27 = load i32, ptr %oy, align 4, !dbg !239
  store i32 %27, ptr %y, align 4, !dbg !240
  br label %if.end50, !dbg !241

if.end50:                                         ; preds = %land.lhs.true35, %if.then49, %if.end
  %28 = load i32, ptr %x, align 4, !dbg !242
  %29 = load i32, ptr %y, align 4, !dbg !243
  %call51 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %28, i32 noundef %29), !dbg !244
  %30 = load i32, ptr %i, align 4, !dbg !245
  %31 = load i32, ptr %i, align 4, !dbg !246
  %idxprom52 = sext i32 %31 to i64, !dbg !247
  %arrayidx53 = getelementptr inbounds [38 x i8], ptr %program, i64 0, i64 %idxprom52, !dbg !247
  %32 = load i8, ptr %arrayidx53, align 1, !dbg !247
  %conv54 = sext i8 %32 to i32, !dbg !247
  %33 = load i32, ptr %ox, align 4, !dbg !248
  %34 = load i32, ptr %x, align 4, !dbg !249
  %cmp55 = icmp eq i32 %33, %34, !dbg !250
  %35 = load i32, ptr %oy, align 4, !dbg !251
  %36 = load i32, ptr %y, align 4, !dbg !251
  %cmp57 = icmp eq i32 %35, %36, !dbg !251
  %37 = select i1 %cmp55, i1 %cmp57, i1 false, !dbg !251
  %38 = zext i1 %37 to i64, !dbg !252
  %cond = select i1 %37, ptr @.str.15, ptr @.str.16, !dbg !252
  %call59 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %30, i32 noundef %conv54, ptr noundef %cond), !dbg !253
  %39 = load i32, ptr %ox, align 4, !dbg !254
  %40 = load i32, ptr %x, align 4, !dbg !256
  %cmp60 = icmp eq i32 %39, %40, !dbg !257
  br i1 %cmp60, label %land.lhs.true62, label %if.end67, !dbg !258

land.lhs.true62:                                  ; preds = %if.end50
  %41 = load i32, ptr %oy, align 4, !dbg !259
  %42 = load i32, ptr %y, align 4, !dbg !260
  %cmp63 = icmp eq i32 %41, %42, !dbg !261
  br i1 %cmp63, label %if.then65, label %if.end67, !dbg !262

if.then65:                                        ; preds = %land.lhs.true62
  %call66 = call i32 (ptr, ...) @printf(ptr noundef @.str.17), !dbg !263
  call void @exit(i32 noundef -2) #4, !dbg !265
  unreachable, !dbg !265

if.end67:                                         ; preds = %land.lhs.true62, %if.end50
  %43 = load i32, ptr %y, align 4, !dbg !266
  %idxprom68 = sext i32 %43 to i64, !dbg !267
  %arrayidx69 = getelementptr inbounds [10 x [12 x i8]], ptr @maze, i64 0, i64 %idxprom68, !dbg !267
  %44 = load i32, ptr %x, align 4, !dbg !268
  %idxprom70 = sext i32 %44 to i64, !dbg !267
  %arrayidx71 = getelementptr inbounds [12 x i8], ptr %arrayidx69, i64 0, i64 %idxprom70, !dbg !267
  store i8 88, ptr %arrayidx71, align 1, !dbg !269
  call void @draw(), !dbg !270
  %45 = load i32, ptr %i, align 4, !dbg !271
  %inc72 = add nsw i32 %45, 1, !dbg !271
  store i32 %inc72, ptr %i, align 4, !dbg !271
  %call73 = call i32 @sleep(i32 noundef 1), !dbg !272
  br label %while.cond, !dbg !188, !llvm.loop !273

while.end:                                        ; preds = %while.cond
  %call74 = call i32 (ptr, ...) @printf(ptr noundef @.str.17), !dbg !275
  %46 = load i32, ptr %retval, align 4, !dbg !276
  ret i32 %46, !dbg !276
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @sleep(i32 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!99, !100, !101, !102, !103, !104, !105}
!llvm.ident = !{!106}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "maze", scope: !2, file: !3, line: 20, type: !96, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "maze.c", directory: "/workspace/hw2/task2", checksumkind: CSK_MD5, checksum: "a79691423b97dee6ee1a35a441bf421c")
!4 = !{!0, !5, !11, !16, !21, !26, !31, !36, !41, !46, !51, !56, !61, !66, !68, !73, !79, !84, !89, !94}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(scope: null, file: !3, line: 41, type: !7, isLocal: true, isDefinition: true)
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 24, elements: !9)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !{!10}
!10 = !DISubrange(count: 3)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(scope: null, file: !3, line: 42, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 16, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 2)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(scope: null, file: !3, line: 57, type: !18, isLocal: true, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 64, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 8)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(scope: null, file: !3, line: 65, type: !23, isLocal: true, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 192, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 24)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !3, line: 66, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 152, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 19)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !3, line: 67, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 144, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 18)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !3, line: 68, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 536, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 67)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !3, line: 69, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 224, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 28)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(scope: null, file: !3, line: 98, type: !48, isLocal: true, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 40)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !3, line: 99, type: !53, isLocal: true, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 88, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 11)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !3, line: 107, type: !58, isLocal: true, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 80, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 10)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !3, line: 108, type: !63, isLocal: true, isDefinition: true)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 176, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 22)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !3, line: 109, type: !13, isLocal: true, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !3, line: 109, type: !70, isLocal: true, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 56, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 7)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !3, line: 109, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 184, elements: !77)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!77 = !{!78}
!78 = !DISubrange(count: 23)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !3, line: 122, type: !81, isLocal: true, isDefinition: true)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 272, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 34)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(scope: null, file: !3, line: 122, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 72, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 9)
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(scope: null, file: !3, line: 122, type: !91, isLocal: true, isDefinition: true)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 8, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 1)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(scope: null, file: !3, line: 127, type: !58, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 960, elements: !97)
!97 = !{!60, !98}
!98 = !DISubrange(count: 12)
!99 = !{i32 7, !"Dwarf Version", i32 5}
!100 = !{i32 2, !"Debug Info Version", i32 3}
!101 = !{i32 1, !"wchar_size", i32 4}
!102 = !{i32 8, !"PIC Level", i32 2}
!103 = !{i32 7, !"PIE Level", i32 2}
!104 = !{i32 7, !"uwtable", i32 2}
!105 = !{i32 7, !"frame-pointer", i32 2}
!106 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!107 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 35, type: !108, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !110)
!108 = !DISubroutineType(types: !109)
!109 = !{null}
!110 = !{}
!111 = !DILocalVariable(name: "i", scope: !107, file: !3, line: 37, type: !112)
!112 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!113 = !DILocation(line: 37, column: 6, scope: !107)
!114 = !DILocalVariable(name: "j", scope: !107, file: !3, line: 37, type: !112)
!115 = !DILocation(line: 37, column: 9, scope: !107)
!116 = !DILocation(line: 38, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !3, line: 38, column: 2)
!118 = !DILocation(line: 38, column: 7, scope: !117)
!119 = !DILocation(line: 38, column: 14, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !3, line: 38, column: 2)
!121 = !DILocation(line: 38, column: 16, scope: !120)
!122 = !DILocation(line: 38, column: 2, scope: !117)
!123 = !DILocation(line: 40, column: 10, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !3, line: 40, column: 3)
!125 = distinct !DILexicalBlock(scope: !120, file: !3, line: 39, column: 2)
!126 = !DILocation(line: 40, column: 8, scope: !124)
!127 = !DILocation(line: 40, column: 15, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 40, column: 3)
!129 = !DILocation(line: 40, column: 17, scope: !128)
!130 = !DILocation(line: 40, column: 3, scope: !124)
!131 = !DILocation(line: 41, column: 22, scope: !128)
!132 = !DILocation(line: 41, column: 17, scope: !128)
!133 = !DILocation(line: 41, column: 25, scope: !128)
!134 = !DILocation(line: 41, column: 4, scope: !128)
!135 = !DILocation(line: 40, column: 23, scope: !128)
!136 = !DILocation(line: 40, column: 3, scope: !128)
!137 = distinct !{!137, !130, !138, !139}
!138 = !DILocation(line: 41, column: 27, scope: !124)
!139 = !{!"llvm.loop.mustprogress"}
!140 = !DILocation(line: 42, column: 3, scope: !125)
!141 = !DILocation(line: 38, column: 22, scope: !120)
!142 = !DILocation(line: 38, column: 2, scope: !120)
!143 = distinct !{!143, !122, !144, !139}
!144 = !DILocation(line: 43, column: 2, scope: !117)
!145 = !DILocation(line: 44, column: 2, scope: !107)
!146 = !DILocation(line: 45, column: 1, scope: !107)
!147 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 50, type: !148, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !110)
!148 = !DISubroutineType(types: !149)
!149 = !{!112, !112, !150}
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!152 = !DILocalVariable(name: "argc", arg: 1, scope: !147, file: !3, line: 50, type: !112)
!153 = !DILocation(line: 50, column: 14, scope: !147)
!154 = !DILocalVariable(name: "argv", arg: 2, scope: !147, file: !3, line: 50, type: !150)
!155 = !DILocation(line: 50, column: 26, scope: !147)
!156 = !DILocalVariable(name: "x", scope: !147, file: !3, line: 52, type: !112)
!157 = !DILocation(line: 52, column: 6, scope: !147)
!158 = !DILocalVariable(name: "y", scope: !147, file: !3, line: 52, type: !112)
!159 = !DILocation(line: 52, column: 9, scope: !147)
!160 = !DILocalVariable(name: "ox", scope: !147, file: !3, line: 53, type: !112)
!161 = !DILocation(line: 53, column: 6, scope: !147)
!162 = !DILocalVariable(name: "oy", scope: !147, file: !3, line: 53, type: !112)
!163 = !DILocation(line: 53, column: 10, scope: !147)
!164 = !DILocalVariable(name: "i", scope: !147, file: !3, line: 54, type: !112)
!165 = !DILocation(line: 54, column: 6, scope: !147)
!166 = !DILocalVariable(name: "program", scope: !147, file: !3, line: 56, type: !167)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 304, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: 38)
!170 = !DILocation(line: 56, column: 7, scope: !147)
!171 = !DILocation(line: 57, column: 21, scope: !147)
!172 = !DILocation(line: 57, column: 2, scope: !147)
!173 = !DILocation(line: 60, column: 4, scope: !147)
!174 = !DILocation(line: 61, column: 4, scope: !147)
!175 = !DILocation(line: 62, column: 7, scope: !147)
!176 = !DILocation(line: 62, column: 2, scope: !147)
!177 = !DILocation(line: 62, column: 10, scope: !147)
!178 = !DILocation(line: 62, column: 13, scope: !147)
!179 = !DILocation(line: 65, column: 2, scope: !147)
!180 = !DILocation(line: 66, column: 32, scope: !147)
!181 = !DILocation(line: 66, column: 35, scope: !147)
!182 = !DILocation(line: 66, column: 2, scope: !147)
!183 = !DILocation(line: 67, column: 31, scope: !147)
!184 = !DILocation(line: 67, column: 2, scope: !147)
!185 = !DILocation(line: 68, column: 2, scope: !147)
!186 = !DILocation(line: 69, column: 2, scope: !147)
!187 = !DILocation(line: 72, column: 2, scope: !147)
!188 = !DILocation(line: 77, column: 2, scope: !147)
!189 = !DILocation(line: 77, column: 9, scope: !147)
!190 = !DILocation(line: 77, column: 11, scope: !147)
!191 = !DILocation(line: 80, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !147, file: !3, line: 78, column: 2)
!193 = !DILocation(line: 80, column: 6, scope: !192)
!194 = !DILocation(line: 81, column: 8, scope: !192)
!195 = !DILocation(line: 81, column: 6, scope: !192)
!196 = !DILocation(line: 83, column: 19, scope: !192)
!197 = !DILocation(line: 83, column: 11, scope: !192)
!198 = !DILocation(line: 83, column: 3, scope: !192)
!199 = !DILocation(line: 86, column: 5, scope: !200)
!200 = distinct !DILexicalBlock(scope: !192, file: !3, line: 84, column: 3)
!201 = !DILocation(line: 87, column: 4, scope: !200)
!202 = !DILocation(line: 89, column: 5, scope: !200)
!203 = !DILocation(line: 90, column: 4, scope: !200)
!204 = !DILocation(line: 92, column: 5, scope: !200)
!205 = !DILocation(line: 93, column: 4, scope: !200)
!206 = !DILocation(line: 95, column: 5, scope: !200)
!207 = !DILocation(line: 96, column: 4, scope: !200)
!208 = !DILocation(line: 98, column: 4, scope: !200)
!209 = !DILocation(line: 99, column: 4, scope: !200)
!210 = !DILocation(line: 101, column: 4, scope: !200)
!211 = !DILocation(line: 105, column: 12, scope: !212)
!212 = distinct !DILexicalBlock(scope: !192, file: !3, line: 105, column: 7)
!213 = !DILocation(line: 105, column: 7, scope: !212)
!214 = !DILocation(line: 105, column: 15, scope: !212)
!215 = !DILocation(line: 105, column: 18, scope: !212)
!216 = !DILocation(line: 105, column: 7, scope: !192)
!217 = !DILocation(line: 107, column: 4, scope: !218)
!218 = distinct !DILexicalBlock(scope: !212, file: !3, line: 106, column: 3)
!219 = !DILocation(line: 108, column: 37, scope: !218)
!220 = !DILocation(line: 108, column: 4, scope: !218)
!221 = !DILocation(line: 109, column: 4, scope: !218)
!222 = !DILocation(line: 113, column: 12, scope: !223)
!223 = distinct !DILexicalBlock(scope: !192, file: !3, line: 113, column: 7)
!224 = !DILocation(line: 113, column: 7, scope: !223)
!225 = !DILocation(line: 113, column: 15, scope: !223)
!226 = !DILocation(line: 113, column: 18, scope: !223)
!227 = !DILocation(line: 113, column: 25, scope: !223)
!228 = !DILocation(line: 114, column: 7, scope: !223)
!229 = !DILocation(line: 114, column: 9, scope: !223)
!230 = !DILocation(line: 114, column: 14, scope: !223)
!231 = !DILocation(line: 114, column: 22, scope: !223)
!232 = !DILocation(line: 114, column: 17, scope: !223)
!233 = !DILocation(line: 114, column: 25, scope: !223)
!234 = !DILocation(line: 114, column: 28, scope: !223)
!235 = !DILocation(line: 114, column: 35, scope: !223)
!236 = !DILocation(line: 116, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !223, file: !3, line: 115, column: 3)
!238 = !DILocation(line: 116, column: 6, scope: !237)
!239 = !DILocation(line: 117, column: 8, scope: !237)
!240 = !DILocation(line: 117, column: 6, scope: !237)
!241 = !DILocation(line: 118, column: 3, scope: !237)
!242 = !DILocation(line: 121, column: 33, scope: !192)
!243 = !DILocation(line: 121, column: 36, scope: !192)
!244 = !DILocation(line: 121, column: 3, scope: !192)
!245 = !DILocation(line: 122, column: 48, scope: !192)
!246 = !DILocation(line: 122, column: 59, scope: !192)
!247 = !DILocation(line: 122, column: 51, scope: !192)
!248 = !DILocation(line: 122, column: 65, scope: !192)
!249 = !DILocation(line: 122, column: 71, scope: !192)
!250 = !DILocation(line: 122, column: 68, scope: !192)
!251 = !DILocation(line: 122, column: 73, scope: !192)
!252 = !DILocation(line: 122, column: 64, scope: !192)
!253 = !DILocation(line: 122, column: 3, scope: !192)
!254 = !DILocation(line: 125, column: 7, scope: !255)
!255 = distinct !DILexicalBlock(scope: !192, file: !3, line: 125, column: 7)
!256 = !DILocation(line: 125, column: 13, scope: !255)
!257 = !DILocation(line: 125, column: 10, scope: !255)
!258 = !DILocation(line: 125, column: 15, scope: !255)
!259 = !DILocation(line: 125, column: 18, scope: !255)
!260 = !DILocation(line: 125, column: 24, scope: !255)
!261 = !DILocation(line: 125, column: 21, scope: !255)
!262 = !DILocation(line: 125, column: 7, scope: !192)
!263 = !DILocation(line: 127, column: 4, scope: !264)
!264 = distinct !DILexicalBlock(scope: !255, file: !3, line: 126, column: 3)
!265 = !DILocation(line: 128, column: 4, scope: !264)
!266 = !DILocation(line: 131, column: 8, scope: !192)
!267 = !DILocation(line: 131, column: 3, scope: !192)
!268 = !DILocation(line: 131, column: 11, scope: !192)
!269 = !DILocation(line: 131, column: 14, scope: !192)
!270 = !DILocation(line: 133, column: 3, scope: !192)
!271 = !DILocation(line: 135, column: 4, scope: !192)
!272 = !DILocation(line: 137, column: 3, scope: !192)
!273 = distinct !{!273, !188, !274, !139}
!274 = !DILocation(line: 138, column: 2, scope: !147)
!275 = !DILocation(line: 140, column: 2, scope: !147)
!276 = !DILocation(line: 141, column: 1, scope: !147)
